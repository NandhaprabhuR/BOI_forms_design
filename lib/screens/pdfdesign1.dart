// lib/screens/pdfdesign1.dart

import 'package:boiforms/screens/pdf_helpers.dart'; // Assuming pdf_helpers.dart exists
import 'package:boiforms/screens/pdfdesign10.dart';
import 'package:boiforms/screens/pdfdesign2.dart';
import 'package:boiforms/screens/pdfdesign3.dart';
import 'package:boiforms/screens/pdfdesign4.dart';
import 'package:boiforms/screens/pdfdesign5.dart';
import 'package:boiforms/screens/pdfdesign6.dart';
import 'package:boiforms/screens/pdfdesign7.dart';
import 'package:boiforms/screens/pdfdesign8.dart';
import 'package:boiforms/screens/pdfdesign9.dart';
import 'package:boiforms/screens/pdfdesign10.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfDesignPage extends StatelessWidget {
  const PdfDesignPage({super.key});

  // --- HELPER WIDGETS (CLASS LEVEL) ---

  /// Helper for a label and a form field
  pw.Widget _formField(String label, pw.Widget child,
      {pw.Widget? subLabel, double width = 100}) {
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
              ]),
        ),
        pw.SizedBox(width: 4),
        pw.Expanded(child: child),
      ],
    );
  }

  /// Helper for a single character box with a label underneath
  pw.Widget _charBoxWithLabel(String char, String label) {
    return pw.Column(children: [
      charBoxes(char, 1, width: 13, height: 13),
      pw.SizedBox(height: 1),
      pw.Text(label, style: const pw.TextStyle(fontSize: 6)),
    ]);
  }

  /// Helper for creating an underlined text field
  pw.Widget _underlinedText(double width) {
    return pw.Container(
      width: width,
      height: 8,
      decoration: const pw.BoxDecoration(
        border: pw.Border(bottom: pw.BorderSide(width: 0.5)),
      ),
    );
  }

  /// Helper for the empty rectangular boxes
  pw.Widget _emptyRectBox({double width = 80, double height = 14}) {
    return pw.Container(
      width: width,
      height: height,
      decoration: pw.BoxDecoration(
        border: pw.Border.all(width: 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Form Preview'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Generate PDF"),
          onPressed: () {
            Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
              final pdf = pw.Document();

              // Data for the address section on page 1
              final addressData = {
                'address': '104 Kovai Road Kadaiyur',
                'city': 'Kangayam',
                'district': 'Tirupur',
                'state': 'Tamilnadu',
                'pin': '638701',
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
                          style: pw.Theme.of(context)
                              .defaultTextStyle
                              .copyWith(color: PdfColors.grey),
                        ));
                  },
                  build: (pw.Context context) => <pw.Widget>[
                    // --- START OF PAGE 1 CONTENT ---
                    pw.Container(
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(color: PdfColors.black, width: 1),
                      ),
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          _buildHeader(),
                          _buildPersonalDetails(),
                          pw.SizedBox(height: 5),
                          _buildContactDetails(),
                          pw.SizedBox(height: 5),
                          _buildProofOfIdentity(),
                          pw.SizedBox(height: 5),
                          _buildAddressSection(
                            title: '4. Address details',
                            tabs: ['Current', 'Permanent', 'Overseas'],
                            data: addressData,
                          ),
                        ],
                      ),
                    ),
                    // --- END OF PAGE 1 CONTENT ---

                    buildSecondPage(),
                    buildThirdPage(),
                    buildFourthPage(),
                    buildFifthPage(),
                    buildSixthPage(),
                    buildSeventhPage(),
                    buildEighthPage(),
                    buildNinthPage(),
                    buildTenthPage(),
                  ],
                ),
              );

              return pdf.save();
            });
          },
        ),
      ),
    );
  }

  // --- PDF SECTION BUILDERS ---

  /// Builds an address section (Moved from pdfdesign2.dart)
  pw.Widget _buildAddressSection({
    required String title,
    required List<String> tabs,
    required Map<String, String> data,
  }) {
    // (Content unchanged from previous version)
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
              pw.Text(title,
                  style:
                  pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8)),
              pw.SizedBox(width: 20),
              ...tabs.map((tab) => pw.Container(
                margin: const pw.EdgeInsets.symmetric(horizontal: 8),
                padding: const pw.EdgeInsets.symmetric(horizontal: 6),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.grey600),
                  color: PdfColors.white,
                ),
                child: pw.Text(tab, style: const pw.TextStyle(fontSize: 7.5)),
              )),
            ],
          ),
        ),
        pw.SizedBox(height: 3),
        pw.Row(children: [
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
        ]),
        pw.SizedBox(height: 3),
        pw.Row(children: [
          pw.Text('Address*', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 10),
          pw.Expanded(child: charBoxes(data['address']!, 35)),
        ]),
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
              child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                pw.Row(children: [
                  pw.SizedBox(
                      width: 50,
                      child: pw.Text('City/Village*',
                          style: const pw.TextStyle(fontSize: 8))),
                  charBoxes(data['city']!, 15),
                ]),
                pw.SizedBox(height: 2),
                pw.Row(children: [
                  pw.SizedBox(
                      width: 50,
                      child: pw.Text('State*',
                          style: const pw.TextStyle(fontSize: 8))),
                  charBoxes(data['state']!, 15),
                ]),
              ]),
            ),
            pw.SizedBox(width: 20),
            pw.Expanded(
              child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
                pw.Row(children: [
                  pw.SizedBox(
                      width: 40,
                      child: pw.Text('District*',
                          style: const pw.TextStyle(fontSize: 8))),
                  charBoxes(data['district']!, 15),
                ]),
                pw.SizedBox(height: 2),
                pw.Row(children: [
                  pw.SizedBox(
                      width: 40,
                      child: pw.Text('Pin*',
                          style: const pw.TextStyle(fontSize: 8))),
                  charBoxes(data['pin']!, 6),
                ]),
              ]),
            ),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildProofOfIdentity() {
    // (Content unchanged from previous version)
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
                    color: PdfColors.black)),
          ),
          pw.SizedBox(height: 2),
          pw.Row(children: [
            pw.Expanded(child: labeledCheckbox('A-PASSPORT')),
            pw.Expanded(child: labeledCheckbox('B-VOTER\'S IDENTITY CARD')),
            pw.Expanded(child: labeledCheckbox('C-DRIVING LICENCE')),
            pw.Expanded(
                child: labeledCheckbox('D-Proof of possession of AADHAAR',
                    checked: true)),
          ]),
          pw.SizedBox(height: 2),
          pw.Row(children: [
            pw.Expanded(child: labeledCheckbox('E-NREGA JOB CARD')),
            pw.Expanded(
                flex: 3,
                child: labeledCheckbox(
                    'F-LETTER ISSUED BY NATIONAL POPULATION REGISTER CONTAINING DETAILS OF NAME & ADDRESS')),
          ]),
          pw.SizedBox(height: 3),
          pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
            pw.Text('Document No./Identification Number*',
                style: const pw.TextStyle(fontSize: 7.5)),
            pw.SizedBox(width: 8),
            charBoxes('222222222222', 12),
            pw.SizedBox(width: 4),
            pw.Expanded(child: charBoxes('', 10)),
          ]),
          pw.SizedBox(height: 3),
          pw.Row(children: [
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
            pw.Text('Expiry Date (If applicable)*',
                style: const pw.TextStyle(fontSize: 7.5)),
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
          ]),
        ]);
  }

  pw.Widget _buildContactDetails() {
    // (Content unchanged from previous version)
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
                  pw.Text('2. Contact Details',
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 8.5,
                          color: PdfColors.black)),
                  pw.Text(
                      '(All communications will be sent on provided Mobile No./Email-ID)',
                      style: const pw.TextStyle(fontSize: 6.5)),
                ]),
          ),
          pw.SizedBox(height: 3),
          pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
            pw.Text('Mobile No.', style: const pw.TextStyle(fontSize: 7.5)),
            pw.SizedBox(width: 4),
            charBoxes('+91', 3),
            pw.SizedBox(width: 4),
            charBoxes('9999999999', 10),
            pw.SizedBox(width: 12),
            pw.Text('Email ID', style: const pw.TextStyle(fontSize: 7.5)),
            pw.SizedBox(width: 4),
            pw.Expanded(child: charBoxes('', 22)), // Fixed width
          ]),
          pw.SizedBox(height: 3),
          pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text('Alternate Mob. No.',
                style: const pw.TextStyle(fontSize: 7.5)),
            pw.SizedBox(width: 4),
            charBoxes('', 3),
            pw.SizedBox(width: 4),
            charBoxes('', 10),
            pw.Spacer(),
            pw.Column(
                mainAxisSize: pw.MainAxisSize.min,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Row(children: [
                    pw.Text('Tel(Off):', style: const pw.TextStyle(fontSize: 7.5)),
                    pw.SizedBox(width: 4),
                    charBoxes('', 15)
                  ]),
                  pw.SizedBox(height: 2),
                  pw.Row(children: [
                    pw.Text('Tel(Res):', style: const pw.TextStyle(fontSize: 7.5)),
                    pw.SizedBox(width: 4),
                    charBoxes('', 15)
                  ]),
                ])
          ]),
        ]);
  }

  pw.Widget _buildPersonalDetails() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: double.infinity,
          color: PdfColors.grey200,
          padding: const pw.EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: pw.Text('1. Personal Details',
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 8.5,
                  color: PdfColors.black)),
        ),
        pw.SizedBox(height: 3),
        _buildIdAndBasicInfo(),
        _buildFamilyAndDependantInfo(),
        _buildStatusAndCategoryInfo(),
      ],
    );
  }

  pw.Widget _buildIdAndBasicInfo() {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _formField(
            'Existing Customer ID:',
            charBoxes('', 15),
            subLabel:
            pw.Text('(If applicable)', style: const pw.TextStyle(fontSize: 6.5)),
          ),
          pw.SizedBox(height: 1),
          _formField(
            'Name*',
            pw.Row(children: [
              pw.Column(children: [
                charBoxes('Mr.', 4),
                pw.Text('Prefix', style: const pw.TextStyle(fontSize: 6.5))
              ]),
              pw.SizedBox(width: 4),
              pw.Expanded(child: charBoxes('ARUNKUMAR', 25)),
            ]),
            subLabel: pw.Text('(Same as ID Proof)',
                style: const pw.TextStyle(fontSize: 6.5)),
          ),
          pw.SizedBox(height: 1),
          _formField(
            'Maiden Name:',
            pw.Row(children: [
              pw.Column(children: [
                charBoxes('', 4),
                pw.Text('Prefix', style: const pw.TextStyle(fontSize: 6.5))
              ]),
              pw.SizedBox(width: 4),
              pw.Expanded(child: charBoxes('', 25)),
            ]),
          ),
          pw.SizedBox(height: 1),
          // --- FIX: Date of Birth / Gender / Marital Status Row (Spacing Adjusted) ---
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start, // Align to top
            children: [
              // Column for Date of Birth Label
              pw.SizedBox(
                width: 100, // Same width as the _formField label
                child: pw.Text('Date of Birth*',
                    style: const pw.TextStyle(fontSize: 7.5)),
              ),
              pw.SizedBox(width: 4),
              // The actual boxes and gender/marital status fields
              pw.Expanded(
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Date boxes
                    pw.Row(children: [
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
                    ]),
                    pw.SizedBox(width: 8), // Adjusted space
                    // Gender
                    pw.Row(mainAxisSize: pw.MainAxisSize.min, children: [ // Use min size
                      pw.Text('Gender*', style: const pw.TextStyle(fontSize: 7.5)),
                      pw.SizedBox(width: 3), // Adjusted space
                      labeledCheckbox('Male', checked: true),
                      pw.SizedBox(width: 3), // Adjusted space
                      labeledCheckbox('Female'),
                      pw.SizedBox(width: 3), // Adjusted space
                      labeledCheckbox('Transgender'),
                    ]),
                    pw.SizedBox(width: 8), // Adjusted space
                    // Marital Status
                    pw.Row(mainAxisSize: pw.MainAxisSize.min, children: [ // Use min size
                      pw.Text('Marital Status*',
                          style: const pw.TextStyle(fontSize: 7.5)),
                      pw.SizedBox(width: 3), // Adjusted space
                      labeledCheckbox('Married', checked: true),
                      pw.SizedBox(width: 3), // Adjusted space
                      labeledCheckbox('Unmarried'),
                      pw.SizedBox(width: 3), // Adjusted space
                      labeledCheckbox('Others'),
                    ]),
                    pw.Spacer(), // Pushes Marital Status to the right edge if needed
                  ],
                ),
              ),
            ],
          )
          // --- END FIX ---
        ]);
  }

  pw.Widget _buildFamilyAndDependantInfo() {
    // (Content unchanged from previous version)
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(height: 1),
          _formField('Name of Father*', charBoxes('BALASUBRAMANIYAM', 30)),
          pw.SizedBox(height: 1),
          _formField('Name of Mother*', charBoxes('GOWRI', 30)),
          pw.SizedBox(height: 1),
          _formField('Name of Spouse*', charBoxes('KRITHIKA', 30),
              subLabel: pw.Text(
                  '(Father\'s name is mandatory if PAN is not provided)',
                  style: const pw.TextStyle(fontSize: 6))),
          pw.SizedBox(height: 1),
          _formField('No. of Dependents', charBoxes('', 2)),
          pw.SizedBox(height: 1),
          _formField(
              'Illiterate',
              pw.Row(children: [
                labeledCheckbox('YES'),
                pw.SizedBox(width: 8),
                labeledCheckbox('NO', checked: true),
                pw.SizedBox(width: 8),
                pw.Text(
                    'if yes : Identification Marks : ________________________',
                    style: const pw.TextStyle(fontSize: 7.5)),
              ])),
          pw.SizedBox(height: 1),
          _formField('Name of Guardian',
              pw.Row(children: [
                pw.Column(children: [
                  charBoxes('', 4),
                  pw.Text('Prefix', style: const pw.TextStyle(fontSize: 6.5))
                ]),
                pw.SizedBox(width: 4),
                pw.Expanded(child: charBoxes('', 25)),
              ]),
              subLabel: pw.Text('(In Case of Minor*)',
                  style: const pw.TextStyle(fontSize: 6.5))),
          pw.SizedBox(height: 1),
          _formField(
            'Relationship with Guardian',
            charBoxes('', 25),
          ),
        ]);
  }

  pw.Widget _buildStatusAndCategoryInfo() {
    // (Content mostly unchanged from previous version, only Monthly Income row)
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 3),
        _formField(
          'Nationality*',
          pw.Row(children: [
            labeledCheckbox('In-Indian', checked: true),
            pw.SizedBox(width: 8),
            labeledCheckbox('Others'),
            pw.SizedBox(width: 8),
            pw.Text('Country Name:', style: const pw.TextStyle(fontSize: 7.5)),
            pw.SizedBox(width: 4),
            pw.Expanded(child: charBoxes('', 15)),
          ]),
        ),
        pw.SizedBox(height: 2),
        _formField(
          'Occupation Type*',
          pw.Column(children: [
            pw.Row(children: [
              pw.Expanded(child: labeledCheckbox('S-Service')),
              pw.Expanded(child: labeledCheckbox('Private Sector')),
              pw.Expanded(child: labeledCheckbox('Public Sector')),
              pw.Expanded(child: labeledCheckbox('Government Sector')),
            ]),
            pw.SizedBox(height: 1.5),
            pw.Row(children: [
              pw.Expanded(child: labeledCheckbox('O-Others')),
              pw.Expanded(child: labeledCheckbox('Professional')),
              pw.Expanded(child: labeledCheckbox('Self employed')),
              pw.Expanded(child: labeledCheckbox('Retired')),
              pw.Expanded(child: labeledCheckbox('House Wife')),
              pw.Expanded(child: labeledCheckbox('Student')),
            ]),
            pw.SizedBox(height: 1.5),
            pw.Row(children: [
              labeledCheckbox('B-Business'),
              pw.SizedBox(width: 28),
              labeledCheckbox('Agriculture', checked: true),
              pw.SizedBox(width: 25),
              labeledCheckbox('X-Not categorised-Please specify...'),
            ])
          ]),
        ),
        pw.SizedBox(height: 2),
        // --- FIX 2: Monthly Income Row (Using Rect Boxes) ---
        _formField(
          'Monthly Income*',
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text('Rs.', style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 2),
              _emptyRectBox(width: 80), // Box for Income
              pw.SizedBox(width: 8),
              pw.Text('Net Worth(approx)',
                  style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 2),
              pw.Text('Rs.', style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 2),
              _emptyRectBox(width: 60), // Box for Net Worth
              pw.SizedBox(width: 8),
              pw.Text('Est. Annual Turnover',
                  style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 2),
              pw.Text('Rs.', style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 2),
              pw.Expanded(child: _emptyRectBox(width: 0)), // Box for Turnover
            ],
          ),
        ),
        // --- END FIX 2 ---
        pw.SizedBox(height: 2),
        _formField(
            'Religion:',
            pw.Row(children: [
              labeledCheckbox('Hindu', checked: true),
              pw.SizedBox(width: 12),
              labeledCheckbox('Muslim'),
              pw.SizedBox(width: 12),
              labeledCheckbox('Christian'),
              pw.SizedBox(width: 12),
              labeledCheckbox('Sikh'),
              pw.SizedBox(width: 12),
              labeledCheckbox('Others'),
            ])),
        pw.SizedBox(height: 2),
        _formField(
            'Category:',
            pw.Row(children: [
              labeledCheckbox('General'),
              pw.SizedBox(width: 12),
              labeledCheckbox('OBC'),
              pw.SizedBox(width: 12),
              labeledCheckbox('SC'),
              pw.SizedBox(width: 12),
              labeledCheckbox('ST'),
              pw.SizedBox(width: 12),
              labeledCheckbox('Minority'),
            ])),
        pw.SizedBox(height: 2),
        _formField(
            'Customer Type',
            pw.Row(children: [
              labeledCheckbox('General'),
              pw.SizedBox(width: 8),
              labeledCheckbox('Sr. Citizen'),
              pw.SizedBox(width: 8),
              labeledCheckbox('Pensioner'),
              pw.SizedBox(width: 8),
              labeledCheckbox('Minor'),
              pw.SizedBox(width: 8),
              pw.Text('Staff/Ex Staff PF No._______',
                  style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 8),
              pw.Text('Others (Specify)_______',
                  style: const pw.TextStyle(fontSize: 7.5)),
            ])),
        pw.SizedBox(height: 2),
        _formField(
            'Person with disability',
            pw.Row(children: [
              labeledCheckbox('Yes'),
              pw.SizedBox(width: 8),
              labeledCheckbox('No'),
              pw.SizedBox(width: 8),
              pw.Text('If yes,', style: const pw.TextStyle(fontSize: 7.5)),
              pw.SizedBox(width: 8),
              labeledCheckbox('i. Visually impaired'),
              pw.SizedBox(width: 8),
              labeledCheckbox('ii. Differently abled'),
            ])),
        pw.SizedBox(height: 2),
        _formField(
            'Educational Qualification:',
            pw.Row(children: [
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
            ])),
        pw.SizedBox(height: 2),
        _formField(
            'Organization\'s Name:',
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(children: [
                    pw.Text('Designation/Profession:',
                        style: const pw.TextStyle(fontSize: 7.5)),
                    pw.SizedBox(width: 4),
                    charBoxes('', 10),
                    pw.SizedBox(width: 12),
                    pw.Text('Nature of Business:',
                        style: const pw.TextStyle(fontSize: 7.5)),
                    pw.SizedBox(width: 4),
                    charBoxes('', 10),
                  ]),
                ])),
        pw.SizedBox(height: 2),
        _formField(
            'Please Tick the Applicable box*:',
            pw.Row(children: [
              labeledCheckbox('Politically exposed Person'),
              pw.SizedBox(width: 8),
              labeledCheckbox('Related to politically Exposed Person'),
              pw.SizedBox(width: 8),
              labeledCheckbox('None'),
            ])),
        pw.SizedBox(height: 2),
        _formField('ISO 3166 Country Code of Jurisdiction of Residence*',
            pw.Row(children: [
              charBoxes('IN', 2),
              pw.SizedBox(width: 4),
              pw.Text('(Code for India is IN)',
                  style: const pw.TextStyle(fontSize: 7.5))
            ])),
        pw.SizedBox(height: 2),
        _formField(
            'Place/City of Birth*',
            pw.Row(children: [
              charBoxes('', 15),
              pw.SizedBox(width: 8),
              pw.Text('ISO 3166 Country of Code of Birth* ',
                  style: const pw.TextStyle(fontSize: 7.5)),
              _underlinedText(40),
              pw.SizedBox(width: 8),
              pw.Text('Citizenship ',
                  style: const pw.TextStyle(fontSize: 7.5)),
              pw.Expanded(child: _underlinedText(0)),
            ])),
        pw.SizedBox(height: 2),
        _formField(
            'Country of Tax Residence in India only and not in any other country or territory outside India*',
            pw.Row(children: [
              labeledCheckbox('Yes', checked: true),
              pw.SizedBox(width: 8),
              labeledCheckbox('No'),
              pw.SizedBox(width: 4),
              pw.Text('(If No, please fill the FATCA details form - Annexure II)',
                  style: const pw.TextStyle(fontSize: 6.5)),
            ]),
            width: 200),
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
                      style: const pw.TextStyle(fontSize: 7.5)),
                  pw.Text(
                      '(If PAN is not submitted, submit Form 60 - Annexure I)',
                      style: const pw.TextStyle(fontSize: 6.5)),
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

  pw.Widget _buildHeader() {
    // (Content unchanged from previous version)
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Left Column (PSB)
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
                      child: pw.Text('PSB',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 8)),
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
            // Center Column (Title)
            pw.Expanded(
              child: pw.Column(
                children: [
                  pw.Text(
                      'ACCOUNT OPENING FORM FOR RESIDENT INDIVIDUAL (PART-I)',
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 8.5)),
                  pw.Text('CUSTOMER INFORMATION SHEET (CIF Creation/Amendment)',
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 8)),
                  pw.Text(
                    '(In case of joint accounts, Part-I(CIF Sheet) to be taken for each customer)',
                    textAlign: pw.TextAlign.center,
                    style:
                    pw.TextStyle(fontStyle: pw.FontStyle.italic, fontSize: 7),
                  ),
                ],
              ),
            ),
            // Right Column (BOI & Date)
            pw.SizedBox(
              width: 120,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Text('बैंक ऑफ़ इंडिया',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 8)),
                      pw.SizedBox(width: 4),
                      pw.Text('BOI',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 14)),
                      pw.Text('★',
                          style: const pw.TextStyle(
                              color: PdfColors.black, fontSize: 20)),
                    ],
                  ),
                  pw.Text('Bank of India',
                      style:
                      pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 7)),
                  pw.SizedBox(height: 2),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 1),
                    child: pw.Row(
                      mainAxisSize: pw.MainAxisSize.min,
                      children: [
                        pw.Text('Date:', style: const pw.TextStyle(fontSize: 8)),
                        charBoxes('', 8),
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
                pw.Text('Branch Name:',
                    style: const pw.TextStyle(fontSize: 8)),
                charBoxes('GANAPATHYPALAYAM', 20),
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
                  style:
                  const pw.TextStyle(fontSize: 6, color: PdfColors.grey700),
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
                style: const pw.TextStyle(fontSize: 7)),
            pw.SizedBox(height: 2),
            pw.Text('(For office use only)',
                style: const pw.TextStyle(fontSize: 8)),
            pw.SizedBox(height: 2),
            pw.Row(
              children: [
                pw.Text('Customer ID:', style: const pw.TextStyle(fontSize: 8)),
                charBoxes('', 15),
                pw.Spacer(),
                pw.Text('Application type:',
                    style: const pw.TextStyle(fontSize: 8)),
                labeledCheckbox('New', checked: true),
                pw.SizedBox(width: 4),
                labeledCheckbox('Update'),
              ],
            ),
            pw.SizedBox(height: 1),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text('Account No.:',
                        style: const pw.TextStyle(fontSize: 8)),
                    charBoxes('', 15),
                  ],
                ),
                pw.Spacer(),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text('CKYC No.:',
                              style: const pw.TextStyle(fontSize: 8)),
                          charBoxes('', 20),
                        ],
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(left: 45),
                        child: pw.Text('(Mandatory for CKYC update request)',
                            style: const pw.TextStyle(fontSize: 6)),
                      )
                    ]),
              ],
            ),
            pw.SizedBox(height: 1),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text('Account type:',
                    style: const pw.TextStyle(fontSize: 8)),
                labeledCheckbox('Normal', checked: true),
                pw.SizedBox(width: 8),
                labeledCheckbox('Small (For low risk customers)'),
              ],
            ),
          ],
        )
      ],
    );
  }
}