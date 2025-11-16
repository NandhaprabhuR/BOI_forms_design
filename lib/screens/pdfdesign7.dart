// lib/screens/pdf_page_7.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart'; // <--- NEW: Import the data model

// Main build function
pw.Widget buildSeventhPage(FormDataModel data) { // <--- MODIFIED
  // A Container to wrap the entire page content and add a border
  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.black, width: 1.5),
    ),
    padding: const pw.EdgeInsets.all(10), // Padding between the border and content
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        _buildHeader(),
        pw.SizedBox(height: 8),
        _buildFormTable(data), // <--- MODIFIED
        pw.SizedBox(height: 15),
        _buildVerificationSection(data), // <--- MODIFIED
        pw.SizedBox(height: 15),
        _buildFinalNoteSection(),
      ],
    ),
  );
}

// Helper function dedicated to building the header. (Unchanged)
pw.Widget _buildHeader() {
  const double regularFontSize = 9;
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      pw.Align(
        alignment: pw.Alignment.topRight,
        child: pw.Text('Annexure-1', style: pw.TextStyle(fontSize: regularFontSize)),
      ),
      pw.SizedBox(height: 8),
      pw.Text('Income-tax Rules, 1962', style: pw.TextStyle(fontSize: regularFontSize)),
      pw.SizedBox(height: 3),
      pw.Text('FORM NO. 60', style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold)),
      pw.SizedBox(height: 3),
      pw.Text('[See second proviso to rule 114B]', style: pw.TextStyle(fontSize: regularFontSize)),
      pw.SizedBox(height: 8),
      pw.Text(
        'Form for declaration to be filed by an individual or a person (not being a company or firm) who does not have a permanent account number and who enters into any transaction specified in rule 114B',
        textAlign: pw.TextAlign.justify,
        style: pw.TextStyle(fontSize: regularFontSize),
      ),
    ],
  );
}

// Helper function dedicated to building the main table.
pw.Widget _buildFormTable(FormDataModel data) { // <--- MODIFIED
  const PdfColor borderColor = PdfColors.black;

  // ===== FIX: Add a length check for the mobile number =====
  final safeMobile = data.mobileNo.length > 3 ? data.mobileNo.substring(3) : '';

  // ===== FIX: Safely split the address to prevent RangeError =====
  final addressParts = data.currentAddress.split(' ');
  final flatNo = addressParts.isNotEmpty ? addressParts[0] : ''; // Gets first word, or '' if empty
  final road = addressParts.length > 1 ? addressParts[1] : ''; // Gets second word, or '' if no second word
  // ============================================================

  final List<Map<String, String>> simpleRowsData = [
    {'no': '2', 'desc': 'Date of Birth / Incorporation of declarant', 'value': data.dob}, // <--- FROM MODEL
    {'no': '3', 'desc': 'Father\'s Name (in case of individual)', 'value': data.form60FatherName}, // <--- FROM MODEL
    {'no': '4', 'desc': 'Flat No./Floor No.', 'value': flatNo}, // <--- FIX APPLIED
    {'no': '5', 'desc': 'Name of premises / Block Name & No.', 'value': ''},
    {'no': '6', 'desc': 'Road / Street / Lane', 'value': road}, // <--- FIX APPLIED
    {'no': '7', 'desc': 'Area / Locality', 'value': data.currentCity}, // <--- FROM MODEL (used city)
    {'no': '8', 'desc': 'Town/District/State', 'value': data.currentDistrict}, // <--- FROM MODEL (used district)
    {'no': '9', 'desc': 'Pin code', 'value': data.currentPin}, // <--- FROM MODEL
    {'no': '10', 'desc': 'Telephone Number (with STD code)', 'value': ''},
    {'no': '11', 'desc': 'Mobile Number', 'value': safeMobile}, // <--- FROM MODEL (FIX APPLIED HERE)
    {'no': '12', 'desc': 'Amount of Transaction (Rs.)', 'value': ''},
    {'no': '14', 'desc': 'In case of transaction in joint names, number of persons involved in the transaction', 'value': ''},
    {'no': '16', 'desc': 'Aadhaar Number issued by UIDAI (if available)', 'value': data.aadharDocNo}, // <--- FROM MODEL
  ];

  return pw.Table(
    border: pw.TableBorder.all(color: borderColor, width: 1),
    columnWidths: const {
      0: pw.FlexColumnWidth(0.6),
      1: pw.FlexColumnWidth(3),
      2: pw.FlexColumnWidth(5),
    },
    defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
    children: [
      _buildNameRow('1', 'First\nName', data), // <--- MODIFIED
      ...simpleRowsData.where((row) => int.parse(row['no']!) <= 10).map((rowData) {
        return _buildSimpleRow(rowData['no']!, rowData['desc']!, rowData['value']!);
      }).toList(),
      _buildDateRow('13', 'Date of transaction'),
      ...simpleRowsData.where((row) => int.parse(row['no']!) > 10).map((rowData) {
        return _buildSimpleRow(rowData['no']!, rowData['desc']!, rowData['value']!);
      }).toList(),
      _buildModeRow('15', 'Mode of transaction'),
      _buildPanAppliedRow('17', 'If applied for PAN and it is not yet generated enter date of application and acknowledgement number'),
      _buildIncomeRow('18', 'If PAN not applied, fill estimated total income (including income of spouse, minor child etc., as per section 64 of Income-tax Act, 1961) for the financial year in which the above transaction is held'),
      _buildDocumentRow('19', 'Details of document being produced in support of identify in Column 1 (Refer Instruction overleaf)'),
      _buildDocumentRow('20', 'Details of document being produced in support of identify in Column 4 to 13 (Refer Instruction overleaf)'),
    ],
  );
}

// Helper function for the Verification section
pw.Widget _buildVerificationSection(FormDataModel data) { // <--- MODIFIED
  const double regularFontSize = 9;
  const double smallFontSize = 7.5;
  const PdfColor borderColor = PdfColors.black;

  pw.Widget underlineWithText(String text, {double width = 80}) {
    return pw.Container(
      width: width,
      padding: pw.EdgeInsets.only(bottom: 1),
      decoration: pw.BoxDecoration(
        border: pw.Border(bottom: pw.BorderSide(color: borderColor, width: 0.5)),
      ),
      child: pw.Text(text, textAlign: pw.TextAlign.center, style: pw.TextStyle(fontSize: regularFontSize)),
    );
  }

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Center(
        child: pw.Text(
          'Verification',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline, fontSize: 11),
        ),
      ),
      pw.SizedBox(height: 8),
      pw.RichText(
        textAlign: pw.TextAlign.justify,
        text: pw.TextSpan(
          style: pw.TextStyle(fontSize: regularFontSize, lineSpacing: 2),
          children: [
            pw.TextSpan(text: 'I, '),
            pw.TextSpan(
              text: ' ${data.customerFirstName} ', // <--- FROM MODEL
              style: pw.TextStyle(decoration: pw.TextDecoration.underline),
            ),
            pw.TextSpan(text: ' do '),
            pw.TextSpan(
              text: ' ' * 20,
              style: pw.TextStyle(decoration: pw.TextDecoration.underline),
            ),
            pw.TextSpan(
                text: ' hereby declare that what is stated above is true to the best of my knowledge and belief. I further declare that I do not have a Permanent Account Number and my / our estimated total income (including income of spouse, minor child etc., as per section 64 of Income Tax Act, 1961) computed in accordance with the provisions of Income tax Act, 1961 for the financial year in which the above transaction is held will be less than maximum amount not chargeable to tax.'),
          ],
        ),
      ),
      pw.SizedBox(height: 15),
      pw.Row(
        children: [
          pw.Text('Verified today the ', style: pw.TextStyle(fontSize: regularFontSize)),
          underlineWithText(data.form60VerifiedDay, width: 50), // <--- FROM MODEL
          pw.Text(' day of ', style: pw.TextStyle(fontSize: regularFontSize)),
          underlineWithText(data.form60VerifiedMonth, width: 100), // <--- FROM MODEL
          pw.Text(' 20', style: pw.TextStyle(fontSize: regularFontSize)),
          underlineWithText(data.form60VerifiedYear, width: 50), // <--- FROM MODEL
        ],
      ),
      pw.SizedBox(height: 25),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Text('Place : ${data.form60VerificationPlace}', style: pw.TextStyle(fontSize: regularFontSize, fontWeight: pw.FontWeight.bold)), // <--- FROM MODEL
          pw.Column(
            children: [
              pw.Text(data.customerFirstName, style: pw.TextStyle(fontSize: regularFontSize)), // <--- FROM MODEL
              pw.SizedBox(height: 2),
              pw.Container(width: 150, height: 1, color: borderColor),
              pw.SizedBox(height: 3),
              pw.Text('(Signature of declarant)', style: pw.TextStyle(fontSize: smallFontSize)),
            ],
          ),
        ],
      )
    ],
  );
}

// Helper function for the final note section. (Unchanged)
pw.Widget _buildFinalNoteSection() {
  const double fontSize = 9;

  pw.Widget indentedPoint(String label, String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(left: 20, top: 4),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(label, style: pw.TextStyle(fontSize: fontSize)),
          pw.SizedBox(width: 5),
          pw.Expanded(
              child: pw.Text(text,
                  textAlign: pw.TextAlign.justify,
                  style: pw.TextStyle(fontSize: fontSize))),
        ],
      ),
    );
  }

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.RichText(
        textAlign: pw.TextAlign.justify,
        text: pw.TextSpan(
          style: pw.TextStyle(fontSize: fontSize),
          children: [
            pw.TextSpan(
                text: 'Note: ', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.TextSpan(
                text: 'Before signing the declaration, the declarant should satisfy himself that the information furnished in this form is true, correct and complete in all respects. Any person making a false statement in the declaration shall be liable to prosecution under section 277 of the Income-tax Act, 1961 and on conviction be punishable,'),
          ],
        ),
      ),
      indentedPoint('(i)', 'in a case where tax sought to be evaded exceeds twenty-five lakh rupees, with rigorous imprisonment which shall not be less than six months but which may extend to seven years and with fine;'),
      indentedPoint('(ii)', 'in any other case, with rigorous imprisonment which shall not be less than three months but which may extend to two years and with fine.'),
    ],
  );
}


// --- EXISTING TABLE HELPER FUNCTIONS ---

// UPDATED: Now accepts an optional TextStyle
pw.Widget _buildCell(
    String text, {
      pw.TextAlign align = pw.TextAlign.left,
      pw.TextStyle? style,
      double fontSize = 9,
      pw.EdgeInsets? padding,
    }) {
  final defaultStyle = pw.TextStyle(fontSize: fontSize);
  final effectiveStyle = style ?? defaultStyle;

  // If a style is passed, we use its properties. Otherwise, we use the defaults.
  final finalStyle = effectiveStyle.fontSize == null
      ? effectiveStyle.copyWith(fontSize: fontSize)
      : effectiveStyle;

  return pw.Padding(
    padding: padding ?? const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
    child: pw.Text(
      text,
      textAlign: align,
      style: finalStyle,
    ),
  );
}

pw.TableRow _buildSimpleRow(String no, String desc, String value) {
  return pw.TableRow(children: [
    _buildCell(no, align: pw.TextAlign.center),
    _buildCell(desc),
    _buildCell(value), // Uses default style with no letter spacing
  ]);
}

// UPDATED Helper function for Row 1 to match the new style.
pw.TableRow _buildNameRow(String no, String desc, FormDataModel data) { // <--- MODIFIED
  const PdfColor borderColor = PdfColors.black;
  return pw.TableRow(
    children: [
      _buildCell(no, align: pw.TextAlign.center),
      _buildCell(desc, align: pw.TextAlign.center),
      pw.Row(
        children: [
          pw.Expanded(
            flex: 2,
            child: _buildCell(
              data.customerFirstName, // <--- FROM MODEL
              align: pw.TextAlign.center,
              style: pw.TextStyle(
                  letterSpacing: 3,
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10),
            ),
          ),
          pw.Container(width: 1, height: 35, color: borderColor),
          pw.Expanded(
              flex: 1,
              child: _buildCell(
                  'Middle\nName',
                  align: pw.TextAlign.center,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)
              )
          ),
          pw.Container(width: 1, height: 35, color: borderColor),
          pw.Expanded(
              flex: 1,
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  _buildCell('Surname',
                      align: pw.TextAlign.center,
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  _buildCell(data.form60Surname, // <--- FROM MODEL
                      align: pw.TextAlign.center,
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              )
          ),
        ],
      ),
    ],
  );
}

pw.TableRow _buildDateRow(String no, String desc) {
  return pw.TableRow(children: [
    _buildCell(no, align: pw.TextAlign.center),
    _buildCell(desc),
    pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: pw.Row(
        children: List.generate(
            8,
                (index) => pw.Container(
              width: 14,
              height: 14,
              margin: const pw.EdgeInsets.only(right: 1),
              decoration:
              pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
            )),
      ),
    ),
  ]);
}

pw.TableRow _buildModeRow(String no, String desc) {
  const modes = [
    'Cash',
    'Cheque',
    'Card',
    'Draft/Banker\'s Cheque',
    'Online transfer',
    'Other'
  ];
  const borderColor = PdfColors.black;

  List<pw.Widget> buildModeWidgets() {
    List<pw.Widget> widgets = [];
    for (int i = 0; i < modes.length; i++) {
      widgets.add(pw.Expanded(
          child: _buildCell(modes[i],
              align: pw.TextAlign.center,
              fontSize: 7.5,
              padding: const pw.EdgeInsets.symmetric(vertical: 2))));
      if (i < modes.length - 1) {
        widgets.add(pw.Container(width: 1, color: borderColor));
      }
    }
    return widgets;
  }

  return pw.TableRow(children: [
    _buildCell(no, align: pw.TextAlign.center),
    _buildCell(desc),
    pw.Row(children: buildModeWidgets()),
  ]);
}

pw.TableRow _buildPanAppliedRow(String no, String desc) {
  return pw.TableRow(children: [
    _buildCell(no, align: pw.TextAlign.center),
    _buildCell(desc, fontSize: 9),
    pw.Padding(
      padding: const pw.EdgeInsets.all(4),
      child: pw.Text(
          'Date : _______________ and acknowledgement number : _______________',
          style: pw.TextStyle(fontSize: 8)),
    ),
  ]);
}

pw.TableRow _buildIncomeRow(String no, String desc) {
  return pw.TableRow(children: [
    _buildCell(no, align: pw.TextAlign.center),
    _buildCell(desc, fontSize: 8),
    pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildCell('(a) Agricultural income (Rs.)', fontSize: 8),
        pw.Divider(height: 0.5),
        _buildCell('(b) Other than Agr Income (Rs.)', fontSize: 8),
      ],
    ),
  ]);
}

pw.TableRow _buildDocumentRow(String no, String desc) {
  const PdfColor borderColor = PdfColors.black;
  return pw.TableRow(children: [
    _buildCell(no, align: pw.TextAlign.center),
    _buildCell(desc, fontSize: 8),
    pw.Table(
        columnWidths: const {
          0: pw.FlexColumnWidth(1.5),
          1: pw.FlexColumnWidth(2),
          2: pw.FlexColumnWidth(3),
        },
        border: pw.TableBorder(
          horizontalInside: pw.BorderSide.none,
          verticalInside: pw.BorderSide(color: borderColor, width: 1),
        ),
        children: [
          pw.TableRow(children: [
            _buildCell('Document code', fontSize: 8),
            _buildCell('Document identification number', fontSize: 8),
            _buildCell(
                'Name and address of the authority issuing the document',
                fontSize: 8),
          ])
        ]),
  ]);
}