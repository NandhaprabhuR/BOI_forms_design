// lib/screens/pdfdesign1.dart

import 'dart:typed_data';
import 'dart:io';
import 'dart:convert'; // <--- ADDED for Base64
import 'package:boiforms/screens/pdf_helpers.dart';
import 'package:boiforms/screens/pdfdesign2.dart';
import 'package:boiforms/screens/pdfdesign3.dart';
import 'package:boiforms/screens/pdfdesign4.dart';
import 'package:boiforms/screens/pdfdesign5.dart';
import 'package:boiforms/screens/pdfdesign6.dart';
import 'package:boiforms/screens/pdfdesign7.dart';
import 'package:boiforms/screens/pdfdesign8.dart';
import 'package:boiforms/screens/pdfdesign9.dart';
import 'package:boiforms/screens/pdfdesign10.dart';
import 'package:boiforms/screens/signature_path_helper.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

// Adjust this import path if your file is in a different location
import 'model/data-importer.dart';
import 'model/form_data_model.dart';

// --- MODIFIED: Converted to StatefulWidget ---
class PdfDesignPage extends StatefulWidget {
  final FormDataModel formData; // For the single preview
  final bool autoPreview; // Auto-show PDF preview when page loads

  const PdfDesignPage({
    super.key,
    required this.formData,
    this.autoPreview = false,
  });

  @override
  State<PdfDesignPage> createState() => _PdfDesignPageState();
}

class _PdfDesignPageState extends State<PdfDesignPage> {
  // --- ADDED: State variables ---
  List<FormDataModel> _importedData = [];
  String _importMessage = "";
  bool _isGenerating = false;

  @override
  void initState() {
    super.initState();
    // Auto-preview PDF if enabled
    if (widget.autoPreview) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showPdfPreview();
      });
    }
  }

  // Method to show PDF preview
  void _showPdfPreview() {
    Printing.layoutPdf(
      onLayout: (format) async {
        final List<int> bytes = await _generatePdfBytesFromModel(
          widget.formData,
        );
        return Uint8List.fromList(bytes);
      },
    );
  }

  // --- HELPER WIDGETS (CLASS LEVEL) ---
  // (Standard helper methods here)
  pw.Widget _formField(
    String label,
    pw.Widget child, {
    pw.Widget? subLabel,
    double width = 100,
  }) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.SizedBox(
          width: width,
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(label, style: const pw.TextStyle(fontSize: 7.5)),
              if (subLabel != null) subLabel,
            ],
          ),
        ),
        pw.SizedBox(width: 4),
        pw.Expanded(child: child),
      ],
    );
  }

  pw.Widget _charBoxWithLabel(String char, String label) {
    // FIX: Safely pad the char
    final safeChar = char.padRight(1, ' ');
    return pw.Column(
      children: [
        charBoxes(safeChar.substring(0, 1), 1, width: 13, height: 13),
        pw.SizedBox(height: 1),
        pw.Text(label, style: const pw.TextStyle(fontSize: 6)),
      ],
    );
  }

  pw.Widget _underlinedText(double width) {
    return pw.Container(
      width: width,
      height: 8,
      decoration: const pw.BoxDecoration(
        border: pw.Border(bottom: pw.BorderSide(width: 0.5)),
      ),
    );
  }

  pw.Widget _emptyRectBox({double width = 80, double height = 14}) {
    return pw.Container(
      width: width,
      height: height,
      decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
    );
  }

  // Helper method to check if a string is Base64
  bool _isBase64(String str) {
    try {
      // Base64 strings should be at least 4 characters and be divisible by 4 (with padding)
      if (str.length < 4) return false;

      // Try to decode - if it works, it's Base64
      base64Decode(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  // --- CORE PDF GENERATION LOGIC (METHOD DEFINED INSIDE CLASS) ---
  Future<List<int>> _generatePdfBytesFromModel(FormDataModel model) async {
    final pdf = pw.Document();

    // --- LOAD SIGNATURE IMAGES ---
    pw.MemoryImage? signature1Image;
    pw.MemoryImage? signature2Image;
    pw.MemoryImage? applicantPhoto;
    pw.MemoryImage? applicantSignature;

    print('🔍 Attempting to load signatures...');
    print('📝 Signature 1 Path: ${model.signature1Text}');
    print('📝 Signature 2 Path: ${model.signature2Text}');
    print('📝 Applicant Photo Path: ${model.applicantPhoto}');
    print('📝 Applicant Signature Path: ${model.applicantSignatureImage}');

    // --- SIGNATURE 1 ---
    try {
      if (model.signature1Text.isNotEmpty) {
        print('🔎 Checking signature 1...');

        // Check if it's Base64 encoded (starts with data:image or is pure base64)
        if (model.signature1Text.startsWith('data:image')) {
          // Handle data URL format: data:image/png;base64,iVBORw0KG...
          final base64String = model.signature1Text.split(',')[1];
          final bytes = base64Decode(base64String);
          signature1Image = pw.MemoryImage(bytes);
          print(
            '✅ Signature 1 loaded from Base64 data URL: ${bytes.length} bytes',
          );
        } else if (_isBase64(model.signature1Text)) {
          // Pure Base64 string
          final bytes = base64Decode(model.signature1Text);
          signature1Image = pw.MemoryImage(bytes);
          print('✅ Signature 1 loaded from Base64: ${bytes.length} bytes');
        } else {
          // File path
          final file = File(model.signature1Text);
          final exists = await file.exists();
          print('📁 Signature 1 file exists: $exists');

          if (exists) {
            final bytes = await file.readAsBytes();
            print('✅ Signature 1 loaded from file: ${bytes.length} bytes');
            signature1Image = pw.MemoryImage(bytes);
          } else {
            print('❌ Signature 1 file not found at: ${model.signature1Text}');
          }
        }
      } else {
        print('⚠️ Signature 1 path is empty');
      }
    } catch (e) {
      print('❌ Error loading signature 1: $e');
    }

    // --- SIGNATURE 2 ---
    try {
      if (model.signature2Text.isNotEmpty) {
        print('🔎 Checking signature 2...');

        // Check if it's Base64 encoded
        if (model.signature2Text.startsWith('data:image')) {
          final base64String = model.signature2Text.split(',')[1];
          final bytes = base64Decode(base64String);
          signature2Image = pw.MemoryImage(bytes);
          print(
            '✅ Signature 2 loaded from Base64 data URL: ${bytes.length} bytes',
          );
        } else if (_isBase64(model.signature2Text)) {
          final bytes = base64Decode(model.signature2Text);
          signature2Image = pw.MemoryImage(bytes);
          print('✅ Signature 2 loaded from Base64: ${bytes.length} bytes');
        } else {
          // File path
          final file = File(model.signature2Text);
          final exists = await file.exists();
          print('📁 Signature 2 file exists: $exists');

          if (exists) {
            final bytes = await file.readAsBytes();
            print('✅ Signature 2 loaded from file: ${bytes.length} bytes');
            signature2Image = pw.MemoryImage(bytes);
          } else {
            print('❌ Signature 2 file not found at: ${model.signature2Text}');
          }
        }
      } else {
        print('⚠️ Signature 2 path is empty');
      }
    } catch (e) {
      print('❌ Error loading signature 2: $e');
    }

    // --- APPLICANT PHOTO ---
    try {
      if (model.applicantPhoto.isNotEmpty) {
        print('🔎 Checking applicant photo...');

        if (model.applicantPhoto.startsWith('data:image')) {
          final base64String = model.applicantPhoto.split(',')[1];
          final bytes = base64Decode(base64String);
          applicantPhoto = pw.MemoryImage(bytes);
          print(
            '✅ Applicant photo loaded from Base64 data URL: ${bytes.length} bytes',
          );
        } else if (_isBase64(model.applicantPhoto)) {
          final bytes = base64Decode(model.applicantPhoto);
          applicantPhoto = pw.MemoryImage(bytes);
          print('✅ Applicant photo loaded from Base64: ${bytes.length} bytes');
        } else {
          final file = File(model.applicantPhoto);
          final exists = await file.exists();
          print('📁 Applicant photo file exists: $exists');

          if (exists) {
            final bytes = await file.readAsBytes();
            print('✅ Applicant photo loaded from file: ${bytes.length} bytes');
            applicantPhoto = pw.MemoryImage(bytes);
          } else {
            print(
              '❌ Applicant photo file not found at: ${model.applicantPhoto}',
            );
          }
        }
      } else {
        print('⚠️ Applicant photo path is empty');
      }
    } catch (e) {
      print('❌ Error loading applicant photo: $e');
    }

    // --- APPLICANT SIGNATURE ---
    try {
      if (model.applicantSignatureImage.isNotEmpty) {
        print('🔎 Checking applicant signature...');

        if (model.applicantSignatureImage.startsWith('data:image')) {
          final base64String = model.applicantSignatureImage.split(',')[1];
          final bytes = base64Decode(base64String);
          applicantSignature = pw.MemoryImage(bytes);
          print(
            '✅ Applicant signature loaded from Base64 data URL: ${bytes.length} bytes',
          );
        } else if (_isBase64(model.applicantSignatureImage)) {
          final bytes = base64Decode(model.applicantSignatureImage);
          applicantSignature = pw.MemoryImage(bytes);
          print(
            '✅ Applicant signature loaded from Base64: ${bytes.length} bytes',
          );
        } else {
          final file = File(model.applicantSignatureImage);
          final exists = await file.exists();
          print('📁 Applicant signature file exists: $exists');

          if (exists) {
            final bytes = await file.readAsBytes();
            print(
              '✅ Applicant signature loaded from file: ${bytes.length} bytes',
            );
            applicantSignature = pw.MemoryImage(bytes);
          } else {
            print(
              '❌ Applicant signature file not found at: ${model.applicantSignatureImage}',
            );
          }
        }
      } else {
        print('⚠️ Applicant signature path is empty');
      }
    } catch (e) {
      print('❌ Error loading applicant signature: $e');
    }

    // --- OFFICIAL SIGNATURE ---
    pw.MemoryImage? officialSignature;
    try {
      if (model.officialSignature.isNotEmpty) {
        print('🔎 Checking official signature...');

        if (model.officialSignature.startsWith('data:image')) {
          final base64String = model.officialSignature.split(',')[1];
          final bytes = base64Decode(base64String);
          officialSignature = pw.MemoryImage(bytes);
          print(
            '✅ Official signature loaded from Base64 data URL: ${bytes.length} bytes',
          );
        } else if (_isBase64(model.officialSignature)) {
          final bytes = base64Decode(model.officialSignature);
          officialSignature = pw.MemoryImage(bytes);
          print(
            '✅ Official signature loaded from Base64: ${bytes.length} bytes',
          );
        } else {
          final file = File(model.officialSignature);
          final exists = await file.exists();
          print('📁 Official signature file exists: $exists');

          if (exists) {
            final bytes = await file.readAsBytes();
            print(
              '✅ Official signature loaded from file: ${bytes.length} bytes',
            );
            officialSignature = pw.MemoryImage(bytes);
          } else {
            print(
              '❌ Official signature file not found at: ${model.officialSignature}',
            );
          }
        }
      } else {
        print('⚠️ Official signature path is empty');
      }
    } catch (e) {
      print('❌ Error loading official signature: $e');
    }

    print(
      '🎯 Final status - Signature 1: ${signature1Image != null ? "LOADED" : "NOT LOADED"}',
    );
    print(
      '🎯 Final status - Signature 2: ${signature2Image != null ? "LOADED" : "NOT LOADED"}',
    );
    print(
      '🎯 Final status - Applicant Photo: ${applicantPhoto != null ? "LOADED" : "NOT LOADED"}',
    );
    print(
      '🎯 Final status - Applicant Signature: ${applicantSignature != null ? "LOADED" : "NOT LOADED"}',
    );
    print(
      '🎯 Final status - Official Signature: ${officialSignature != null ? "LOADED" : "NOT LOADED"}',
    );

    final addressData = {
      'address': model.currentAddress,
      'city': model.currentCity,
      'district': model.currentDistrict,
      'state': model.currentState,
      'pin': model.currentPin,
    };

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(15),
        footer: (pw.Context context) {
          return pw.Container(
            alignment: pw.Alignment.center,
            child: pw.Text(
              '${context.pageNumber}',
              style: pw.Theme.of(
                context,
              ).defaultTextStyle.copyWith(color: PdfColors.grey),
            ),
          );
        },
        build: (pw.Context context) => <pw.Widget>[
          // --- PAGE 1 CONTENT ---
          pw.Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.black, width: 1),
            ),
            padding: const pw.EdgeInsets.all(10),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _buildHeader(model),
                _buildPersonalDetails(model),
                pw.SizedBox(height: 5),
                _buildContactDetails(model),
                pw.SizedBox(height: 5),
                _buildProofOfIdentity(model),
                pw.SizedBox(height: 5),
                _buildAddressSection(
                  title: '4. Address details',
                  tabs: ['Current', 'Permanent', 'Overseas'],
                  data: addressData,
                ),
              ],
            ),
          ),
          // --- PASS MODEL TO ALL OTHER PAGES ---
          buildSecondPage(
            model,
            signature1Image,
            signature2Image,
            applicantPhoto,
            applicantSignature,
            officialSignature,
          ),
          buildThirdPage(model),
          buildFourthPage(model, signature1Image, signature2Image),
          buildFifthPage(model, signature1Image: signature1Image),
          buildSixthPage(model),
          buildSeventhPage(model),
          buildEighthPage(model),
          buildNinthPage(model),
          buildTenthPage(
            model,
            signature1Image: signature1Image,
            signature2Image: signature2Image,
          ),
        ],
      ),
    );

    return pdf.save(); // Return the PDF bytes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Form Preview'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.image),
            tooltip: 'Get Signature Paths',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignaturePathHelper(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button 1: Generate single PDF using the default/current in-app data
            ElevatedButton(
              child: const Text("Generate Single PDF (Current Data)"),
              onPressed: () {
                Printing.layoutPdf(
                  onLayout: (format) async {
                    final List<int> bytes = await _generatePdfBytesFromModel(
                      widget.formData,
                    );
                    return Uint8List.fromList(bytes);
                  },
                );
              },
            ),

            const SizedBox(height: 20),

            // --- MODIFIED: Bulk Import/Generate Section ---

            // Button 2: Bulk Import
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Import Excel (XLSX) File"),
              onPressed: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);

                if (!context.mounted) return;

                final List<FormDataModel> result;
                try {
                  result = await importBulkData();
                } catch (e) {
                  scaffoldMessenger.showSnackBar(
                    SnackBar(content: Text('Error importing: ${e.toString()}')),
                  );
                  return;
                }

                if (!context.mounted) return;

                if (result.isEmpty) {
                  scaffoldMessenger.showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Bulk import failed, file was empty, or operation cancelled.',
                      ),
                    ),
                  );
                  setState(() {
                    _importedData = [];
                    _importMessage = "";
                  });
                } else {
                  // SUCCESS: Update state to show the new button
                  setState(() {
                    _importedData = result;
                    _importMessage =
                        "${result.length} record(s) imported successfully.";
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            // --- ADDED: Conditional UI for Generation ---
            if (_importedData.isNotEmpty && !_isGenerating)
              Column(
                children: [
                  Text(
                    _importMessage,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Button 3: Generate from imported data
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text(
                      "Click to Generate PDFs from Imported Data",
                    ),
                    onPressed: () async {
                      // Show loading indicator
                      setState(() {
                        _isGenerating = true;
                      });

                      final scaffoldMessenger = ScaffoldMessenger.of(context);

                      try {
                        // --- THIS IS THE KEY CHANGE ---
                        // 1. Get the first (or only) imported model
                        final modelToPreview = _importedData.first;

                        // 2. Call Printing.layoutPdf to show the preview
                        await Printing.layoutPdf(
                          onLayout: (format) async {
                            final List<int> bytes =
                                await _generatePdfBytesFromModel(
                                  modelToPreview,
                                );
                            return Uint8List.fromList(bytes);
                          },
                        );
                        // --- END OF CHANGE ---
                      } catch (e) {
                        if (!context.mounted) return;
                        scaffoldMessenger.showSnackBar(
                          SnackBar(
                            content: Text(
                              'Error generating PDF: ${e.toString()}',
                            ),
                          ),
                        );
                      }

                      if (!context.mounted) return;

                      // Hide generation button and reset
                      setState(() {
                        _isGenerating = false;
                        _importedData = [];
                        _importMessage = "";
                      });
                    },
                  ),
                ],
              ),

            // Show a loading indicator while PDFs are being generated
            if (_isGenerating)
              const Column(
                children: [
                  Text("Generating PDFs..."),
                  SizedBox(height: 10),
                  CircularProgressIndicator(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  // --- PDF Builder Methods (Start of helper definitions) ---
  // (All builder methods below are unchanged)

  // Builder Placeholder 1: Address Section
  pw.Widget _buildAddressSection({
    required String title,
    required List<String> tabs,
    required Map<String, String> data,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          decoration: const pw.BoxDecoration(
            color: PdfColors.grey200,
            border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey600)),
          ),
          padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: pw.Row(
            children: [
              pw.Text(
                title,
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 8,
                ),
              ),
              pw.SizedBox(width: 20),
              ...tabs.map(
                (tab) => pw.Container(
                  margin: const pw.EdgeInsets.symmetric(horizontal: 8),
                  padding: const pw.EdgeInsets.symmetric(horizontal: 6),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.grey600),
                    color: PdfColors.white,
                  ),
                  child: pw.Text(tab, style: const pw.TextStyle(fontSize: 7.5)),
                ),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 3),
        pw.Row(
          children: [
            pw.Text('Address type*', style: const pw.TextStyle(fontSize: 8)),
            pw.SizedBox(width: 10),
            labeledCheckbox('Residential/Business', checked: true),
            pw.SizedBox(width: 8),
            labeledCheckbox('Residential'),
            pw.SizedBox(width: 8),
            labeledCheckbox('Business'),
            pw.SizedBox(width: 8),
            labeledCheckbox('Registered Office'),
            pw.SizedBox(width: 8),
            labeledCheckbox('Unspecified'),
          ],
        ),
        pw.SizedBox(height: 3),
        pw.Row(
          children: [
            pw.Text('Address*', style: const pw.TextStyle(fontSize: 8)),
            pw.SizedBox(width: 10),
            pw.Expanded(child: charBoxes(data['address']!, 35)),
          ],
        ),
        pw.SizedBox(height: 2),
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 60),
          child: charBoxes('', 35),
        ),
        pw.SizedBox(height: 3),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: pw.Column(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 50,
                        child: pw.Text(
                          'City/Village*',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                      ),
                      charBoxes(data['city']!, 15),
                    ],
                  ),
                  pw.SizedBox(height: 2),
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 50,
                        child: pw.Text(
                          'State*',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                      ),
                      charBoxes(data['state']!, 15),
                    ],
                  ),
                ],
              ),
            ),
            pw.SizedBox(width: 20),
            pw.Expanded(
              child: pw.Column(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 40,
                        child: pw.Text(
                          'District*',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                      ),
                      charBoxes(data['district']!, 15),
                    ],
                  ),
                  pw.SizedBox(height: 2),
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 40,
                        child: pw.Text(
                          'Pin*',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                      ),
                      charBoxes(data['pin']!, 6),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Builder Placeholder 2: Proof of Identity
  pw.Widget _buildProofOfIdentity(FormDataModel data) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: double.infinity,
          color: PdfColors.grey200,
          padding: const pw.EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: pw.Text(
            '3. Proof of Identity/Address (Please tick the appropriate Box (any one ID type) and give details)*',
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 8.5,
              color: PdfColors.black,
            ),
          ),
        ),
        pw.SizedBox(height: 2),
        pw.Row(
          children: [
            pw.Expanded(child: labeledCheckbox('A-PASSPORT')),
            pw.Expanded(child: labeledCheckbox('B-VOTER\'S IDENTITY CARD')),
            pw.Expanded(child: labeledCheckbox('C-DRIVING LICENCE')),
            pw.Expanded(
              child: labeledCheckbox(
                'D-Proof of possession of AADHAAR',
                checked: true,
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 2),
        pw.Row(
          children: [
            pw.Expanded(child: labeledCheckbox('E-NREGA JOB CARD')),
            pw.Expanded(
              flex: 3,
              child: labeledCheckbox(
                'F-LETTER ISSUED BY NATIONAL POPULATION REGISTER CONTAINING DETAILS OF NAME & ADDRESS',
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 3),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text(
              'Document No./Identification Number*',
              style: const pw.TextStyle(fontSize: 7.5),
            ),
            pw.SizedBox(width: 8),
            charBoxes(data.aadharDocNo, 12),
            pw.SizedBox(width: 4),
            pw.Expanded(child: charBoxes('', 10)),
          ],
        ),
        pw.SizedBox(height: 3),
        pw.Row(
          children: [
            pw.Text('Issue Date:*', style: const pw.TextStyle(fontSize: 7.5)),
            pw.SizedBox(width: 8),
            _charBoxWithLabel('', 'D'),
            _charBoxWithLabel('', 'D'),
            pw.SizedBox(width: 3),
            _charBoxWithLabel('', 'M'),
            _charBoxWithLabel('', 'M'),
            pw.SizedBox(width: 3),
            _charBoxWithLabel('', 'Y'),
            _charBoxWithLabel('', 'Y'),
            _charBoxWithLabel('', 'Y'),
            _charBoxWithLabel('', 'Y'),
            pw.Spacer(),
            pw.Text(
              'Expiry Date (If applicable)*',
              style: const pw.TextStyle(fontSize: 7.5),
            ),
            pw.SizedBox(width: 8),
            _charBoxWithLabel('', 'D'),
            _charBoxWithLabel('', 'D'),
            pw.SizedBox(width: 3),
            _charBoxWithLabel('', 'M'),
            _charBoxWithLabel('', 'M'),
            pw.SizedBox(width: 3),
            _charBoxWithLabel('', 'Y'),
            _charBoxWithLabel('', 'Y'),
            _charBoxWithLabel('', 'Y'),
            _charBoxWithLabel('', 'Y'),
            pw.SizedBox(width: 15),
          ],
        ),
      ],
    );
  }

  // Builder Placeholder 3: Contact Details
  pw.Widget _buildContactDetails(FormDataModel data) {
    // ===== FIX: Safely pad the mobile number to prevent substring errors =====
    final safeMobile = data.mobileNo.padRight(13, ' ');
    // =======================================================================

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: double.infinity,
          color: PdfColors.grey200,
          padding: const pw.EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                '2. Contact Details',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 8.5,
                  color: PdfColors.black,
                ),
              ),
              pw.Text(
                '(All communications will be sent on provided Mobile No./Email-ID)',
                style: const pw.TextStyle(fontSize: 6.5),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 3),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text('Mobile No.', style: const pw.TextStyle(fontSize: 7.5)),
            pw.SizedBox(width: 4),
            // ===== FIX: Use the safeMobile string =====
            charBoxes(safeMobile.substring(0, 3), 3),
            pw.SizedBox(width: 4),
            charBoxes(safeMobile.substring(3, 13), 10),
            // ==========================================
            pw.SizedBox(width: 12),
            pw.Text('Email ID', style: const pw.TextStyle(fontSize: 7.5)),
            pw.SizedBox(width: 4),
            pw.Expanded(child: charBoxes(data.emailId, 22)),
          ],
        ),
        pw.SizedBox(height: 3),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Alternate Mob. No.',
              style: const pw.TextStyle(fontSize: 7.5),
            ),
            pw.SizedBox(width: 4),
            charBoxes('', 3),
            pw.SizedBox(width: 4),
            charBoxes('', 10),
            pw.Spacer(),
            pw.Column(
              mainAxisSize: pw.MainAxisSize.min,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Row(
                  children: [
                    pw.Text(
                      'Tel(Off):',
                      style: const pw.TextStyle(fontSize: 7.5),
                    ),
                    pw.SizedBox(width: 4),
                    charBoxes('', 15),
                  ],
                ),
                pw.SizedBox(height: 2),
                pw.Row(
                  children: [
                    pw.Text(
                      'Tel(Res):',
                      style: const pw.TextStyle(fontSize: 7.5),
                    ),
                    pw.SizedBox(width: 4),
                    charBoxes('', 15),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // Builder Placeholder 4: Personal Details
  pw.Widget _buildPersonalDetails(FormDataModel data) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: double.infinity,
          color: PdfColors.grey200,
          padding: const pw.EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: pw.Text(
            '1. Personal Details',
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 8.5,
              color: PdfColors.black,
            ),
          ),
        ),
        pw.SizedBox(height: 3),
        _buildIdAndBasicInfo(data),
        _buildFamilyAndDependantInfo(data),
        _buildStatusAndCategoryInfo(data),
      ],
    );
  }

  // Builder Placeholder 5: Id and Basic Info
  pw.Widget _buildIdAndBasicInfo(FormDataModel data) {
    // ===== FIX: Safely pad the DOB string to prevent substring errors =====
    final dob = data.dob.padRight(8, ' ');
    // =====================================================================

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _formField(
          'Existing Customer ID:',
          charBoxes('', 15),
          subLabel: pw.Text(
            '(If applicable)',
            style: const pw.TextStyle(fontSize: 6.5),
          ),
        ),
        pw.SizedBox(height: 1),
        _formField(
          'Name*',
          pw.Row(
            children: [
              pw.Column(
                children: [
                  charBoxes(data.customerPrefix, 4),
                  pw.Text('Prefix', style: const pw.TextStyle(fontSize: 6.5)),
                ],
              ),
              pw.SizedBox(width: 4),
              pw.Expanded(child: charBoxes(data.customerFirstName, 25)),
            ],
          ),
          subLabel: pw.Text(
            '(Same as ID Proof)',
            style: const pw.TextStyle(fontSize: 6.5),
          ),
        ),
        pw.SizedBox(height: 1),
        _formField(
          'Maiden Name:',
          pw.Row(
            children: [
              pw.Column(
                children: [
                  charBoxes('', 4),
                  pw.Text('Prefix', style: const pw.TextStyle(fontSize: 6.5)),
                ],
              ),
              pw.SizedBox(width: 4),
              pw.Expanded(child: charBoxes('', 25)),
            ],
          ),
        ),
        pw.SizedBox(height: 1),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(
              width: 100,
              child: pw.Text(
                'Date of Birth*',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
            ),
            pw.SizedBox(width: 4),
            pw.Expanded(
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    children: [
                      // ===== FIX: Use the safe 'dob' string =====
                      _charBoxWithLabel(dob.substring(0, 1), 'D'),
                      _charBoxWithLabel(dob.substring(1, 2), 'D'),
                      pw.SizedBox(width: 3),
                      _charBoxWithLabel(dob.substring(2, 3), 'M'),
                      _charBoxWithLabel(dob.substring(3, 4), 'M'),
                      pw.SizedBox(width: 3),
                      _charBoxWithLabel(dob.substring(4, 5), 'Y'),
                      _charBoxWithLabel(dob.substring(5, 6), 'Y'),
                      _charBoxWithLabel(dob.substring(6, 7), 'Y'),
                      _charBoxWithLabel(dob.substring(7, 8), 'Y'),
                      // ==========================================
                    ],
                  ),
                  pw.SizedBox(width: 8),
                  pw.Row(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [
                      pw.Text(
                        'Gender*',
                        style: const pw.TextStyle(fontSize: 7.5),
                      ),
                      pw.SizedBox(width: 3),
                      labeledCheckbox('Male', checked: true),
                      pw.SizedBox(width: 3),
                      labeledCheckbox('Female'),
                      pw.SizedBox(width: 3),
                      labeledCheckbox('Transgender'),
                    ],
                  ),
                  pw.SizedBox(width: 8),
                  pw.Row(
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [
                      pw.Text(
                        'Marital Status*',
                        style: const pw.TextStyle(fontSize: 7.5),
                      ),
                      pw.SizedBox(width: 3),
                      labeledCheckbox('Married', checked: true),
                      pw.SizedBox(width: 3),
                      labeledCheckbox('Unmarried'),
                      pw.SizedBox(width: 3),
                      labeledCheckbox('Others'),
                    ],
                  ),
                  pw.Spacer(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Builder Placeholder 6: Family and Dependants
  pw.Widget _buildFamilyAndDependantInfo(FormDataModel data) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 1),
        _formField('Name of Father*', charBoxes(data.fatherName, 30)),
        pw.SizedBox(height: 1),
        _formField('Name of Mother*', charBoxes(data.motherName, 30)),
        pw.SizedBox(height: 1),
        _formField(
          'Name of Spouse*',
          charBoxes(data.spouseName, 30),
          subLabel: pw.Text(
            '(Father\'s name is mandatory if PAN is not provided)',
            style: const pw.TextStyle(fontSize: 6),
          ),
        ),
        pw.SizedBox(height: 1),
        _formField('No. of Dependents', charBoxes('', 2)),
        pw.SizedBox(height: 1),
        _formField(
          'Illiterate',
          pw.Row(
            children: [
              labeledCheckbox('YES'),
              labeledCheckbox('NO', checked: true),
              pw.SizedBox(width: 8),
              pw.Text(
                'if yes : Identification Marks : ________________________',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 1),
        _formField(
          'Name of Guardian',
          pw.Row(
            children: [
              pw.Column(
                children: [
                  charBoxes('', 4),
                  pw.Text('Prefix', style: const pw.TextStyle(fontSize: 6.5)),
                ],
              ),
              pw.SizedBox(width: 4),
              pw.Expanded(child: charBoxes('', 25)),
            ],
          ),
          subLabel: pw.Text(
            '(In Case of Minor*)',
            style: const pw.TextStyle(fontSize: 6.5),
          ),
        ),
        pw.SizedBox(height: 1),
        _formField('Relationship with Guardian', charBoxes('', 25)),
      ],
    );
  }

  // Builder Placeholder 7: Status and Category
  pw.Widget _buildStatusAndCategoryInfo(FormDataModel data) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 3),
        _formField(
          'Nationality*',
          pw.Row(
            children: [
              labeledCheckbox('In-Indian', checked: true),
              pw.SizedBox(width: 8),
              labeledCheckbox('Others'),
              pw.SizedBox(width: 8),
              pw.Text(
                'Country Name:',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              pw.SizedBox(width: 4),
              pw.Expanded(child: charBoxes('', 15)),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Occupation Type*',
          pw.Column(
            children: [
              pw.Row(
                children: [
                  pw.Expanded(child: labeledCheckbox('S-Service')),
                  pw.Expanded(child: labeledCheckbox('Private Sector')),
                  pw.Expanded(child: labeledCheckbox('Public Sector')),
                  pw.Expanded(child: labeledCheckbox('Government Sector')),
                ],
              ),
              pw.SizedBox(height: 1.5),
              pw.Row(
                children: [
                  pw.Expanded(child: labeledCheckbox('O-Others')),
                  pw.Expanded(child: labeledCheckbox('Professional')),
                  pw.Expanded(child: labeledCheckbox('Self employed')),
                  pw.Expanded(child: labeledCheckbox('Retired')),
                  pw.Expanded(child: labeledCheckbox('House Wife')),
                  pw.Expanded(child: labeledCheckbox('Student')),
                ],
              ),
              pw.SizedBox(height: 1.5),
              pw.Row(
                children: [
                  labeledCheckbox('B-Business'),
                  pw.SizedBox(width: 28),
                  labeledCheckbox(
                    'Agriculture',
                    checked: data.occupationType == 'Agriculture',
                  ),
                  pw.SizedBox(width: 25),
                  labeledCheckbox('X-Not categorised-Please specify...'),
                ],
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Monthly Income*',
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text('Rs.', style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 2),
              _emptyRectBox(width: 80),
              pw.SizedBox(width: 8),
              pw.Text(
                'Net Worth(approx)',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              pw.SizedBox(width: 2),
              pw.Text('Rs.', style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 2),
              _emptyRectBox(width: 60),
              pw.SizedBox(width: 8),
              pw.Text(
                'Est. Annual Turnover',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              pw.SizedBox(width: 2),
              pw.Text('Rs.', style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 2),
              pw.Expanded(child: _emptyRectBox(width: 0)),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Religion:',
          pw.Row(
            children: [
              labeledCheckbox('Hindu', checked: true),
              pw.SizedBox(width: 12),
              labeledCheckbox('Muslim'),
              pw.SizedBox(width: 12),
              labeledCheckbox('Christian'),
              pw.SizedBox(width: 12),
              labeledCheckbox('Sikh'),
              pw.SizedBox(width: 12),
              labeledCheckbox('Others'),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Category:',
          pw.Row(
            children: [
              labeledCheckbox('General'),
              pw.SizedBox(width: 12),
              labeledCheckbox('OBC'),
              pw.SizedBox(width: 12),
              labeledCheckbox('SC'),
              pw.SizedBox(width: 12),
              labeledCheckbox('ST'),
              pw.SizedBox(width: 12),
              labeledCheckbox('Minority'),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Customer Type',
          pw.Row(
            children: [
              labeledCheckbox('General'),
              pw.SizedBox(width: 8),
              labeledCheckbox('Sr. Citizen'),
              pw.SizedBox(width: 8),
              labeledCheckbox('Pensioner'),
              pw.SizedBox(width: 8),
              labeledCheckbox('Minor'),
              pw.SizedBox(width: 8),
              pw.Text(
                'Staff/Ex Staff PF No._______',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              pw.SizedBox(width: 8),
              pw.Text(
                'Others (Specify)_______',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Person with disability',
          pw.Row(
            children: [
              labeledCheckbox('Yes'),
              pw.SizedBox(width: 8),
              labeledCheckbox('No'),
              pw.SizedBox(width: 8),
              pw.Text('If yes,', style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 8),
              labeledCheckbox('i. Visually impaired'),
              pw.SizedBox(width: 8),
              labeledCheckbox('ii. Differently abled'),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Educational Qualification:',
          pw.Row(
            children: [
              labeledCheckbox('Below SSC'),
              pw.SizedBox(width: 4),
              labeledCheckbox('SSC'),
              pw.SizedBox(width: 4),
              labeledCheckbox('HSC'),
              pw.SizedBox(width: 4),
              labeledCheckbox('Graduate'),
              pw.SizedBox(width: 4),
              labeledCheckbox('Post Graduate'),
              pw.SizedBox(width: 4),
              labeledCheckbox('Professional'),
              pw.SizedBox(width: 4),
              labeledCheckbox('Others'),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Organization\'s Name:',
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                children: [
                  pw.Text(
                    'Designation/Profession:',
                    style: const pw.TextStyle(fontSize: 7.5),
                  ),
                  pw.SizedBox(width: 4),
                  charBoxes('', 10),
                  pw.SizedBox(width: 12),
                  pw.Text(
                    'Nature of Business:',
                    style: const pw.TextStyle(fontSize: 7.5),
                  ),
                  pw.SizedBox(width: 4),
                  charBoxes('', 10),
                ],
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Please Tick the Applicable box*:',
          pw.Row(
            children: [
              labeledCheckbox('Politically exposed Person'),
              pw.SizedBox(width: 8),
              labeledCheckbox('Related to politically Exposed Person'),
              pw.SizedBox(width: 8),
              labeledCheckbox('None'),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'ISO 3166 Country Code of Jurisdiction of Residence*',
          pw.Row(
            children: [
              charBoxes('IN', 2),
              pw.SizedBox(width: 4),
              pw.Text(
                '(Code for India is IN)',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Place/City of Birth*',
          pw.Row(
            children: [
              charBoxes('', 15),
              pw.SizedBox(width: 8),
              pw.Text(
                'ISO 3166 Country of Code of Birth* ',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              _underlinedText(40),
              pw.SizedBox(width: 8),
              pw.Text('Citizenship ', style: const pw.TextStyle(fontSize: 7.5)),
              pw.Expanded(child: _underlinedText(0)),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Country of Tax Residence in India only and not in any other country or territory outside India*',
          pw.Row(
            children: [
              labeledCheckbox('Yes', checked: true),
              pw.SizedBox(width: 8),
              labeledCheckbox('No'),
              pw.SizedBox(width: 4),
              pw.Text(
                '(If No, please fill the FATCA details form - Annexure II)',
                style: const pw.TextStyle(fontSize: 6.5),
              ),
            ],
          ),
          width: 200,
        ),
        pw.SizedBox(height: 2),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'PAN*/Tax Identification Number or equivalent (If issued by jurisdiction)',
                    style: const pw.TextStyle(fontSize: 7.5),
                  ),
                  pw.Text(
                    '(If PAN is not submitted, submit Form 60 - Annexure I)',
                    style: const pw.TextStyle(fontSize: 6.5),
                  ),
                ],
              ),
            ),
            pw.SizedBox(width: 8),
            charBoxes('', 10),
          ],
        ),
      ],
    );
  }

  // Builder Placeholder 8: Header
  pw.Widget _buildHeader(FormDataModel data) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(
              width: 100,
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Container(
                    width: 30,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      shape: pw.BoxShape.circle,
                      border: pw.Border.all(width: 1.5),
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        'PSB',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 4),
                  pw.Expanded(
                    child: pw.Text(
                      'Aligned for Long-term lineup of Initiatives Across Nation for Customer Excellence',
                      style: const pw.TextStyle(fontSize: 5),
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            pw.Expanded(
              child: pw.Column(
                children: [
                  pw.Text(
                    'ACCOUNT OPENING FORM FOR RESIDENT INDIVIDUAL (PART-I)',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 8.5,
                    ),
                  ),
                  pw.Text(
                    'CUSTOMER INFORMATION SHEET (CIF Creation/Amendment)',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 8,
                    ),
                  ),
                  pw.Text(
                    '(In case of joint accounts, Part-I(CIF Sheet) to be taken for each customer)',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontStyle: pw.FontStyle.italic,
                      fontSize: 7,
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(
              width: 120,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Text(
                        'बैंक ऑफ़ इंडिया',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 8,
                        ),
                      ),
                      pw.SizedBox(width: 4),
                      pw.Text(
                        'BOI',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      pw.Text(
                        '★',
                        style: const pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  pw.Text(
                    'Bank of India',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 7,
                    ),
                  ),
                  pw.SizedBox(height: 2),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 1),
                    child: pw.Row(
                      mainAxisSize: pw.MainAxisSize.min,
                      children: [
                        pw.Text(
                          'Date:',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                        charBoxes(data.date, 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 4),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text('Branch Name:', style: const pw.TextStyle(fontSize: 8)),
                charBoxes(data.branchName, 20),
                pw.SizedBox(width: 8),
                pw.Text('Branch Code', style: const pw.TextStyle(fontSize: 8)),
                charBoxes('', 5),
              ],
            ),
            pw.Spacer(),
            pw.Container(
              width: 120,
              height: 40,
              decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
              child: pw.Center(
                child: pw.Text(
                  'Bank/Branch to affix rubber stamp of name and code no.',
                  style: const pw.TextStyle(
                    fontSize: 6,
                    color: PdfColors.grey700,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 4),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Fields marked asterisk (*) are mandatory. Please fill up in BLOCK letters only and use black ink for signature',
              style: const pw.TextStyle(fontSize: 7),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              '(For office use only)',
              style: const pw.TextStyle(fontSize: 8),
            ),
            pw.SizedBox(height: 2),
            pw.Row(
              children: [
                pw.Text('Customer ID:', style: const pw.TextStyle(fontSize: 8)),
                charBoxes(data.customerId, 15),
                pw.Spacer(),
                pw.Text(
                  'Application type:',
                  style: const pw.TextStyle(fontSize: 8),
                ),
                labeledCheckbox('New', checked: data.applicationTypeNew),
                pw.SizedBox(width: 4),
                labeledCheckbox('Update', checked: data.applicationTypeUpdate),
              ],
            ),
            pw.SizedBox(height: 1),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text(
                      'Account No.:',
                      style: const pw.TextStyle(fontSize: 8),
                    ),
                    charBoxes(data.accountNo, 15),
                  ],
                ),
                pw.Spacer(),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'CKYC No.:',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                        charBoxes(data.ckycNo, 20),
                      ],
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(left: 45),
                      child: pw.Text(
                        '(Mandatory for CKYC update request)',
                        style: const pw.TextStyle(fontSize: 6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 1),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text(
                  'Account type:',
                  style: const pw.TextStyle(fontSize: 8),
                ),
                labeledCheckbox('Normal', checked: data.accountTypeNormal),
                pw.SizedBox(width: 8),
                labeledCheckbox(
                  'Small (For low risk customers)',
                  checked: data.accountTypeSmallRisk,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
