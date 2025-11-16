// lib/screens/pdfdesign8.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart'; // <--- ADDED: Import the data model

/// Builds the eighth page of the document.
pw.Widget buildEighthPage(FormDataModel data) { // <--- MODIFIED: Accepts data
  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.black, width: 1),
    ),
    padding: const pw.EdgeInsets.all(8),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildTopInstructions(),
        pw.SizedBox(height: 8),
        _buildDocumentsTable(),
        pw.SizedBox(height: 8),
        _buildBottomInstructions(),
      ],
    ),
  );
}

// Builds the initial instruction section that appears ABOVE the table
pw.Widget _buildTopInstructions() {
  const double regularFontSize = 9;
  const double indent = 15;

  return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('2.', style: pw.TextStyle(fontSize: regularFontSize)),
            pw.SizedBox(width: 5),
            pw.Expanded(
              child: pw.Text(
                'The person accepting the declaration shall not accept the declaration where the amount of income of the nature referred to in item 22b exceeds the maximum amount which is not chargeable to tax, unless PAN is applied for and column 21 is duly filled.',
                textAlign: pw.TextAlign.justify,
                style: pw.TextStyle(fontSize: regularFontSize),
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Text(
          'Instruction:',
          style: pw.TextStyle(
            fontSize: regularFontSize,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(width: indent),
            pw.Container(width: 15, child: pw.Text('(1)', style: pw.TextStyle(fontSize: regularFontSize))),
            pw.SizedBox(width: 5),
            pw.Expanded(
              child: pw.Text(
                  'Documents which can be produced in support of identity and address (not required if applied for PAN and item 20 is filled): - (Following list is only for supporting document for Form 60)',
                  textAlign: pw.TextAlign.justify,
                  style: pw.TextStyle(fontSize: regularFontSize)),
            ),
          ],
        ),
      ]);
}

// Builds the documents table
pw.Widget _buildDocumentsTable() {
  final List<Map<String, String>> dataA = [
    {'sl': '1', 'doc': 'AADHAR card', 'code': '01', 'identity': 'Yes', 'address': 'Yes'},
    {'sl': '2', 'doc': 'Bank/Post office passbook bearing photograph of the person', 'code': '02', 'identity': 'Yes', 'address': 'Yes'},
    {'sl': '3', 'doc': 'Elector\'s photo identity card', 'code': '03', 'identity': 'Yes', 'address': 'Yes'},
    {'sl': '4', 'doc': 'Ration/Public Distribution System card bearing photograph of the person', 'code': '04', 'identity': 'Yes', 'address': 'Yes'},
    {'sl': '5', 'doc': 'Driving License', 'code': '05', 'identity': 'Yes', 'address': 'Yes'},
    {'sl': '6', 'doc': 'Passport', 'code': '06', 'identity': 'Yes', 'address': 'Yes'},
    {'sl': '7', 'doc': 'Pensioner Photo card', 'code': '07', 'identity': 'Yes', 'address': 'Yes'},
    {'sl': '8', 'doc': 'National Rural Employment Guarantee Scheme (NREGS) Job Card', 'code': '08', 'identity': 'Yes', 'address': 'Yes'},
    {'sl': '9', 'doc': 'Caste or Domicile certificate bearing photo of the person', 'code': '09', 'identity': 'Yes', 'address': 'Yes'},
    {'sl': '10', 'doc': 'Certificate of identity/address signed by a Member of Parliament or Member of Legislative Assembly or Municipal Councillor or a Gazetted Officer as per annexure A prescribed in Form 49A', 'code': '10', 'identity': 'Yes', 'address': 'Yes'},
    {'sl': '11', 'doc': 'Certificate from employer as per annexure B prescribed in Form 49A', 'code': '11', 'identity': 'Yes', 'address': 'Yes'},
    {'sl': '12', 'doc': 'Kisan passbook bearing photo', 'code': '12', 'identity': 'Yes', 'address': 'No'},
    {'sl': '13', 'doc': 'Arm\'s license', 'code': '13', 'identity': 'Yes', 'address': 'No'},
    {'sl': '14', 'doc': 'Central Government Health Scheme/ Ex -Service men contributory Health Scheme', 'code': '14', 'identity': 'Yes', 'address': 'No'},
    {'sl': '15', 'doc': 'Photo identity card issued by the government/Public Sector Undertaking', 'code': '15', 'identity': 'Yes', 'address': 'No'},
    {'sl': '16', 'doc': 'Electricity bill (Not more than 3 months old)', 'code': '16', 'identity': 'No', 'address': 'Yes'},
    {'sl': '17', 'doc': 'Landline Telephone bill (Not more than 3 months old)', 'code': '17', 'identity': 'No', 'address': 'Yes'},
    {'sl': '18', 'doc': 'Water bill (Not more than 3 months old)', 'code': '18', 'identity': 'No', 'address': 'Yes'},
    {'sl': '19', 'doc': 'Consumer gas card/book or piped gas bill (Not more than months old)', 'code': '19', 'identity': 'No', 'address': 'Yes'},
    {'sl': '20', 'doc': 'Bank Account Statement (Not more than 3 months old)', 'code': '20', 'identity': 'No', 'address': 'Yes'},
    {'sl': '21', 'doc': 'Credit Card statement (Not more than 3 months old)', 'code': '21', 'identity': 'No', 'address': 'Yes'},
    {'sl': '22', 'doc': 'Depository Account Statement (Not more than 3 months old)', 'code': '22', 'identity': 'No', 'address': 'Yes'},
    {'sl': '23', 'doc': 'Property registration document', 'code': '23', 'identity': 'No', 'address': 'Yes'},
    {'sl': '24', 'doc': 'Allotment letter of accommodation from Government', 'code': '24', 'identity': 'No', 'address': 'Yes'},
    {'sl': '25', 'doc': 'Passport of spouse bearing name of the person', 'code': '25', 'identity': 'No', 'address': 'Yes'},
    {'sl': '26', 'doc': 'Property tax payment receipt (Not more than one year old)', 'code': '26', 'identity': 'No', 'address': 'Yes'},
  ];

  pw.Widget _buildHeaderCell(String text) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(2),
      alignment: pw.Alignment.center,
      child: pw.Text(
        text,
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
      ),
    );
  }

  pw.Widget _buildCell(String text, {pw.FontWeight? fontWeight, double fontSize = 7.5}) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(2),
      alignment: pw.Alignment.centerLeft,
      child: pw.Text(
        text,
        style: pw.TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }

  List<pw.TableRow> rowsA = dataA.map((item) {
    return pw.TableRow(
      children: [
        _buildCell(item['sl']!),
        _buildCell(item['doc']!),
        _buildCell(item['code']!,),
        _buildCell(item['identity']!),
        _buildCell(item['address']!),
      ],
    );
  }).toList();

  return pw.Table(
    border: pw.TableBorder.all(),
    columnWidths: const {
      0: pw.FlexColumnWidth(0.5),
      1: pw.FlexColumnWidth(4),
      2: pw.FlexColumnWidth(1),
      3: pw.FlexColumnWidth(1),
      4: pw.FlexColumnWidth(1),
    },
    children: [
      pw.TableRow(
        children: [
          _buildHeaderCell('Sl.'),
          _buildHeaderCell('Nature of Documents'),
          _buildHeaderCell('Document Code'),
          _buildHeaderCell('Proof of Identity'),
          _buildHeaderCell('Proof of Address'),
        ],
      ),
      pw.TableRow(
        children: [
          _buildCell('A', fontWeight: pw.FontWeight.bold),
          _buildCell('For Individuals and HUF', fontWeight: pw.FontWeight.bold),
          _buildCell(''),_buildCell(''),_buildCell(''),
        ],
      ),
      ...rowsA,
      pw.TableRow(
        children: [
          _buildCell('B', fontWeight: pw.FontWeight.bold),
          _buildCell('For Association of persons (Trusts)', fontWeight: pw.FontWeight.bold),
          _buildCell(''),_buildCell(''),_buildCell(''),
        ],
      ),
      pw.TableRow(
        children: [
          _buildCell(''),
          _buildCell('Copy of trust deed or copy of certificate of registration issued by Charity Commissioner'),
          _buildCell('27'),
          _buildCell('Yes'),
          _buildCell('Yes'),
        ],
      ),
      pw.TableRow(
        children: [
          _buildCell('C', fontWeight: pw.FontWeight.bold),
          _buildCell('For Association of persons (other than Trusts) or Body of Individuals or Local authority or Artificial Juridical Person', fontWeight: pw.FontWeight.bold, fontSize: 7),
          _buildCell(''),_buildCell(''),_buildCell(''),
        ],
      ),
      pw.TableRow(
        children: [
          _buildCell(''),
          _buildCell('Copy of Agreement or copy of certificate of registration issued by Charity commissioner or Registrar of Cooperative society or any other competent authority or any other document originating from any Central or State Government Department establishing identity and address of such person.', fontSize: 7),
          _buildCell('28'),
          _buildCell('Yes'),
          _buildCell('Yes'),
        ],
      ),
    ],
  );
}

// Builds the final instruction section that appears BELOW the table
pw.Widget _buildBottomInstructions() {
  const double regularFontSize = 9;
  const double indent = 15;

  // Helper for indented points
  pw.Widget indentedPoint(String label, String text) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(width: indent), // Indentation
        pw.Container(width: 15, child: pw.Text(label, style: pw.TextStyle(fontSize: regularFontSize))),
        pw.SizedBox(width: 5),
        pw.Expanded(
          child: pw.Text(text, textAlign: pw.TextAlign.justify, style: pw.TextStyle(fontSize: regularFontSize)),
        ),
      ],
    );
  }

  return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        indentedPoint('(2)', 'In case of a transaction in the name of a Minor, any of the above-mentioned documents as proof of Identity and Address of any of parents/guardians of such minor shall be deemed to be the proof of identity and address for the minor declarant, and the declaration should be signed by the parent/guardian.'),
        pw.SizedBox(height: 4),
        indentedPoint('(3)', 'For HUF any document in the name of Karta of HUF is required.'),
        pw.SizedBox(height: 4),
        indentedPoint('(4)', 'In case the transaction is in the name of more than one person the total number of persons should be mentioned in Sl. No. 18 and the total amount of transaction is to be filled in Sl. No. 16.'),
        pw.SizedBox(height: 8),
        pw.Text('In case the estimated total income in column 22b exceeds the maximum amount not chargeable to tax the person should apply for PAN, fill out item 21 and furnish proof of submission of application.',
            textAlign: pw.TextAlign.justify, style: pw.TextStyle(fontSize: regularFontSize)),
      ]
  );
}