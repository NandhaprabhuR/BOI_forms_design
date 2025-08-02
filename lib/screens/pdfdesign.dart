import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfDesignPage extends StatelessWidget {
  const PdfDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Form Preview'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        build: (format) => _generatePdf(format),
      ),
    );
  }

  // --- Main PDF Generation Function ---
  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final doc = pw.Document();

    final regularFont = await rootBundle.load("assets/fonts/Roboto-Regular.ttf");
    final boldFont = await rootBundle.load("assets/fonts/Roboto-Bold.ttf");

    final theme = pw.ThemeData.withFont(
      base: pw.Font.ttf(regularFont),
      bold: pw.Font.ttf(boldFont),
    );

    doc.addPage(
      pw.Page(
        theme: theme,
        pageFormat: format,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              _buildHeader(context),
              _buildSection1(context),
              _buildSection2(context),
              _buildSection3(context),
            ],
          );
        },
      ),
    );

    return doc.save();
  }

  // --- SECTION BUILDERS ---

  pw.Widget _buildHeader(pw.Context context) {
    return pw.Column(children: [
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
        pw.Text('PSB', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.Column(children: [
          pw.Text('ACCOUNT OPENING FORM FOR RESIDENT INDIVIDUAL (PART-1)', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
          pw.Text('CUSTOMER INFORMATION SHEET (CIF Creation/Amendment)', style: const pw.TextStyle(fontSize: 9)),
        ]),
        pw.Text('बैंक ऑफ इंडिया\nBank of India', textAlign: pw.TextAlign.right, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
      ]),
      pw.SizedBox(height: 10),
      _buildLabeledBoxesRow('Branch Name :', 'GANAPATHYPALAYAM', 15, 'Branch Code :', '', 6, 'Date :', '', 8),
      pw.SizedBox(height: 5),
      _buildLabeledBoxesRow('Customer ID:', '', 15, 'Application type:', null, 0, '', null, 0),
      _buildLabeledBoxesRow('Account No.:', '', 15, 'CKYC No.:', '', 15, '', null, 0),
    ]);
  }

  pw.Widget _buildSection1(pw.Context context) {
    return pw.Column(children: [
      _buildSectionTitle('1. Personal Details'),
      _buildLabeledBoxesRow('Existing Customer ID:', '', 15, '', null, 0, '', null, 0),
      _buildLabeledBoxesRow('Name*:', 'Mr. ARUNKUMAR', 30, 'Maiden Name:', '', 30),
      pw.Table(
          columnWidths: { 0: const pw.FlexColumnWidth(1.2), 1: const pw.FlexColumnWidth(2), 2: const pw.FlexColumnWidth(1), 3: const pw.FlexColumnWidth(2)},
          children: [
            pw.TableRow(children: [
              _buildLabel('Date of Birth*:'), _buildBoxes('15032000', 8),
              _buildLabel('Gender*:'), _buildCheckboxRow([
                pw.Checkbox(name: 'gender_male', value: true, tristate: true), pw.Text('Male', style: const pw.TextStyle(fontSize: 9)),
              ]),
            ]),
            pw.TableRow(children: [
              _buildLabel('Marital Status*:'), _buildCheckboxRow([
                pw.Checkbox(name: 'marital_married', value: true, tristate: true), pw.Text('Married', style: const pw.TextStyle(fontSize: 9)),
              ]),
              _buildLabel('No. of Dependents:'), _buildBoxes('', 2),
            ]),
          ]
      ),
      _buildLabeledBoxesRow('Name of Father*:', 'BALASUBRAMANIYAM', 30, 'Name of Mother*:', 'GOWRI', 30),
      _buildLabeledBoxesRow('Name of Spouse*:', 'KRITHIKA', 30, 'Name of Guardian:', '', 30),
      pw.Table(columnWidths: { 0: const pw.FlexColumnWidth(1.5), 1: const pw.FlexColumnWidth(4.5)}, children: [
        pw.TableRow(children: [ _buildLabel('Nationality*:'), _buildCheckboxRow([pw.Checkbox(name: 'nationality_indian', value: true, tristate: true), pw.Text('In-Indian', style: const pw.TextStyle(fontSize: 9))])]),
        pw.TableRow(children: [ _buildLabel('Occupation Type*:'), _buildCheckboxRow([
          pw.Checkbox(name: 'occ_service', value: false), pw.Text('S-Service', style: const pw.TextStyle(fontSize: 9)),
          pw.Checkbox(name: 'occ_business', value: false), pw.Text('B-Business', style: const pw.TextStyle(fontSize: 9)),
          pw.Checkbox(name: 'occ_agri', value: true, tristate: true), pw.Text('Agriculture', style: const pw.TextStyle(fontSize: 9)),
        ])]),
        pw.TableRow(children: [ _buildLabel('Monthly Income*: Rs.'), _buildBoxes('30000', 6) ]),
        pw.TableRow(children: [ _buildLabel('Religion:'), _buildCheckboxRow([pw.Checkbox(name: 'religion_hindu', value: true, tristate: true), pw.Text('Hindu', style: const pw.TextStyle(fontSize: 9)), pw.Checkbox(name: 'religion_muslim', value: false), pw.Text('Muslim', style: const pw.TextStyle(fontSize: 9))])]),
        pw.TableRow(children: [ _buildLabel('Category:'), _buildCheckboxRow([pw.Checkbox(name: 'cat_gen', value: false), pw.Text('General', style: const pw.TextStyle(fontSize: 9)), pw.Checkbox(name: 'cat_obc', value: false), pw.Text('OBC', style: const pw.TextStyle(fontSize: 9)), pw.Checkbox(name: 'cat_sc', value: false), pw.Text('SC', style: const pw.TextStyle(fontSize: 9))])]),
        pw.TableRow(children: [ _buildLabel('Customer Type:'), _buildCheckboxRow([pw.Checkbox(name: 'cust_gen', value: false), pw.Text('General', style: const pw.TextStyle(fontSize: 9)), pw.Checkbox(name: 'cust_sr', value: false), pw.Text('Sr. Citizen', style: const pw.TextStyle(fontSize: 9)), pw.Checkbox(name: 'cust_minor', value: false), pw.Text('Minor', style: const pw.TextStyle(fontSize: 9))])]),
        pw.TableRow(children: [ _buildLabel('Person with disability:'), _buildCheckboxRow([pw.Checkbox(name: 'dis_yes', value: false), pw.Text('Yes', style: const pw.TextStyle(fontSize: 9)), pw.Checkbox(name: 'dis_no', value: true, tristate: true), pw.Text('No', style: const pw.TextStyle(fontSize: 9))])]),
        pw.TableRow(children: [ _buildLabel('Educational Qualification:'), _buildCheckboxRow([pw.Checkbox(name: 'edu_grad', value: false), pw.Text('Graduate', style: const pw.TextStyle(fontSize: 9)), pw.Checkbox(name: 'edu_postgrad', value: false), pw.Text('Post Graduate', style: const pw.TextStyle(fontSize: 9))])]),
      ]),
      _buildLabeledBoxesRow('PAN*:', '', 10, 'Place/City of Birth*:', '', 15),
    ]);
  }

  pw.Widget _buildSection2(pw.Context context) {
    return pw.Column(children: [
      _buildSectionTitle('2. Contact Details (All communications will be sent on provided Mobile No./Email-ID)'),
      _buildLabeledBoxesRow('Mobile No. +91', '9999999999', 10, 'Alternate Mob. No.', '', 10),
      _buildLabeledBoxesRow('Email ID:', '', 30, 'Tel(Off):', '', 10),
      _buildLabeledBoxesRow('', null, 0, 'Tel(Res):', '', 10),
    ]);
  }

  pw.Widget _buildSection3(pw.Context context) {
    return pw.Column(children: [
      _buildSectionTitle('3. Proof of Identity/Address (Please tick the appropriate Box (any one ID type) and give details)*'),
      pw.Wrap(
          spacing: 10, runSpacing: 5,
          children: [
            _buildCheckboxRow([pw.Checkbox(name: 'proof_passport', value: false), pw.Text('A. PASSPORT', style: const pw.TextStyle(fontSize: 9))]),
            _buildCheckboxRow([pw.Checkbox(name: 'proof_voter', value: false), pw.Text('B. VOTER\'S IDENTITY CARD', style: const pw.TextStyle(fontSize: 9))]),
            _buildCheckboxRow([pw.Checkbox(name: 'proof_dl', value: false), pw.Text('C. DRIVING LICENCE', style: const pw.TextStyle(fontSize: 9))]),
            _buildCheckboxRow([pw.Checkbox(name: 'proof_aadhaar', value: true, tristate: true), pw.Text('D. Proof of possession of AADHAAR', style: const pw.TextStyle(fontSize: 9))]),
            _buildCheckboxRow([pw.Checkbox(name: 'proof_nrega', value: false), pw.Text('E. NREGA JOB CARD', style: const pw.TextStyle(fontSize: 9))]),
          ]
      ),
      pw.SizedBox(height: 8),
      _buildLabeledBoxesRow('Document No/Identification Number*:', '222222222222', 12, '', null, 0),
      _buildLabeledBoxesRow('Issue Date*:', '', 8, 'Expiry Date (If applicable)*:', '', 8),
    ]);
  }


  // --- UTILITY WIDGETS ---

  pw.Widget _buildSectionTitle(String title) {
    return pw.Container( margin: const pw.EdgeInsets.symmetric(vertical: 4), padding: const pw.EdgeInsets.all(3), width: double.infinity, color: PdfColors.grey200, child: pw.Text(title, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9)));
  }

  pw.Widget _buildLabeledBoxesRow(String label1, String? value1, int count1, String? label2, String? value2, int? count2, [String? label3, String? value3, int? count3]) {
    return pw.Container( padding: const pw.EdgeInsets.symmetric(vertical: 2.0), child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
      pw.Expanded(flex: (label2 != null && label2.isNotEmpty) ? 2 : 1, child: _buildLabeledBoxes(label1, value1, count1)),
      if(label2 != null && label2.isNotEmpty) pw.SizedBox(width: 10),
      if(label2 != null && label2.isNotEmpty) pw.Expanded(flex: 2, child: _buildLabeledBoxes(label2, value2, count2!)),
      if(label3 != null && label3.isNotEmpty) pw.SizedBox(width: 10),
      if(label3 != null && label3.isNotEmpty) pw.Expanded(flex: 1, child: _buildLabeledBoxes(label3, value3, count3!)),
    ],
    ));
  }

  pw.Widget _buildLabeledBoxes(String label, String? value, int count) {
    return pw.Row(children: [ _buildLabel(label), if(value != null) _buildBoxes(value, count) ]);
  }

  pw.Widget _buildBoxes(String value, int count) {
    List<pw.Widget> boxes = [];
    List<String> chars = value.split('');
    for (int i = 0; i < count; i++) {
      boxes.add(pw.Container( width: 11, height: 13, decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.black, width: 0.5)), child: pw.Center(child: pw.Text(i < chars.length ? chars[i] : '', style: const pw.TextStyle(fontSize: 8))),));
    }
    return pw.Row(children: boxes);
  }

  pw.Widget _buildLabel(String text) { return pw.SizedBox(width: 100, child: pw.Text(text, style: const pw.TextStyle(fontSize: 9))); }

  pw.Widget _buildCheckboxRow(List<pw.Widget> children) { return pw.Row( children: children.map((e) => pw.Padding(padding: const pw.EdgeInsets.only(right: 5), child: e)).toList() ); }
}