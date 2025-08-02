import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:flutter/material.dart'; // Import for ScaffoldMessenger

class PdfFormService {
  static Future<void> generateAndOpenFile(BuildContext context) async { // Pass BuildContext
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Generating PDF...')),
    );

    try {
      final pdf = pw.Document();

      // Load assets once at the beginning of the async function
      final ByteData boiLogoBytes = await rootBundle.load('assets\boi.png');
      final ByteData notoSansDevanagariBytes = await rootBundle.load("assets/NotoSansDevanagari-Regular.ttf");

      final pw.Font hindiFont = pw.Font.ttf(notoSansDevanagariBytes);
      final pw.MemoryImage boiLogoImage = pw.MemoryImage(boiLogoBytes.buffer.asUint8List());

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (context) => [
            // Top Section: Bank of India Logo and Title
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'ACCOUNT OPENING FORM FOR RESIDENT INDIVIDUAL (PART-I)',
                      style: pw.TextStyle(
                          fontSize: 9, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'CUSTOMER INFORMATION SHEET (CIF Creation/Amendment)',
                      style: pw.TextStyle(fontSize: 8),
                    ),
                    pw.Text(
                      '(In case of Joint Account, Part-IV (CIF above) to be taken for each customer)',
                      style: pw.TextStyle(fontSize: 6),
                    ),
                  ],
                ),
                pw.Image(
                  boiLogoImage,
                  width: 80,
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      'बैंक ऑफ इंडिया',
                      style: pw.TextStyle(
                          font: hindiFont,
                          fontSize: 10,
                          fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'BANK OF INDIA',
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 5),

            // Branch Details and Date
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  flex: 4,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        children: [
                          pw.Text('Branch Name:', style: pw.TextStyle(fontSize: 8)),
                          pw.SizedBox(width: 5),
                          pw.Container(
                            width: 150,
                            decoration: pw.BoxDecoration(border: pw.Border.all()),
                            padding: const pw.EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                            child: pw.Text('GANAPATHYPALAYAM', style: pw.TextStyle(fontSize: 8)),
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 2),
                      pw.Text('Branch Code: _______________', style: pw.TextStyle(fontSize: 8)),
                      pw.Text('(Fields marked * are mandatory. Please fill up in BLOCK letters only and use black ink for signature)', style: pw.TextStyle(fontSize: 7)),
                      pw.Text('For office use only: _______________', style: pw.TextStyle(fontSize: 8)),
                    ],
                  ),
                ),
                pw.SizedBox(width: 10),
                pw.Expanded(
                  flex: 2,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        children: [
                          pw.Text('Date:', style: pw.TextStyle(fontSize: 8)),
                          pw.SizedBox(width: 5),
                          pw.Container(
                            width: 80,
                            decoration: pw.BoxDecoration(border: pw.Border.all()),
                            padding: const pw.EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                            child: pw.Text('DD/MM/YYYY', style: pw.TextStyle(fontSize: 8)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 10),

            // Application Type
            pw.Row(
              children: [
                pw.Text('Application type:', style: pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 5),
                _buildCheckbox('New', true), // Helper function for checkboxes
                pw.SizedBox(width: 5),
                _buildCheckbox('Update', false),
              ],
            ),
            pw.SizedBox(height: 5),

            // Account Type
            pw.Row(
              children: [
                pw.Text('Account type:', style: pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 5),
                _buildCheckbox('Normal', true),
                pw.SizedBox(width: 5),
                _buildCheckbox('Small (For few risk customers)', false),
              ],
            ),
            pw.SizedBox(height: 5),

            // KYC Details
            pw.Row(
              children: [
                pw.Text('CKYC No:', style: pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 5),
                pw.Container(
                  width: 100,
                  decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
                  child: pw.Text('___________', style: pw.TextStyle(fontSize: 8)),
                ),
                pw.SizedBox(width: 10),
                _buildCheckbox('Mandatory for CKYC update request', false, textStyle: pw.TextStyle(fontSize: 7)),
              ],
            ),
            pw.SizedBox(height: 10),

            // Personal Details Section Header
            pw.Container(
              padding: const pw.EdgeInsets.all(3),
              decoration: pw.BoxDecoration(
                color: PdfColors.grey200,
                border: pw.Border.all(color: PdfColors.grey),
              ),
              child: pw.Text('1. Personal Details', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
            ),
            pw.SizedBox(height: 5),

            // Existing Customer ID
            pw.Row(
              children: [
                pw.Text('Existing Customer ID:', style: pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 5),
                pw.Container(
                  width: 100,
                  decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
                  child: pw.Text('_____________', style: pw.TextStyle(fontSize: 8)),
                ),
                pw.SizedBox(width: 10),
                pw.Text('(If applicable)', style: pw.TextStyle(fontSize: 7)),
              ],
            ),
            pw.SizedBox(height: 5),

            // Name
            pw.Row(
              children: [
                pw.Text('Name:', style: pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 5),
                pw.Container(
                  width: 200,
                  decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
                  child: pw.Text('Mr. Arunkumar', style: pw.TextStyle(fontSize: 8)),
                ),
              ],
            ),
            pw.SizedBox(height: 5),

            // Example for a row with a text field and checkbox (e.g., Mother's Name)
            pw.Row(
              children: [
                pw.Text("Name of Mother*:", style: pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 5),
                pw.Container(
                  width: 200,
                  decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
                  child: pw.Text("GOWRI", style: pw.TextStyle(fontSize: 8)),
                ),
              ],
            ),
            pw.SizedBox(height: 5),

            // Example for Spouse Name and Checkbox
            pw.Row(
              children: [
                pw.Text("Name of Spouse* (Please Tick One):", style: pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 5),
                _buildCheckbox('Yes', false),
                pw.SizedBox(width: 5),
                _buildCheckbox('No', true),
              ],
            ),
            pw.SizedBox(height: 5),
            pw.Row(
              children: [
                pw.Container(
                  width: 200,
                  decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
                  child: pw.Text("KRITHIKA", style: pw.TextStyle(fontSize: 8)),
                ),
              ],
            ),
            pw.SizedBox(height: 5),

            // Date of Birth and Gender
            pw.Row(
              children: [
                pw.Text('Date of Birth*: 15032000', style: pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 10),
                pw.Text('Gender*:', style: pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 5),
                _buildCheckbox('Male', true),
                pw.SizedBox(width: 5),
                _buildCheckbox('Female', false),
                pw.SizedBox(width: 5),
                _buildCheckbox('Transgender', false),
                pw.SizedBox(width: 5),
                _buildCheckbox('Marital Status*', false),
                pw.SizedBox(width: 5),
                _buildCheckbox('Married', false),
                pw.SizedBox(width: 5),
                _buildCheckbox('Unmarried', false),
                pw.SizedBox(width: 5),
                _buildCheckbox('Others', false),
              ],
            ),
            pw.SizedBox(height: 10),

            // Nationality, Resident Status, Occupation Type etc. (You will need to continue this pattern)
            // For the grid-like structure of checkboxes (e.g., Resident Status, Occupation Type),
            // you can use nested pw.Column and pw.Row widgets, or potentially pw.Table
            // if the alignment is strictly tabular.

            // Example for a block of checkboxes (Resident Status)
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Resident Status*', style: pw.TextStyle(fontSize: 8)),
                pw.Row(
                  children: [
                    _buildCheckbox('In-Indian', true),
                    pw.SizedBox(width: 10),
                    _buildCheckbox('Non-Resident Indian', false),
                    pw.SizedBox(width: 10),
                    _buildCheckbox('Foreign national', false),
                    pw.SizedBox(width: 10),
                    _buildCheckbox('PIO (If NRI, please obtain annexure III)', false),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 10),

            // Existing code for Gold Loan Application (to be placed after the form replication)
            pw.Align(
              alignment: pw.Alignment.topRight,
              child: pw.Text('ANNEXURE-IV',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.SizedBox(height: 5),
            pw.Center(
              child: pw.Text(
                'APPLICATION-CUM-VALUATION-SANCTION LETTER FOR GOLD LOAN',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
                textAlign: pw.TextAlign.center,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text('The Manager,\nBANK OF INDIA,\nfdsnjk Branch',
                style: pw.TextStyle(fontSize: 12)),
            pw.SizedBox(height: 10),
            pw.Text(
              'Re: Request for grant of Loan against Pledge of Gold Jewelry/ Ornaments/Coins',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              "I/We having read and understood the terms and conditions of the captioned Loan Scheme and agreeing to unconditionally abide by the same, request you to grant me/us a Loan of Rs 100000/- (Rupees One Lakh Only) for the purpose of Agriculture on the security of Pledge of the Gold or the security of Pledge of the Gold Jewellery/Ornaments/Coins mentioned below:",
              style: pw.TextStyle(fontSize: 11),
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 10),

            /// a) Gold Description
            pw.Text('a) Description of the Gold Jewelry/Ornaments/Coins:',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 5),
            pw.Table.fromTextArray(
              headers: [
                'Particulars',
                'Net Weight (in gram)',
                'Gross Weight (in gram)',
                'Finishing weight (in gram)',
                'Valuation Rate per gram (Rs)',
                'Total Current Value (Rs)'
              ],
              data: [
                ['Chain (1)', '34.000', '36.800', '2.8', '8473', '259274'],
                ['', '', '', '', '', ''],
                ['', '', '', '', '', ''],
                ['', '', '', '', '', ''],
                ['', '', '', '', '', ''],
                ['Total', '34.000', '36.800', '', '', '259274']
              ],
              cellAlignment: pw.Alignment.center,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              cellStyle: const pw.TextStyle(fontSize: 10),
              border: pw.TableBorder.all(),
            ),
            pw.SizedBox(height: 20),

            /// b) Borrower Details
            pw.Text('b) Details of Borrower(s):',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 5),
            pw.Table(
              border: pw.TableBorder.all(),
              columnWidths: {
                0: const pw.FlexColumnWidth(2),
                1: const pw.FlexColumnWidth(1),
                2: const pw.FlexColumnWidth(2),
                3: const pw.FlexColumnWidth(2),
                4: const pw.FlexColumnWidth(2),
              },
              children: [
                pw.TableRow(children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text("Name of Borrower(s)\nwith Father's Name",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text("Age",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text("Address",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text("Mobile Number/DOB",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Text("Aadhaar/PAN Card",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                ]),
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text("tatjrkdtksj rlj\nS/O jkdjkfhdjkh")),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(4), child: pw.Text("21")),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text("oktrjktjfdjkdthjktdhjktdhjktjdh")),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text("9348485948\n12/04/2004")),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text("94394963404\nVJ5VHKJH22")),
                ]),
                pw.TableRow(children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text("Name of Nominee\nbxjfdjblkjklj")),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text("Age\nfdjljfljf")),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text("Relationship")),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text("Mobile Number\n9493949384")),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(4),
                      child: pw.Text("Aadhaar/PAN Card")),
                ])
              ],
            ),
            pw.SizedBox(height: 20),

            /// c) Agricultural Details
            pw.Text(
                'c) If the Loan is for agricultural purpose, details of agricultural property:',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 5),
            pw.Table.fromTextArray(
              headers: [
                'Sl No',
                'Survey Number',
                'Area/Area(Hec)',
                'Village',
                'Gram Panchayat',
                'Taluka/Sub District',
                'District',
                'State',
              ],
              data: [
                ['', '', '', '', '', '', '', '']
              ],
              border: pw.TableBorder.all(),
              cellAlignment: pw.Alignment.center,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ],
        ),
      );

      final output = await getTemporaryDirectory();
      final String filePath = '${output.path}/gold_loan_form.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      // Attempt to open the file
      final OpenResult result = await OpenFilex.open(filePath);

      if (result.type == ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('PDF generated and opened successfully: $filePath')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to open PDF: ${result.message}'),
            backgroundColor: Colors.red,
          ),
        );
        print('Error opening PDF: ${result.message}'); // Log the error for debugging
      }
    } catch (e) {
      // Catch any exceptions during PDF generation or file handling
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error generating or opening PDF: $e'),
          backgroundColor: Colors.red,
        ),
      );
      print('Caught PDF generation/opening error: $e'); // Log the error
    }
  }

  // Helper function to create a checkbox with text
  static pw.Widget _buildCheckbox(String text, bool isChecked, {pw.TextStyle? textStyle}) {
    return pw.Row(
      mainAxisSize: pw.MainAxisSize.min,
      children: [
        pw.Container(
          width: 8,
          height: 8,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(width: 0.5),
            color: isChecked ? PdfColors.black : PdfColors.white,
          ),
        ),
        pw.SizedBox(width: 2),
        pw.Text(text, style: textStyle ?? pw.TextStyle(fontSize: 8)),
      ],
    );
  }
}