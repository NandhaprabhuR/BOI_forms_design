// lib/screens/pdfdesign1.dart

import 'dart:typed_data';
import 'dart:io';
import 'dart:convert'; // For Base64
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
  // State variables
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
        border: pw.Border(bottom: pw.BorderSide(width: 0.8)),
      ),
    );
  }

  pw.Widget _emptyRectBox({double width = 80, double height = 14}) {
    return pw.Container(
      width: width,
      height: height,
      decoration: pw.BoxDecoration(border: pw.Border.all(width: 1)),
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
    
    // Helper to load image
    Future<pw.MemoryImage?> loadImage(String pathOrBase64, String label) async {
       if (pathOrBase64.isEmpty) {
         print('⚠️ $label path is empty');
         return null;
       }
       try {
         if (pathOrBase64.startsWith('data:image')) {
           final base64String = pathOrBase64.split(',')[1];
           final bytes = base64Decode(base64String);
           print('✅ $label loaded from Base64 data URL: ${bytes.length} bytes');
           return pw.MemoryImage(bytes);
         } else if (_isBase64(pathOrBase64)) {
           final bytes = base64Decode(pathOrBase64);
           print('✅ $label loaded from Base64: ${bytes.length} bytes');
           return pw.MemoryImage(bytes);
         } else {
           final file = File(pathOrBase64);
           if (await file.exists()) {
             final bytes = await file.readAsBytes();
             print('✅ $label loaded from file: ${bytes.length} bytes');
             return pw.MemoryImage(bytes);
           } else {
             print('❌ $label file not found at: $pathOrBase64');
             return null;
           }
         }
       } catch (e) {
         print('❌ Error loading $label: $e');
         return null;
       }
    }

    signature1Image = await loadImage(model.signature1Text, "Signature 1");
    signature2Image = await loadImage(model.signature2Text, "Signature 2");
    applicantPhoto = await loadImage(model.applicantPhoto, "Applicant Photo");
    applicantSignature = await loadImage(model.applicantSignatureImage, "Applicant Signature");
    
    // Official signature
    pw.MemoryImage? officialSignature = await loadImage(model.officialSignature, "Official Signature");


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
                  model: model,
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

            // Conditional UI for Generation
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

  // --- PDF Builder Methods ---

  // Builder Placeholder 1: Address Section
  pw.Widget _buildAddressSection({
    required String title,
    required List<String> tabs,
    required FormDataModel model,
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
            labeledRadio('Residential/Business', checked: model.addressTypeResidentialBusiness),
            pw.SizedBox(width: 8),
            labeledRadio('Residential', checked: model.addressTypeResidential),
            pw.SizedBox(width: 8),
            labeledRadio('Business', checked: model.addressTypeBusiness),
            pw.SizedBox(width: 8),
            labeledRadio('Registered Office', checked: model.addressTypeRegisteredOffice),
            pw.SizedBox(width: 8),
            labeledRadio('Unspecified', checked: model.addressTypeUnspecified),
          ],
        ),
        pw.SizedBox(height: 3),
        pw.Row(
          children: [
            pw.Text('Address*', style: const pw.TextStyle(fontSize: 8)),
            pw.SizedBox(width: 10),
            pw.Expanded(child: charBoxes(model.currentAddress, 35)),
          ],
        ),
        pw.SizedBox(height: 2),
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 60),
          child: charBoxes('', 35), // Line 2 can be empty or added to model if needed
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
                      charBoxes(model.currentCity, 15),
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
                      charBoxes(model.currentState, 15),
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
                      charBoxes(model.currentDistrict, 15),
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
                      charBoxes(model.currentPin, 6),
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
    // Helper to safely get date chars
    String safeDateChar(String date, int index) {
      if (date.length > index) return date[index];
      return '';
    }

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
            pw.Expanded(child: labeledRadio('A-PASSPORT', checked: data.docTypePassport)),
            pw.Expanded(child: labeledRadio('B-VOTER\'S IDENTITY CARD', checked: data.docTypeVoterIdCard)),
            pw.Expanded(child: labeledRadio('C-DRIVING LICENCE', checked: data.docTypeDrivingLicence)),
            pw.Expanded(
              child: labeledRadio(
                'D-Proof of possession of AADHAAR',
                checked: data.docTypeAadhaar,
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 2),
        pw.Row(
          children: [
            pw.Expanded(child: labeledRadio('E-NREGA JOB CARD', checked: data.docTypeNregaJobCard)),
            pw.Expanded(
              flex: 3,
              child: labeledRadio(
                'F-LETTER ISSUED BY NATIONAL POPULATION REGISTER CONTAINING DETAILS OF NAME & ADDRESS',
                checked: data.docTypePopulationRegisterLetter,
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
            // Use documentNo field
            charBoxes(data.documentNo, 12),
            pw.SizedBox(width: 4),
            pw.Expanded(child: charBoxes('', 10)),
          ],
        ),
        pw.SizedBox(height: 3),
        pw.Row(
          children: [
            pw.Text('Issue Date:*', style: const pw.TextStyle(fontSize: 7.5)),
            pw.SizedBox(width: 8),
            _charBoxWithLabel(safeDateChar(data.issueDate, 0), 'D'),
            _charBoxWithLabel(safeDateChar(data.issueDate, 1), 'D'),
            pw.SizedBox(width: 3),
            _charBoxWithLabel(safeDateChar(data.issueDate, 3), 'M'),
            _charBoxWithLabel(safeDateChar(data.issueDate, 4), 'M'),
            pw.SizedBox(width: 3),
            _charBoxWithLabel(safeDateChar(data.issueDate, 6), 'Y'),
            _charBoxWithLabel(safeDateChar(data.issueDate, 7), 'Y'),
            _charBoxWithLabel(safeDateChar(data.issueDate, 8), 'Y'),
            _charBoxWithLabel(safeDateChar(data.issueDate, 9), 'Y'),
            pw.Spacer(),
            pw.Text(
              'Expiry Date (If applicable)*',
              style: const pw.TextStyle(fontSize: 7.5),
            ),
            pw.SizedBox(width: 8),
            _charBoxWithLabel(safeDateChar(data.expiryDate, 0), 'D'),
            _charBoxWithLabel(safeDateChar(data.expiryDate, 1), 'D'),
            pw.SizedBox(width: 3),
            _charBoxWithLabel(safeDateChar(data.expiryDate, 3), 'M'),
            _charBoxWithLabel(safeDateChar(data.expiryDate, 4), 'M'),
            pw.SizedBox(width: 3),
            _charBoxWithLabel(safeDateChar(data.expiryDate, 6), 'Y'),
            _charBoxWithLabel(safeDateChar(data.expiryDate, 7), 'Y'),
            _charBoxWithLabel(safeDateChar(data.expiryDate, 8), 'Y'),
            _charBoxWithLabel(safeDateChar(data.expiryDate, 9), 'Y'),
            pw.SizedBox(width: 15),
          ],
        ),
      ],
    );
  }

  // Builder Placeholder 3: Contact Details
  pw.Widget _buildContactDetails(FormDataModel data) {
    // FIX: Safely pad the mobile number to prevent substring errors
    final safeMobile = data.mobileNo.padRight(13, ' ');
    final safeAltMobile = data.alternateMobileNo.padRight(13, ' ');

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
            // Use the safeMobile string
            charBoxes(safeMobile.substring(0, 3), 3),
            pw.SizedBox(width: 4),
            charBoxes(safeMobile.substring(3, 13), 10),
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
             charBoxes(safeAltMobile.substring(0, 3), 3),
            pw.SizedBox(width: 4),
            charBoxes(safeAltMobile.substring(3, 13), 10),
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
                    charBoxes(data.telOff, 15),
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
                    charBoxes(data.telRes, 15),
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
    // FIX: Safely pad the DOB string
    final dob = data.dob.padRight(8, ' ');

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _formField(
          'Existing Customer ID:',
          charBoxes(data.existingCustomerId, 15),
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
                  charBoxes(data.customerPrefix, 2),
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
                  charBoxes(data.maidenNamePrefix, 4),
                  pw.Text('Prefix', style: const pw.TextStyle(fontSize: 6.5)),
                ],
              ),
              pw.SizedBox(width: 4),
              pw.Expanded(child: charBoxes(data.maidenName, 25)),
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
                      // Use the safe 'dob' string
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
                      labeledRadio('Male', checked: data.genderMale),
                      pw.SizedBox(width: 3),
                      labeledRadio('Female', checked: data.genderFemale),
                      pw.SizedBox(width: 3),
                      labeledRadio('Transgender', checked: data.genderTransgender),
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
                      labeledRadio('Married', checked: data.maritalStatusMarried),
                      pw.SizedBox(width: 3),
                      labeledRadio('Unmarried', checked: data.maritalStatusUnmarried),
                      pw.SizedBox(width: 3),
                      labeledRadio('Others', checked: data.maritalStatusOthers),
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
        _formField('No. of Dependents', charBoxes(data.noOfDependents, 2)),
        pw.SizedBox(height: 1),
        _formField(
          'Illiterate',
          pw.Row(
            children: [
              labeledRadio('YES', checked: data.illiterateYes),
              labeledRadio('NO', checked: data.illiterateNo),
              pw.SizedBox(width: 8),
              pw.Text(
                'if yes : Identification Marks : ',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              charBoxes(data.identificationMarks, 20),
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
                  charBoxes(data.guardianPrefix, 4),
                  pw.Text('Prefix', style: const pw.TextStyle(fontSize: 6.5)),
                ],
              ),
              pw.SizedBox(width: 4),
              pw.Expanded(child: charBoxes(data.guardianName, 25)),
            ],
          ),
          subLabel: pw.Text(
            '(In Case of Minor*)',
            style: const pw.TextStyle(fontSize: 6.5),
          ),
        ),
        pw.SizedBox(height: 1),
        _formField('Relationship with Guardian', charBoxes(data.relationshipWithGuardian, 25)),
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
              labeledRadio('In-Indian', checked: data.nationalityInIndian),
              pw.SizedBox(width: 8),
              labeledRadio('Others', checked: data.nationalityOthers),
              pw.SizedBox(width: 8),
              pw.Text(
                'Country Name:',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              pw.SizedBox(width: 4),
              pw.Expanded(child: charBoxes(data.countryName, 15)),
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
                  pw.Expanded(child: labeledRadio('S-Service', checked: data.occupationSService)),
                  pw.Expanded(child: labeledRadio('Private Sector', checked: data.occupationPrivateSector)),
                  pw.Expanded(child: labeledRadio('Public Sector', checked: data.occupationPublicSector)),
                  pw.Expanded(child: labeledRadio('Government Sector', checked: data.occupationGovernmentSector)),
                ],
              ),
              pw.SizedBox(height: 1.5),
              pw.Row(
                children: [
                  pw.Expanded(child: labeledRadio('O-Others', checked: data.occupationOOthers)),
                  pw.Expanded(child: labeledRadio('Professional', checked: data.occupationProfessional)),
                  pw.Expanded(child: labeledRadio('Self employed', checked: data.occupationSelfEmployed)),
                  pw.Expanded(child: labeledRadio('Retired', checked: data.occupationRetired)),
                  pw.Expanded(child: labeledRadio('House Wife', checked: data.occupationHouseWife)),
                  pw.Expanded(child: labeledRadio('Student', checked: data.occupationStudent)),
                ],
              ),
              pw.SizedBox(height: 1.5),
              pw.Row(
                children: [
                  labeledRadio('B-Business', checked: data.occupationBBusiness),
                  pw.SizedBox(width: 28),
                  labeledRadio(
                    'Agriculture',
                    checked: data.occupationAgriculture,
                  ),
                  pw.SizedBox(width: 25),
                  labeledRadio('X-Not categorised', checked: data.occupationXNotCategorised),
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
              charBoxes(data.monthlyIncome, 12),
              pw.SizedBox(width: 8),
              pw.Text(
                'Net Worth(approx)',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              pw.SizedBox(width: 2),
              pw.Text('Rs.', style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 2),
              charBoxes(data.netWorth, 12),
              pw.SizedBox(width: 8),
              pw.Text(
                'Est. Annual Turnover',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              pw.SizedBox(width: 2),
              pw.Text('Rs.', style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 2),
              pw.Expanded(child: charBoxes(data.estAnnualTurnover, 12)),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Religion:',
          pw.Row(
            children: [
              labeledRadio('Hindu', checked: data.religionHindu),
              pw.SizedBox(width: 12),
              labeledRadio('Muslim', checked: data.religionMuslim),
              pw.SizedBox(width: 12),
              labeledRadio('Christian', checked: data.religionChristian),
              pw.SizedBox(width: 12),
              labeledRadio('Sikh', checked: data.religionSikh),
              pw.SizedBox(width: 12),
              labeledRadio('Others', checked: data.religionOthers),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Category:',
          pw.Row(
            children: [
              labeledRadio('General', checked: data.categoryGeneral),
              pw.SizedBox(width: 12),
              labeledRadio('OBC', checked: data.categoryOBC),
              pw.SizedBox(width: 12),
              labeledRadio('SC', checked: data.categorySC),
              pw.SizedBox(width: 12),
              labeledRadio('ST', checked: data.categoryST),
              pw.SizedBox(width: 12),
              labeledRadio('Minority', checked: data.categoryMinority),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Customer Type',
          pw.Row(
            children: [
              labeledRadio('General', checked: data.customerTypeGeneral),
              pw.SizedBox(width: 8),
              labeledRadio('Sr. Citizen', checked: data.customerTypeSrCitizen),
              pw.SizedBox(width: 8),
              labeledRadio('Pensioner', checked: data.customerTypePensioner),
              pw.SizedBox(width: 8),
              labeledRadio('Minor', checked: data.customerTypeMinor),
              pw.SizedBox(width: 8),
              pw.Text(
                'Staff/Ex Staff PF No.',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              charBoxes(data.customerTypePfNo, 8),
              pw.SizedBox(width: 8),
              pw.Text(
                'Others (Specify)',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              charBoxes(data.customerTypeOthersSpecify, 10),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Person with disability',
          pw.Row(
            children: [
              labeledRadio('Yes', checked: data.disabilityYes),
              pw.SizedBox(width: 8),
              labeledRadio('No', checked: data.disabilityNo),
              pw.SizedBox(width: 8),
              pw.Text('If yes,', style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 8),
              labeledRadio('i. Visually impaired', checked: data.disabilityVisuallyImpaired),
              pw.SizedBox(width: 8),
              labeledRadio('ii. Differently abled', checked: data.disabilityDifferentlyAbled),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Educational Qualification:',
          pw.Row(
            children: [
              labeledRadio('Below SSC', checked: data.educationBelowSSC),
              pw.SizedBox(width: 4),
              labeledRadio('SSC', checked: data.educationSSC),
              pw.SizedBox(width: 4),
              labeledRadio('HSC', checked: data.educationHSC),
              pw.SizedBox(width: 4),
              labeledRadio('Graduate', checked: data.educationGraduate),
              pw.SizedBox(width: 4),
              labeledRadio('Post Graduate', checked: data.educationPostGraduate),
              pw.SizedBox(width: 4),
              labeledRadio('Professional', checked: data.educationProfessional),
              pw.SizedBox(width: 4),
              labeledRadio('Others', checked: data.educationOthers),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Organization\'s Name:',
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              charBoxes(data.organizationName, 50, width: 6),
              pw.SizedBox(height: 2),
              pw.Row(
                children: [
                  pw.Text(
                    'Designation/Profession:',
                    style: const pw.TextStyle(fontSize: 7.5),
                  ),
                  pw.SizedBox(width: 4),
                  charBoxes(data.designationProfession, 15),
                  pw.SizedBox(width: 12),
                  pw.Text(
                    'Nature of Business:',
                    style: const pw.TextStyle(fontSize: 7.5),
                  ),
                  pw.SizedBox(width: 4),
                  charBoxes(data.natureOfBusiness, 15),
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
              labeledRadio('Politically exposed Person', checked: data.politicallyExposedPerson),
              pw.SizedBox(width: 8),
              labeledRadio('Related to politically Exposed Person', checked: data.relatedToPoliticallyExposedPerson),
              pw.SizedBox(width: 8),
              labeledRadio('None', checked: data.politicallyExposedNone),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'ISO 3166 Country Code of Jurisdiction of Residence*',
          pw.Row(
            children: [
              charBoxes(data.isoCountryCodeJurisdiction.isNotEmpty ? data.isoCountryCodeJurisdiction : 'IN', 2),
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
              charBoxes(data.placeCityOfBirth, 15),
              pw.SizedBox(width: 8),
              pw.Text(
                'ISO 3166 Country of Code of Birth* ',
                style: const pw.TextStyle(fontSize: 7.5),
              ),
              charBoxes(data.isoCountryCodeOfBirth, 3), // e.g. IND
              pw.SizedBox(width: 8),
              pw.Text('Citizenship ', style: const pw.TextStyle(fontSize: 7.5)),
              pw.Expanded(child: charBoxes(data.citizenship, 10)),
            ],
          ),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Country of Tax Residence in India only and not in any other country or territory outside India*',
          pw.Row(
            children: [
              labeledRadio('Yes', checked: data.taxResidenceIndiaYes),
              pw.SizedBox(width: 8),
              labeledRadio('No', checked: data.taxResidenceIndiaNo),
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
            charBoxes(data.panTaxIdNumber, 15),
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
                        charBoxes(data.date.replaceAll(RegExp(r'[^0-9]'), ''), 8),
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
                charBoxes(data.branchCode, 6),
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
                labeledRadio('New', checked: data.applicationTypeNew),
                pw.SizedBox(width: 4),
                labeledRadio('Update', checked: data.applicationTypeUpdate),
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
                labeledRadio('Normal', checked: data.accountTypeNormal),
                pw.SizedBox(width: 8),
                labeledRadio(
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
