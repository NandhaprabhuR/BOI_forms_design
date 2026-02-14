// lib/screens/pdfdesign7.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart';

// Main build function
pw.Widget buildSeventhPage(FormDataModel data, {pw.MemoryImage? declarantSignature}) {
  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.black, width: 1.5),
    ),
    padding: const pw.EdgeInsets.all(10),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        _buildHeader(),
        pw.SizedBox(height: 8),
        _buildFormTable(data),
        pw.SizedBox(height: 15),
        _buildVerificationSection(data, declarantSignature),
        pw.SizedBox(height: 15),
        _buildFinalNoteSection(),
      ],
    ),
  );
}

pw.Widget _buildHeader() {
  const double regularFontSize = 9;
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      pw.Align(
        alignment: pw.Alignment.topRight,
        child: pw.Text(
          'Annexure-1',
          style: pw.TextStyle(fontSize: regularFontSize),
        ),
      ),
      pw.SizedBox(height: 8),
      pw.Text(
        'Income-tax Rules, 1962',
        style: pw.TextStyle(fontSize: regularFontSize),
      ),
      pw.SizedBox(height: 3),
      pw.Text(
        'FORM NO. 60',
        style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold),
      ),
      pw.SizedBox(height: 3),
      pw.Text(
        '[See second proviso to rule 114B]',
        style: pw.TextStyle(fontSize: regularFontSize),
      ),
      pw.SizedBox(height: 8),
      pw.Text(
        'Form for declaration to be filed by an individual or a person (not being a company or firm) who does not have a permanent account number and who enters into any transaction specified in rule 114B',
        textAlign: pw.TextAlign.justify,
        style: pw.TextStyle(fontSize: regularFontSize),
      ),
    ],
  );
}

pw.Widget _buildFormTable(FormDataModel data) {
  const PdfColor borderColor = PdfColors.black;

  final List<Map<String, String>> simpleRowsData = [
    {
      'no': '3',
      'desc': 'Father\'s Name (in case of individual)',
      'value': data.form60FatherName.isNotEmpty ? data.form60FatherName : (data.fatherName + " " + (data.fatherPrefix.isNotEmpty ? data.fatherPrefix : "")),
    },
    {
      'no': '4',
      'desc': 'Flat No./Floor No.',
      'value': data.form60FlatNo.isNotEmpty ? data.form60FlatNo : (data.currentAddress),
    },
    {
      'no': '5',
      'desc': 'Name of premises / Block Name & No.',
      'value': data.form60PremisesName.isNotEmpty ? data.form60PremisesName : data.currentAddressLine2,
    },
    {
      'no': '6',
      'desc': 'Road / Street / Lane',
      'value': data.form60RoadStreet,
    },
    {
      'no': '7',
      'desc': 'Area / Locality',
      'value': data.form60AreaLocality.isNotEmpty ? data.form60AreaLocality : data.currentDistrict,
    },
    {
      'no': '8',
      'desc': 'Town/District/State',
      'value': data.form60TownDistrictState.isNotEmpty ? data.form60TownDistrictState : "${data.currentCity}, ${data.currentState}",
    },
    {
      'no': '9',
      'desc': 'Pin code',
      'value': data.form60PinCode.isNotEmpty ? data.form60PinCode : data.currentPin,
    },
    {
      'no': '10',
      'desc': 'Telephone Number (with STD code)',
      'value': data.form60TelephoneSTD.isNotEmpty ? data.form60TelephoneSTD : data.telRes,
    },
    {
      'no': '11',
      'desc': 'Mobile Number',
      'value': data.form60MobileNumber.isNotEmpty ? data.form60MobileNumber : data.mobileNo,
    },
    {
      'no': '12',
      'desc': 'Amount of Transaction (Rs.)',
      'value': data.form60TransactionAmount,
    },
    {
      'no': '14',
      'desc': 'In case of transaction in joint names, number of persons involved in the transaction',
      'value': data.form60JointPersonsCount,
    },
    {
      'no': '16',
      'desc': 'Aadhaar Number issued by UIDAI (if available)',
      'value': data.form60AadhaarNumber.isNotEmpty ? data.form60AadhaarNumber : data.aadharDocNo,
    },
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
      _buildNameRow('1', 'First\nName', data),
      _buildDateRow(
        '2',
        'Date of Birth / Incorporation of declarant',
        data.form60DateOfBirth.isNotEmpty ? data.form60DateOfBirth : data.dob,
      ),
      ...simpleRowsData.where((row) => int.parse(row['no']!) <= 10).map((
        rowData,
      ) {
        return _buildSimpleRow(
          rowData['no']!,
          rowData['desc']!,
          rowData['value']!,
        );
      }).toList(),
      _buildDateRow('13', 'Date of transaction', data.form60TransactionDate.isNotEmpty ? data.form60TransactionDate : data.date),
      ...simpleRowsData.where((row) => int.parse(row['no']!) > 10).map((
        rowData,
      ) {
        return _buildSimpleRow(
          rowData['no']!,
          rowData['desc']!,
          rowData['value']!,
        );
      }).toList(),
      _buildModeRow('15', 'Mode of transaction', data),
      _buildPanAppliedRow(
        '17',
        'If applied for PAN and it is not yet generated enter date of application and acknowledgement number',
        data,
      ),
      _buildIncomeRow(
        '18',
        'If PAN not applied, fill estimated total income (including income of spouse, minor child etc., as per section 64 of Income-tax Act, 1961) for the financial year in which the above transaction is held',
        data,
      ),
      _buildDocumentRow(
        '19',
        'Details of document being produced in support of identity in Column 1 (Refer Instruction overleaf)',
        data,
        isAddress: false,
      ),
      _buildDocumentRow(
        '20',
        'Details of document being produced in support of address in Column 4 to 13 (Refer Instruction overleaf)',
        data,
        isAddress: true,
      ),
    ],
  );
}

pw.Widget _buildVerificationSection(FormDataModel data, pw.MemoryImage? declarantSignature) {
  const double regularFontSize = 9.0;
  const double smallFontSize = 8.0;
  const PdfColor borderColor = PdfColors.black;

  pw.Widget underlineWithText(String text, {double width = 100}) {
    return pw.Container(
      width: width,
      padding: pw.EdgeInsets.only(bottom: 1),
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: borderColor, width: 0.5),
        ),
      ),
      child: pw.Text(
        text,
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(fontSize: regularFontSize),
      ),
    );
  }

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Center(
        child: pw.Text(
          'Verification',
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            decoration: pw.TextDecoration.underline,
            fontSize: 11,
          ),
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
              text: ' ${_getFullName(data)} ',
              style: pw.TextStyle(decoration: pw.TextDecoration.underline, fontWeight: pw.FontWeight.bold),
            ),
            pw.TextSpan(text: ' do '),
            pw.TextSpan(
              text: ' hereby declare that what is stated above is true to the best of my knowledge and belief. I further declare that I do not have a Permanent Account Number and my / our estimated total income (including income of spouse, minor child etc., as per section 64 of Income Tax Act, 1961) computed in accordance with the provisions of Income tax Act, 1961 for the financial year in which the above transaction is held will be less than maximum amount not chargeable to tax.',
            ),
          ],
        ),
      ),
      pw.SizedBox(height: 15),
      pw.Row(
        children: [
          pw.Text(
            'Verified today the ',
            style: pw.TextStyle(fontSize: regularFontSize),
          ),
          underlineWithText(data.form60VerifiedDay.isNotEmpty ? data.form60VerifiedDay : data.date.split('/').first, width: 50),
          pw.Text(' day of ', style: pw.TextStyle(fontSize: regularFontSize)),
          underlineWithText(data.form60VerifiedMonth.isNotEmpty ? data.form60VerifiedMonth : '', width: 100),
          pw.Text(' 20', style: pw.TextStyle(fontSize: regularFontSize)),
          underlineWithText(data.form60VerifiedYear.isNotEmpty ? data.form60VerifiedYear : data.date.split('/').last, width: 50),
        ],
      ),
      pw.SizedBox(height: 25),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Place :',
                style: pw.TextStyle(
                  fontSize: regularFontSize,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 4),
              underlineWithText(data.form60VerificationPlace.isNotEmpty ? data.form60VerificationPlace : data.branchName, width: 120),
            ],
          ),
          pw.Column(
            children: [
              pw.Container(
                width: 150,
                height: 50,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: borderColor, width: 0.5),
                ),
                child: declarantSignature != null
                    ? pw.Image(declarantSignature, fit: pw.BoxFit.contain)
                    : pw.Center(
                        child: pw.Text(
                          _getFullName(data),
                          style: pw.TextStyle(fontSize: regularFontSize),
                        ),
                      ),
              ),
              pw.SizedBox(height: 3),
              pw.Text(
                '(Signature of declarant)',
                style: pw.TextStyle(fontSize: smallFontSize),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

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
            child: pw.Text(
              text,
              textAlign: pw.TextAlign.justify,
              style: pw.TextStyle(fontSize: fontSize),
            ),
          ),
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
              text: 'Note: ',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            pw.TextSpan(
              text:
                  'Before signing the declaration, the declarant should satisfy himself that the information furnished in this form is true, correct and complete in all respects. Any person making a false statement in the declaration shall be liable to prosecution under section 277 of the Income-tax Act, 1961 and on conviction be punishable,',
            ),
          ],
        ),
      ),
      indentedPoint(
        '(i)',
        'in a case where tax sought to be evaded exceeds twenty-five lakh rupees, with rigorous imprisonment which shall not be less than six months but which may extend to seven years and with fine;',
      ),
      indentedPoint(
        '(ii)',
        'in any other case, with rigorous imprisonment which shall not be less than three months but which may extend to two years and with fine.',
      ),
    ],
  );
}

pw.Widget _buildCell(
  String text, {
  pw.TextAlign align = pw.TextAlign.left,
  pw.TextStyle? style,
  double fontSize = 9,
  pw.FontWeight? fontWeight,
  pw.EdgeInsets? padding,
}) {
  final defaultStyle = pw.TextStyle(fontSize: fontSize, fontWeight: fontWeight);
  final effectiveStyle = style ?? defaultStyle;
  final finalStyle = effectiveStyle.fontSize == null
      ? effectiveStyle.copyWith(fontSize: fontSize)
      : effectiveStyle;

  return pw.Padding(
    padding:
        padding ?? const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
    child: pw.Text(text, textAlign: align, style: finalStyle),
  );
}

pw.TableRow _buildSimpleRow(String no, String desc, String value) {
  return pw.TableRow(
    children: [
      _buildCell(no, align: pw.TextAlign.center),
      _buildCell(desc),
      _buildCell(value),
    ],
  );
}

String _getFullName(FormDataModel data) {
  final firstName = data.form60FirstName.isNotEmpty ? data.form60FirstName : data.customerFirstName;
  final middleName = data.form60MiddleName.isNotEmpty ? data.form60MiddleName : data.customerMiddleName;
  final surname = data.form60Surname.isNotEmpty ? data.form60Surname : data.customerLastName;
  return [firstName, middleName, surname].where((s) => s.isNotEmpty).join(' ');
}

pw.TableRow _buildNameRow(String no, String desc, FormDataModel data) {
  const PdfColor borderColor = PdfColors.black;
  final firstName = data.form60FirstName.isNotEmpty ? data.form60FirstName : data.customerFirstName;
  final middleName = data.form60MiddleName.isNotEmpty ? data.form60MiddleName : data.customerMiddleName;
  final surname = data.form60Surname.isNotEmpty ? data.form60Surname : data.customerLastName;
  
  return pw.TableRow(
    children: [
      _buildCell(no, align: pw.TextAlign.center),
      _buildCell(desc, align: pw.TextAlign.center),
      pw.Row(
        children: [
          pw.Expanded(
            flex: 2,
            child: _buildCell(
              firstName,
              align: pw.TextAlign.center,
              style: pw.TextStyle(
                letterSpacing: 2,
                fontWeight: pw.FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
          pw.Container(width: 1, height: 35, color: borderColor),
          pw.Expanded(
            flex: 1,
            child: _buildCell(
              middleName,
              align: pw.TextAlign.center,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Container(width: 1, height: 35, color: borderColor),
          pw.Expanded(
            flex: 1,
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                _buildCell(
                  'Surname',
                  align: pw.TextAlign.center,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
                ),
                _buildCell(
                  surname,
                  align: pw.TextAlign.center,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

// Helper to format date to DDMMYYYY
String _formatDate(String date) {
  if (date.isEmpty) return '';
  // Try parsing recognized formats
  try {
    DateTime? parsed;
    if (date.contains('/')) {
      final parts = date.split('/');
      if (parts.length == 3) {
        // Assume dd/mm/yyyy
        parsed = DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
      }
    } else if (date.contains('-')) {
      final parts = date.split('-');
      if (parts.length == 3) {
        // Assume yyyy-mm-dd
        parsed = DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
      }
    }
    
    if (parsed != null) {
      final d = parsed.day.toString().padLeft(2, '0');
      final m = parsed.month.toString().padLeft(2, '0');
      final y = parsed.year.toString();
      return '$d$m$y';
    }
  } catch (e) {
    // Fallback: just remove non-digits
  }
  return date.replaceAll(RegExp(r'[^0-9]'), '');
}

// Restoration of missing methods

pw.TableRow _buildModeRow(String no, String desc, FormDataModel data) {
  const borderColor = PdfColors.black;
  
  final modeChecks = [
    data.form60ModeCash,
    data.form60ModeCheque,
    data.form60ModeCard,
    data.form60ModeDraft,
    data.form60ModeOnlineTransfer,
    data.form60ModeOther,
  ];
  
  const modes = [
    'Cash',
    'Cheque',
    'Card',
    'Draft/Banker\'s Cheque',
    'Online transfer',
    'Other',
  ];

  List<pw.Widget> buildModeWidgets() {
    List<pw.Widget> widgets = [];
    for (int i = 0; i < modes.length; i++) {
      widgets.add(
        pw.Expanded(
          child: pw.Container(
            padding: const pw.EdgeInsets.symmetric(vertical: 2),
            child: pw.Column(
              children: [
                pw.Text(
                  modes[i],
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(fontSize: 7.5),
                ),
                pw.SizedBox(height: 2),
                pw.Container(
                  width: 10,
                  height: 10,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(width: 1),
                  ),
                  child: modeChecks[i]
                      ? pw.Center(
                          child: pw.Text('✓', style: pw.TextStyle(fontSize: 8)),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      );
      if (i < modes.length - 1) {
        widgets.add(pw.Container(width: 1, color: borderColor));
      }
    }
    return widgets;
  }

  return pw.TableRow(
    children: [
      _buildCell(no, align: pw.TextAlign.center),
      _buildCell(desc),
      pw.Row(children: buildModeWidgets()),
    ],
  );
}

pw.TableRow _buildPanAppliedRow(String no, String desc, FormDataModel data) {
  return pw.TableRow(
    children: [
      _buildCell(no, align: pw.TextAlign.center),
      _buildCell(desc, fontSize: 9),
      pw.Padding(
        padding: const pw.EdgeInsets.all(4),
        child: pw.Text(
          'Date : ${data.form60PanApplicationDate.isNotEmpty ? data.form60PanApplicationDate : "_______________"} and acknowledgement number : ${data.form60PanAckNo.isNotEmpty ? data.form60PanAckNo : "_______________"}',
          style: pw.TextStyle(fontSize: 8),
        ),
      ),
    ],
  );
}

pw.TableRow _buildIncomeRow(String no, String desc, FormDataModel data) {
  return pw.TableRow(
    children: [
      _buildCell(no, align: pw.TextAlign.center),
      _buildCell(desc, fontSize: 8),
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _buildCell(
            '(a) Agricultural income (Rs.) ${data.form60AgriculturalIncome.isNotEmpty ? data.form60AgriculturalIncome : "_______"}',
            fontSize: 8,
          ),
          pw.Divider(height: 0.5),
          _buildCell(
            '(b) Other than Agr Income (Rs.) ${data.form60OtherIncome.isNotEmpty ? data.form60OtherIncome : "_______"}',
            fontSize: 8,
          ),
        ],
      ),
    ],
  );
}

// Updated _buildDateRow to be generic and use formatter
pw.TableRow _buildDateRow(String no, String desc, String dateValue) {
  final chars = _formatDate(dateValue);
  
  return pw.TableRow(
    children: [
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
              decoration: pw.BoxDecoration(border: pw.Border.all(width: 1)),
              child: pw.Center(
                  child: pw.Text(
                      index < chars.length ? chars[index] : '',
                      style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)
                  )
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

// Updated Document Row (already fixed fontWeight param in previous step, ensuring logic persists)
pw.TableRow _buildDocumentRow(String no, String desc, FormDataModel data, {required bool isAddress}) {
  const PdfColor borderColor = PdfColors.black;
  
  String code = '';
  String name = '';
  String identificationNo = ''; 

  if (isAddress) {
      if (data.altProofUtilityBill) { code = '16'; name = 'Utility Bill'; identificationNo = data.altProofDocumentNo; }
      else if (data.altProofPPOFPPO) { code = '07'; name = 'Pension Payment Order'; identificationNo = data.altProofDocumentNo; }
      else if (data.altProofPropertyTaxReceipt) { code = '26'; name = 'Property Tax Receipt'; identificationNo = data.altProofDocumentNo; }
      else if (data.altProofLetterOfAllotment) { code = '24'; name = 'Allotment Letter'; identificationNo = data.altProofDocumentNo; }
      else if (data.docTypeAadhaar) { code = '01'; name = 'Aadhaar Card'; identificationNo = data.aadharDocNo; }
      else if (data.docTypeVoterIdCard) { code = '03'; name = 'Voter ID'; identificationNo = data.documentNo; }
      else if (data.docTypeDrivingLicence) { code = '05'; name = 'Driving License'; identificationNo = data.documentNo; }
      else if (data.docTypePassport) { code = '06'; name = 'Passport'; identificationNo = data.documentNo; }
      else if (data.docTypeNregaJobCard) { code = '08'; name = 'NREGA Job Card'; identificationNo = data.documentNo; }
  } else {
      if (data.docTypeAadhaar) { code = '01'; name = 'Aadhaar Card'; identificationNo = data.aadharDocNo; }
      else if (data.docTypeVoterIdCard) { code = '03'; name = 'Voter ID'; identificationNo = data.documentNo; }
      else if (data.docTypeDrivingLicence) { code = '05'; name = 'Driving License'; identificationNo = data.documentNo; }
      else if (data.docTypePassport) { code = '06'; name = 'Passport'; identificationNo = data.documentNo; }
      else if (data.docTypeNregaJobCard) { code = '08'; name = 'NREGA Job Card'; identificationNo = data.documentNo; }
  }

  if (identificationNo.isEmpty && data.documentNo.isNotEmpty && !isAddress) {
      identificationNo = data.documentNo;
      name = 'Identity Document';
  }
  
  // Fallback for Address Proof
  if (identificationNo.isEmpty && data.altProofDocumentNo.isNotEmpty && isAddress) {
      identificationNo = data.altProofDocumentNo;
      name = 'Address Proof Document';
  }

  return pw.TableRow(
    children: [
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
          pw.TableRow(
            children: [
              _buildCell('Document code', fontSize: 8, fontWeight: pw.FontWeight.bold),
              _buildCell('Document identification number', fontSize: 8, fontWeight: pw.FontWeight.bold),
              _buildCell(
                'Name and address of the authority issuing the document',
                fontSize: 8,
                fontWeight: pw.FontWeight.bold,
              ),
            ],
          ),
           pw.TableRow(
            children: [
              _buildCell(code, fontSize: 8),
              _buildCell(identificationNo, fontSize: 8),
              _buildCell(name, fontSize: 8), 
            ],
          ),
        ],
      ),
    ],
  );
}
