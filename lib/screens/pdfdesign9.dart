// lib/screens/pdfdesign9.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart' show FormDataModel;
import 'pdf_helpers.dart'; // Assuming helper functions are available

/// Builds the ninth page of the document with a single form border.
pw.Widget buildNinthPage(FormDataModel data) { // <--- MODIFIED
  // NEW: A container that wraps the entire page content to add a border.
  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.black, width: 1),
    ),
    padding: const pw.EdgeInsets.all(10), // Adds some space inside the border
    child: pw.Column(
      children: [
        _buildAnnexure2Form(data), // <--- MODIFIED
        pw.SizedBox(height: 5),
        _buildProofOfIdentitySection(data), // <--- MODIFIED
        pw.SizedBox(height: 5),
        _buildFatcaDeclarationForm(),
        pw.SizedBox(height: 2),
        _buildTaxResidencySection(),
        pw.SizedBox(height: 5),
        _buildForeignTaxAddressSection(data), // <--- MODIFIED
      ],
    ),
  );
}

/// Builds the Tax Residency details section. (Unchanged, no custom data used)
pw.Widget _buildTaxResidencySection() {
  const double regularFontSize = 8;
  const double smallFontSize = 7;

  pw.Widget _buildHeaderCell(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(2),
      child: pw.Text(text,
          textAlign: pw.TextAlign.center,
          style:
          pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: smallFontSize)),
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
          pw.Expanded(child: pw.Text(text, style: pw.TextStyle(fontSize: regularFontSize))),
        ]
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
              _buildHeaderCell('Tax Identification number or equivalent if issued by Jurisdiction'),
              _buildHeaderCell('Identification type (TIN or Other, please specify)'),
            ],
          ),
          pw.TableRow(children: [_buildEmptyCell(), _buildEmptyCell(), _buildEmptyCell()]),
          pw.TableRow(children: [_buildEmptyCell(), _buildEmptyCell(), _buildEmptyCell()]),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Text('# In case, country of tax residence is Indian, PAN is treated as TIN',
          style: pw.TextStyle(fontSize: smallFontSize)),
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
                      _bulletPoint('A citizen of US including individual born in US but resident in another country (who has not given up US citizenship'),
                      _bulletPoint('A person residing in US including US green card holder'),
                      _bulletPoint('Certain persons who spend more than 180 days in US each year'),
                    ]
                )
            )
          ]
      )
    ],
  );
}

/// Builds the FATCA Declaration Form section. (Unchanged, no custom data used)
pw.Widget _buildFatcaDeclarationForm() {
  const double smallFontSize = 7;

  return pw.Column(children: [
    pw.Container(
      width: double.infinity,
      color: PdfColors.grey300,
      padding: const pw.EdgeInsets.all(2),
      child: pw.Center(
        child: pw.Text(
          'FATCA Declaration Form',
          style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold, fontSize: 8),
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
            )),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _buildFormField('Customer ID:', _buildBoxes(18)),
                _buildFormField('CKYC No.:', _buildBoxes(14)),
              ],
            ),
            pw.SizedBox(height: 3),
            _buildFormField('Account No.:', _buildBoxes(18)),
            pw.SizedBox(height: 3),
            _buildFormField(
                'Name*:',
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    _buildBoxes(35,
                        placeholder:
                        'F I R S T N A M E M I D D L E N A M E L A S T N A M E'),
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(left: 2, top: 1),
                      child: pw.Text('Prefix', style: pw.TextStyle(fontSize: smallFontSize)),
                    ),
                  ],
                )),
            pw.SizedBox(height: 3),
            pw.Row(
              children: [
                _buildFormField(
                    'Citizenship*:',
                    pw.Row(children: [
                      _buildCheckbox('IN-India'),
                      pw.SizedBox(width: 8),
                      _buildCheckbox('Others'),
                    ])),
                pw.SizedBox(width: 15),
                pw.Expanded(
                    child: _buildFormField('Country Name:', _buildBoxes(15))),
              ],
            ),
            pw.SizedBox(height: 3),
            pw.Row(
              children: [
                pw.Expanded(
                    child:
                    _buildFormField('Place/City of Birth*:', _buildBoxes(15))),
                pw.SizedBox(width: 15),
                pw.Expanded(
                    child:
                    _buildFormField('Country of Birth*:', _buildBoxes(15))),
              ],
            ),
            pw.SizedBox(height: 3),
            _buildFormField(
                'Address*',
                pw.Column(children: [
                  _buildBoxes(38),
                  pw.SizedBox(height: 2),
                  _buildBoxes(38),
                ])),
            pw.SizedBox(height: 3),
            pw.Row(
              children: [
                pw.Expanded(
                    child: _buildFormField('City/Village*:', _buildBoxes(18))),
                pw.SizedBox(width: 15),
                pw.Expanded(
                    child: _buildFormField('District*:', _buildBoxes(18))),
              ],
            ),
            pw.SizedBox(height: 3),
            pw.Row(
              children: [
                pw.Expanded(child: _buildFormField('State:*', _buildBoxes(24))),
                pw.SizedBox(width: 15),
                pw.Expanded(child: _buildFormField('Pin:*', _buildBoxes(8))),
              ],
            ),
            pw.SizedBox(height: 4),
            pw.Text(
                'Multiple Tax Residency: Details of Country of Tax Residence in India, and/or in USA@ And /or in any other Country or Territory Outside India as Under:',
                style: pw.TextStyle(fontSize: smallFontSize)),
          ],
        )),
  ]);
}

/// Builds the entire Annexure-2 form section.
pw.Widget _buildAnnexure2Form(FormDataModel data) { // <--- MODIFIED
  const double smallFontSize = 7;

  // Main container for the section. The outer border was removed from here.
  return pw.Column(
    children: [
      // Top-right "Annexure-2" label
      pw.Align(
        alignment: pw.Alignment.topRight,
        child: pw.Padding(
          padding: const pw.EdgeInsets.only(top: 2, right: 4),
          child: pw.Text('Annexure-2', style: pw.TextStyle(fontSize: 10)),
        ),
      ),
      // Grey title bar
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey300,
        padding: const pw.EdgeInsets.all(2),
        child: pw.Center(
          child: pw.Text(
            'Details of Related Person (To be filled for minor)',
            style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold, fontSize: 8),
          ),
        ),
      ),
      // Form body
      pw.Container(
        padding: const pw.EdgeInsets.fromLTRB(8, 6, 8, 6),
        child: pw.Column(
          children: [
            // Customer ID and CKYC No. Row
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                _buildFormField('Customer ID:', _buildBoxes(18)),
                _buildFormField('CKYC No.:', _buildBoxes(12)),
              ],
            ),
            pw.SizedBox(height: 3),
            _buildFormField('Account No.:', _buildBoxes(18)),
            pw.SizedBox(height: 3),
            _buildNameRow('Name*:', data.relatedPersonPrefix, data.relatedPersonFirstName), // <--- FROM MODEL (Uses parent's name model as a stand-in)
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
                'KYC of Related Person (If Available)*:', _buildBoxes(18)),
            pw.SizedBox(height: 4),
            _buildRelatedPersonTypeRow(),
            pw.SizedBox(height: 3),
            _buildNameRow('Name*:', data.relatedPersonPrefix, data.relatedPersonFirstName, isRelatedPerson: true), // <--- FROM MODEL
            pw.SizedBox(height: 3),
            pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                '(If KYC Number and name are provided, below details are optional)',
                style: pw.TextStyle(
                    fontSize: smallFontSize, fontStyle: pw.FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

// Builds the Proof of Identity section
pw.Widget _buildProofOfIdentitySection(FormDataModel data) { // <--- MODIFIED
  const double regularFontSize = 9;

  final poiList = {
    'A-PASSPORT': false,
    'B-VOTER\'S IDENTITY CARD': false,
    'C-DRIVING LICENCE': false,
    'D-UID(AADHAR)': true,
    'E-NREGA JOB CARD': false,
    'F-LETTER ISSUED BY NATIONAL POPULATION REGISTER CONTAINING DETAILS OF NAME & ADDRESS':
    false,
    'G-OTHERS': false,
  };

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text('PROOF OF IDENTITY(POI) OF RELATED PERSON*',
          style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold, fontSize: regularFontSize)),
      pw.SizedBox(height: 3),
      ...poiList.entries.map((entry) {
        return pw.Padding(
          padding: const pw.EdgeInsets.only(bottom: 2.0),
          child: _buildCheckbox(entry.key,
              isChecked: entry.value,
              labelFontSize:
              entry.key.startsWith('F-') ? 7.5 : regularFontSize),
        );
      }).toList(),
      pw.Padding(
        padding: const pw.EdgeInsets.only(left: 30),
        child: pw.Text('(Any Document notified by the Central Government/RBI)',
            style: const pw.TextStyle(fontSize: 7.5)),
      ),
      pw.SizedBox(height: 4),
      _buildFormField('Document No/Identification Number*',
          _buildBoxes(30, text: data.relatedPersonDocNo)), // <--- FROM MODEL
      pw.SizedBox(height: 4),
      pw.Row(
        children: [
          _buildDateField('Issue date:*'),
          pw.SizedBox(width: 20),
          _buildDateField('Expiry Date(If Applicable):*'),
        ],
      ),
      pw.SizedBox(height: 4),
      pw.Row(
        children: [
          pw.Text('Remarks',
              style: const pw.TextStyle(fontSize: regularFontSize)),
          pw.SizedBox(width: 4),
          pw.Expanded(
            child: pw.Container(
              height: 8,
              decoration: const pw.BoxDecoration(
                  border: pw.Border(bottom: pw.BorderSide())),
            ),
          )
        ],
      )
    ],
  );
}

/// Builds the Foreign Tax Address section, signature, and date.
pw.Widget _buildForeignTaxAddressSection(FormDataModel data) { // <--- MODIFIED
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
            _buildBoxes(38),
            pw.SizedBox(height: 2),
            _buildBoxes(38),
          ],
        ),
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: _buildFormField('City/Village*:', _buildBoxes(18)),
          ),
          pw.SizedBox(width: 15),
          pw.Expanded(
            child: _buildFormField('District*:', _buildBoxes(18)),
          ),
        ],
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: _buildFormField('Sub-District:', _buildBoxes(18)),
          ),
          pw.SizedBox(width: 15),
          pw.Expanded(
            child: _buildFormField('State:*', _buildBoxes(10)),
          ),
        ],
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: _buildFormField('Country Name*:', _buildBoxes(18)),
          ),
          pw.SizedBox(width: 15),
          pw.Expanded(
            child: _buildFormField('ZIP/Post Code*', _buildBoxes(8)),
          ),
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
                  child: pw.Text(data.declarationPlace, style: pw.TextStyle(fontSize: regularFontSize)), // <--- FROM MODEL
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
                  child: pw.Text(data.declarationDate, style: pw.TextStyle(fontSize: regularFontSize)), // <--- FROM MODEL
                ),
              ),
            ],
          ),
          pw.Container(
            width: 180,
            height: 50,
            padding: const pw.EdgeInsets.all(4),
            decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
            child: pw.Center(
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

// Helper to create a row with a label and its field
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

// Helper to create a row of boxes for input
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
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
        child: pw.Text(content, style: pw.TextStyle(fontSize: fontSize)),
      ),
    );
  }
  return pw.Row(children: boxes);
}

// Helper to create a name input row
pw.Widget _buildNameRow(String label, String prefix, String name,
    {bool isRelatedPerson = false}) {
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
          child: pw.Column(children: [
            pw.Text('Prefix', style: const pw.TextStyle(fontSize: 6)),
            pw.Text(prefix, style: const pw.TextStyle(fontSize: 8)),
          ]),
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

// Helper to create a checkbox with a label
pw.Widget _buildCheckbox(String label,
    {bool isChecked = false, double labelFontSize = 9.0}) {
  return pw.Row(
    children: [
      pw.Container(
        width: 10,
        height: 10,
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 1)),
        child: isChecked
            ? pw.Center(
            child: pw.Text('✓',
                style:  pw.TextStyle(
                    fontSize: 8, fontWeight: pw.FontWeight.bold)))
            : pw.SizedBox(),
      ),
      pw.SizedBox(width: 4),
      pw.Text(label, style: pw.TextStyle(fontSize: labelFontSize)),
    ],
  );
}

// Helper to create the 'Related Person Type' row
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

// Helper for date input fields
pw.Widget _buildDateField(String label) {
  const chars = ['d', 'd', 'm', 'm', 'y', 'y', 'y', 'y'];
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(label, style: const pw.TextStyle(fontSize: 8)),
      pw.SizedBox(height: 2),
      pw.Row(
        children: List.generate(8, (i) {
          return pw.Container(
            width: 12,
            height: 12,
            alignment: pw.Alignment.center,
            margin: const pw.EdgeInsets.only(right: 1),
            decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
            child: pw.Text(chars[i], style: const pw.TextStyle(fontSize: 7)),
          );
        }),
      ),
    ],
  );
}