// lib/screens/pdfdesign9.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart' show FormDataModel;



/// Builds the Tax Residency details section. (Unchanged)
pw.Widget _buildTaxResidencySection() {
  const double regularFontSize = 8;
  const double smallFontSize = 7;

  pw.Widget _buildHeaderCell(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(2),
      child: pw.Text(
        text,
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
          fontSize: smallFontSize,
        ),
      ),
    );
  }

  pw.Widget _buildEmptyCell() {
    return pw.SizedBox(height: 6);
  }

  pw.Widget _bulletPoint(String text) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(width: 10), // Indent
        pw.Text('*', style: pw.TextStyle(fontSize: regularFontSize)),
        pw.SizedBox(width: 5),
        pw.Expanded(
          child: pw.Text(text, style: pw.TextStyle(fontSize: regularFontSize)),
        ),
      ],
    );
  }

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Table(
        border: pw.TableBorder.all(),
        columnWidths: const {
          0: pw.FlexColumnWidth(2),
          1: pw.FlexColumnWidth(3),
          2: pw.FlexColumnWidth(3),
        },
        children: [
          pw.TableRow(
            children: [
              _buildHeaderCell('Country of Tax Residence#'),
              _buildHeaderCell(
                'Tax Identification number or equivalent if issued by Jurisdiction',
              ),
              _buildHeaderCell(
                'Identification type (TIN or Other, please specify)',
              ),
            ],
          ),
          pw.TableRow(
            children: [_buildEmptyCell(), _buildEmptyCell(), _buildEmptyCell()],
          ),
          pw.TableRow(
            children: [_buildEmptyCell(), _buildEmptyCell(), _buildEmptyCell()],
          ),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Text(
        '# In case, country of tax residence is Indian, PAN is treated as TIN',
        style: pw.TextStyle(fontSize: smallFontSize),
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('@', style: pw.TextStyle(fontSize: regularFontSize)),
          pw.SizedBox(width: 5),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _bulletPoint(
                  'A citizen of US including individual born in US but resident in another country (who has not given up US citizenship',
                ),
                _bulletPoint(
                  'A person residing in US including US green card holder',
                ),
                _bulletPoint(
                  'Certain persons who spend more than 180 days in US each year',
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

/// Builds the FATCA Declaration Form section.
pw.Widget _buildFatcaDeclarationForm(FormDataModel data) {
  const double smallFontSize = 7;

  return pw.Column(
    children: [
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey300,
        padding: const pw.EdgeInsets.all(2),
        child: pw.Center(
          child: pw.Text(
            'FATCA Declaration Form',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
          ),
        ),
      ),
      pw.Container(
        padding: const pw.EdgeInsets.fromLTRB(8, 6, 8, 6),
        decoration: pw.BoxDecoration(
          border: pw.Border(
            left: pw.BorderSide(),
            right: pw.BorderSide(),
            bottom: pw.BorderSide(),
          ),
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _buildFormField('Customer ID:', _buildBoxes(18, text: data.customerId)),
                _buildFormField('CKYC No.:', _buildBoxes(14, text: data.ckycNo)),
              ],
            ),
            pw.SizedBox(height: 3),
            _buildFormField('Account No.:', _buildBoxes(18, text: data.accountNo)),
            pw.SizedBox(height: 3),
            _buildFormField(
              'Name*:',
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                   _buildNameRowSimple(
                    data.customerPrefix,
                    data.customerFirstName,
                    data.customerMiddleName,
                    data.customerLastName,
                   ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 2, top: 1),
                    child: pw.Text(
                      'Prefix',
                      style: pw.TextStyle(fontSize: smallFontSize),
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 3),
            pw.Row(
              children: [
                _buildFormField(
                  'Citizenship*:',
                  pw.Row(
                    children: [
                      _buildCheckbox('IN-India', isChecked: data.nationalityInIndian),
                      pw.SizedBox(width: 8),
                      _buildCheckbox('Others', isChecked: data.nationalityOthers),
                    ],
                  ),
                ),
                pw.SizedBox(width: 15),
                pw.Expanded(
                  child: _buildFormField('Country Name:', _buildBoxes(15, text: data.countryName)),
                ),
              ],
            ),
            pw.SizedBox(height: 3),
            pw.Row(
              children: [
                pw.Expanded(
                  child: _buildFormField(
                    'Place/City of Birth*:',
                    _buildBoxes(15, text: data.placeCityOfBirth),
                  ),
                ),
                pw.SizedBox(width: 15),
                pw.Expanded(
                  child: _buildFormField('Country of Birth*:', _buildBoxes(15, text: data.countryCodeOfBirth)),
                ),
              ],
            ),
            pw.SizedBox(height: 3),
            _buildFormField(
              'Address*',
              pw.Column(
                children: [
                  _buildBoxes(38, text: data.currentAddress),
                  pw.SizedBox(height: 2),
                  _buildBoxes(38, text: data.currentAddressLine2),
                ],
              ),
            ),
            pw.SizedBox(height: 3),
            pw.Row(
              children: [
                pw.Expanded(
                  child: _buildFormField('City/Village*:', _buildBoxes(18, text: data.currentCity)),
                ),
                pw.SizedBox(width: 15),
                pw.Expanded(
                  child: _buildFormField('District*:', _buildBoxes(18, text: data.currentDistrict)),
                ),
              ],
            ),
            pw.SizedBox(height: 3),
            pw.Row(
              children: [
                pw.Expanded(child: _buildFormField('State:*', _buildBoxes(24, text: data.currentState))),
                pw.SizedBox(width: 15),
                pw.Expanded(child: _buildFormField('Pin:*', _buildBoxes(8, text: data.currentPin))),
              ],
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              'Multiple Tax Residency: Details of Country of Tax Residence in India, and/or in USA@ And /or in any other Country or Territory Outside India as Under:',
              style: pw.TextStyle(fontSize: smallFontSize),
            ),
          ],
        ),
      ),
    ],
  );
}

/// Builds the entire Annexure-2 form section.
pw.Widget _buildAnnexure2Form(FormDataModel data) {
  const double smallFontSize = 7;

  return pw.Column(
    children: [
      pw.Align(
        alignment: pw.Alignment.topRight,
        child: pw.Padding(
          padding: const pw.EdgeInsets.only(top: 2, right: 4),
          child: pw.Text('Annexure-2', style: pw.TextStyle(fontSize: 10)),
        ),
      ),
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey300,
        padding: const pw.EdgeInsets.all(2),
        child: pw.Center(
          child: pw.Text(
            'Details of Related Person (To be filled for minor)',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
          ),
        ),
      ),
      pw.Container(
        padding: const pw.EdgeInsets.fromLTRB(8, 6, 8, 6),
        child: pw.Column(
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                _buildFormField('Customer ID:', _buildBoxes(18, text: data.customerId)),
                _buildFormField('CKYC No.:', _buildBoxes(12, text: data.ckycNo)),
              ],
            ),
            pw.SizedBox(height: 3),
            _buildFormField('Account No.:', _buildBoxes(18, text: data.accountNo)),
            pw.SizedBox(height: 3),
            _buildNameRow(
              'Name*:',
              data.relatedPersonPrefix,
              data.relatedPersonFirstName,
            ),
            pw.SizedBox(height: 4),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                _buildCheckbox('Addition of Related Person'),
                _buildCheckbox('Deletion of Related Person'),
              ],
            ),
            pw.SizedBox(height: 4),
            _buildFormField(
              'KYC of Related Person (If Available)*:',
              _buildBoxes(18, text: data.relatedPersonDocNo),
            ),
            pw.SizedBox(height: 4),
            _buildRelatedPersonTypeRow(),
            pw.SizedBox(height: 3),
            _buildNameRow(
              'Name*:',
              data.relatedPersonPrefix,
              data.relatedPersonFirstName,
              isRelatedPerson: true,
            ),
            pw.SizedBox(height: 3),
            pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                '(If KYC Number and name are provided, below details are optional)',
                style: pw.TextStyle(
                  fontSize: smallFontSize,
                  fontStyle: pw.FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

// Builds the Proof of Identity section
pw.Widget _buildProofOfIdentitySection(FormDataModel data) {
  const double regularFontSize = 9;

  final poiList = {
    'A-PASSPORT': false,
    'B-VOTER\'S IDENTITY CARD': false,
    'C-DRIVING LICENCE': false,
    'D-UID(AADHAR)': true, // Defaulting for visual consistency in sample, logic needed if related person type supported
    'E-NREGA JOB CARD': false,
    'F-LETTER ISSUED BY NATIONAL POPULATION REGISTER CONTAINING DETAILS OF NAME & ADDRESS':
        false,
    'G-OTHERS': false,
  };

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        'PROOF OF IDENTITY(POI) OF RELATED PERSON*',
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
          fontSize: regularFontSize,
        ),
      ),
      pw.SizedBox(height: 3),
      ...poiList.entries.map((entry) {
        return pw.Padding(
          padding: const pw.EdgeInsets.only(bottom: 2.0),
          child: _buildCheckbox(
            entry.key,
            isChecked: entry.value,
            labelFontSize: entry.key.startsWith('F-') ? 7.5 : regularFontSize,
          ),
        );
      }).toList(),
      pw.Padding(
        padding: const pw.EdgeInsets.only(left: 30),
        child: pw.Text(
          '(Any Document notified by the Central Government/RBI)',
          style: const pw.TextStyle(fontSize: 7.5),
        ),
      ),
      pw.SizedBox(height: 4),
      _buildFormField(
        'Document No/Identification Number*',
        _buildBoxes(30, text: data.relatedPersonDocNo),
      ),
      pw.SizedBox(height: 4),
      pw.Row(
        children: [
          _buildDateField('Issue date:*', "00000000"), // No data for related person dates
          pw.SizedBox(width: 20),
          _buildDateField('Expiry Date(If Applicable):*', "00000000"), // No data for related person dates
        ],
      ),
      pw.SizedBox(height: 4),
      pw.Row(
        children: [
          pw.Text(
            'Remarks',
            style: const pw.TextStyle(fontSize: regularFontSize),
          ),
          pw.SizedBox(width: 4),
          pw.Expanded(
            child: pw.Container(
              height: 8,
              decoration: const pw.BoxDecoration(
                border: pw.Border(bottom: pw.BorderSide()),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

/// Builds the ninth page of the document with a single form border.
pw.Widget buildNinthPage(FormDataModel data, {pw.MemoryImage? declarantSignature}) {
  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.black, width: 1),
    ),
    padding: const pw.EdgeInsets.all(10), // Adds some space inside the border
    child: pw.Column(
      children: [
        _buildAnnexure2Form(data),
        pw.SizedBox(height: 5),
        _buildProofOfIdentitySection(data),
        pw.SizedBox(height: 5),
        // _buildFatcaDeclarationForm(data), // Modified to accept data if needed
        // pw.SizedBox(height: 2),
        // _buildTaxResidencySection(),
        pw.SizedBox(height: 5),
        _buildForeignTaxAddressSection(data, declarantSignature: declarantSignature),
      ],
    ),
  );
}

/// Builds the Foreign Tax Address section, signature, and date.
pw.Widget _buildForeignTaxAddressSection(FormDataModel data, {pw.MemoryImage? declarantSignature}) {
  const double regularFontSize = 9;
  const double smallFontSize = 7;

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        'Address in the Jurisdiction/Country -where the Applicant is Resident out side India for Tax Purposes',
        style: pw.TextStyle(fontSize: 7.5, fontWeight: pw.FontWeight.bold),
      ),
      pw.SizedBox(height: 3),
      _buildFormField(
        'Address*',
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _buildBoxes(38, text: data.overseasAddress),
            pw.SizedBox(height: 2),
            _buildBoxes(38, text: data.overseasAddressLine2)
          ],
        ),
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: _buildFormField('City/Village*:', _buildBoxes(18, text: data.overseasCity)),
          ),
          pw.SizedBox(width: 15),
          pw.Expanded(child: _buildFormField('District*:', _buildBoxes(18, text: data.overseasDistrict))),
        ],
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(child: _buildFormField('Sub-District:', _buildBoxes(18))), // No field
          pw.SizedBox(width: 15),
          pw.Expanded(child: _buildFormField('State:*', _buildBoxes(10, text: data.overseasState))),
        ],
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: _buildFormField('Country Name*:', _buildBoxes(18, text: data.alternateCountry.isNotEmpty ? data.alternateCountry : data.countryName)),
          ),
          pw.SizedBox(width: 15),
          pw.Expanded(child: _buildFormField('ZIP/Post Code*', _buildBoxes(8, text: data.overseasPin))),
        ],
      ),
      pw.SizedBox(height: 6),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _buildFormField(
                'Place:',
                pw.Container(
                  width: 150,
                  height: 10,
                  decoration: pw.BoxDecoration(
                    border: pw.Border(bottom: pw.BorderSide(width: 0.5)),
                  ),
                  child: pw.Text(
                    data.declarationPlace,
                    style: pw.TextStyle(fontSize: regularFontSize),
                  ),
                ),
              ),
              pw.SizedBox(height: 8),
              _buildFormField(
                'Date:',
                pw.Container(
                  width: 150,
                  height: 10,
                  decoration: pw.BoxDecoration(
                    border: pw.Border(bottom: pw.BorderSide(width: 0.5)),
                  ),
                  child: pw.Text(
                    data.declarationDate,
                    style: pw.TextStyle(fontSize: regularFontSize),
                  ),
                ),
              ),
            ],
          ),
          pw.Container(
            width: 180,
            height: 50,
            padding: const pw.EdgeInsets.all(4),
            decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
            child: declarantSignature != null
                ? pw.Center(child: pw.Image(declarantSignature, fit: pw.BoxFit.contain))
                : pw.Center(
                    child: pw.Text(
                      'Signature/thumb impression of the Applicant/Applicants',
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(fontSize: smallFontSize),
                    ),
                  ),
          ),
        ],
      ),
    ],
  );
}

// --- HELPER WIDGETS ---

pw.Widget _buildFormField(String label, pw.Widget field) {
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      pw.Text(label, style: const pw.TextStyle(fontSize: 8)),
      pw.SizedBox(width: 4),
      field,
    ],
  );
}

// Helper to format date to DDMMYYYY
String _formatDate(String date) {
  if (date.isEmpty) return '';
  try {
    DateTime? parsed;
    if (date.contains('/')) {
      final parts = date.split('/');
      if (parts.length == 3) {
        parsed = DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
      }
    } else if (date.contains('-')) {
      final parts = date.split('-');
      if (parts.length == 3) {
        parsed = DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
      }
    }
    if (parsed != null) {
      final d = parsed.day.toString().padLeft(2, '0');
      final m = parsed.month.toString().padLeft(2, '0');
      final y = parsed.year.toString();
      return '$d$m$y';
    }
  } catch (e) {}
  return date.replaceAll(RegExp(r'[^0-9]'), '');
}

pw.Widget _buildBoxes(int count, {String text = '', String placeholder = ''}) {
  List<pw.Widget> boxes = [];
  List<String> chars = text.split('');
  List<String> placeholderChars = placeholder.split('');
  for (int i = 0; i < count; i++) {
    String content = '';
    double fontSize = 8;
    if (i < chars.length) {
      content = chars[i];
    } else if (i < placeholderChars.length) {
      content = placeholderChars[i];
      fontSize = 6;
    }

    boxes.add(
      pw.Container(
        width: 12,
        height: 12,
        alignment: pw.Alignment.center,
        margin: const pw.EdgeInsets.only(right: 1),
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 1)),
        child: pw.Text(content, style: pw.TextStyle(fontSize: fontSize, fontWeight: pw.FontWeight.bold)),
      ),
    );
  }
  return pw.Row(children: boxes);
}

// ... _buildNameRow, _buildNameRowSimple, _buildCheckbox ...

pw.Widget _buildNameRow(
  String label,
  String prefix,
  String name, {
  bool isRelatedPerson = false,
}) {
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      pw.Text(label, style: const pw.TextStyle(fontSize: 8)),
      pw.SizedBox(width: 4),
      if (isRelatedPerson)
        pw.Container(
          width: 50,
          padding: const pw.EdgeInsets.all(1),
          decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
          child: pw.Column(
            children: [
              pw.Text('Prefix', style: const pw.TextStyle(fontSize: 6)),
              pw.Text(prefix, style: const pw.TextStyle(fontSize: 8)),
            ],
          ),
        )
      else
        pw.Container(
          width: 25,
          height: 12,
          alignment: pw.Alignment.center,
          decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
          child: pw.Text(prefix, style: const pw.TextStyle(fontSize: 8)),
        ),
      pw.SizedBox(width: 2),
      _buildBoxes(30, text: name),
    ],
  );
}

pw.Widget _buildNameRowSimple(String prefix, String first, String middle, String last) {
    return _buildBoxes(35, text: "${prefix} ${first} ${middle} ${last}");
}

pw.Widget _buildCheckbox(
  String label, {
  bool isChecked = false,
  double labelFontSize = 9.0,
}) {
  return pw.Row(
    children: [
      pw.Container(
        width: 10,
        height: 10,
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 1)),
        child: isChecked
            ? pw.Center(
                child: pw.Text(
                  '✓',
                  style: pw.TextStyle(
                    fontSize: 8,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              )
            : pw.SizedBox(),
      ),
      pw.SizedBox(width: 4),
      pw.Text(label, style: pw.TextStyle(fontSize: labelFontSize)),
    ],
  );
}

pw.Widget _buildRelatedPersonTypeRow() {
  return pw.Row(
    children: [
      pw.Text('Related Person type*:', style: const pw.TextStyle(fontSize: 8)),
      pw.SizedBox(width: 10),
      _buildCheckbox('Guardian of Minor'),
      pw.SizedBox(width: 10),
      _buildCheckbox('Assignee'),
      pw.SizedBox(width: 10),
      _buildCheckbox('Authorised Representative'),
    ],
  );
}

pw.Widget _buildDateField(String label, String date) {
  final dateStr = _formatDate(date);
  const chars = ['d', 'd', 'm', 'm', 'y', 'y', 'y', 'y'];
  
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(label, style: const pw.TextStyle(fontSize: 8)),
      pw.SizedBox(height: 2),
      pw.Row(
        children: List.generate(8, (i) {
          String content = i < dateStr.length ? dateStr[i] : '';
          bool isPlaceholder = i >= dateStr.length;
          
          return pw.Container(
            width: 12,
            height: 12,
            alignment: pw.Alignment.center,
            margin: const pw.EdgeInsets.only(right: 1),
            decoration: pw.BoxDecoration(border: pw.Border.all(width: 1)),
            child: pw.Text(
                isPlaceholder ? chars[i] : content, 
                style: pw.TextStyle(
                  fontSize: isPlaceholder ? 6 : 9, 
                  color: isPlaceholder ? PdfColors.grey : PdfColors.black,
                  fontWeight: isPlaceholder ? null : pw.FontWeight.bold
                )
            ),
          );
        }),
      ),
    ],
  );
}
