// lib/screens/pdfdesign4.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart';
import 'pdf_helpers.dart'; // Assuming charBoxes and labeledCheckbox are here

// =========================================================================
// == TOP-LEVEL HELPERS (ACCESSIBLE BY ALL SECTIONS)
// =========================================================================

pw.Widget underline(double width) {
  return pw.Container(
    width: width,
    height: 8,
    decoration: const pw.BoxDecoration(
      border: pw.Border(bottom: pw.BorderSide(width: 0.5)),
    ),
  );
}

pw.Widget dottedLine([double width = double.infinity]) {
  return pw.Container(
    width: width,
    height: 6,
    decoration: const pw.BoxDecoration(
      border: pw.Border(
        bottom: pw.BorderSide(width: 0.5, style: pw.BorderStyle.dotted),
      ),
    ),
  );
}

pw.Widget signatureBox({
  pw.MemoryImage? image,
  String text = '',
  String? label,
  double height = 28,
}) {
  return pw.Column(
    mainAxisSize: pw.MainAxisSize.min,
    children: [
      pw.Container(
        height: height,
        width: double.infinity,
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
        child: image != null
            ? pw.Center(child: pw.Image(image, fit: pw.BoxFit.contain))
            : text.isNotEmpty
                ? pw.Center(
                    child: pw.Text(
                      text,
                      style: pw.TextStyle(
                        fontStyle: pw.FontStyle.italic,
                        fontSize: 8,
                      ),
                    ),
                  )
                : pw.SizedBox(),
      ),
      if (label != null) pw.SizedBox(height: 1),
      if (label != null)
        pw.Text(
          label,
          style: const pw.TextStyle(fontSize: 6),
          textAlign: pw.TextAlign.center,
        ),
    ],
  );
}

// =========================================================================
// == MAIN PAGE BUILDER
// =========================================================================

pw.Widget buildFourthPage(
  FormDataModel data,
  pw.MemoryImage? signature1Image,
  pw.MemoryImage? signature2Image, {
  pw.MemoryImage? witnessSignature1,
  pw.MemoryImage? witnessSignature2,
}) {
  // FIXED: Using a Transform to scale the entire content down slightly.
  return pw.Transform.scale(
    scale: 0.95,
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildNominationTitleBar(),
        _buildNominationForm(
          data,
          signature1Image,
          signature2Image,
          witnessSignature1: witnessSignature1,
          witnessSignature2: witnessSignature2,
        ),
        pw.SizedBox(height: 4),
        buildDeclarationSection(
          data,
          signature1Image,
          signature2Image,
        ),
        pw.SizedBox(height: 4),
        buildOfficeUseSection(),
      ],
    ),
  );
}

// FIXED: Added missing helper method
pw.Widget _buildNominationTitleBar() {
  return pw.Container(
    width: double.infinity,
    padding: const pw.EdgeInsets.symmetric(vertical: 2.5),
    decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
    child: pw.Center(
      child: pw.Text(
        'FORM DA 1: NOMINATION FORM',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9.5),
      ),
    ),
  );
}

// FIXED: Added missing helper method
pw.Widget _buildNominationTopPart(FormDataModel data) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.RichText(
        text: pw.TextSpan(
          style: const pw.TextStyle(fontSize: 8),
          children: [
            const pw.TextSpan(text: 'Nomination under section 45ZA of the Banking Regulation Act, 1949 and Rule 2(1) of the Banking Companies (Nomination) Rules, 1985 in respect of bank deposits.\n\n'),
            const pw.TextSpan(text: 'I/We '),
            pw.TextSpan(
              text: '${data.customerFirstName} ${data.customerMiddleName} ${data.customerLastName}',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            const pw.TextSpan(text: ' (Name of the Account Holder/s) nominate the following person to whom in the event of my/our/minor\'s death the of the deposit, particulars whereof are given below, may be returned by Bank of India, Branch '),
            pw.TextSpan(
              text: data.branchName,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            const pw.TextSpan(text: '.'),
          ],
        ),
      ),
      pw.SizedBox(height: 4),
      pw.Table(
        border: pw.TableBorder.all(),
        columnWidths: {
          0: const pw.FlexColumnWidth(2), // Nature of Deposit
          1: const pw.FlexColumnWidth(1.5), // Spec. No.
          2: const pw.FlexColumnWidth(2), // Addl Details
        },
        children: [
          pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(2),
                child: pw.Text('Nature of Deposit', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 7)),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(2),
                child: pw.Text('Account No. ', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 7)),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(2),
                child: pw.Text('Additional Details, if any', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 7)),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(2),
                child: pw.Text(data.depositType, style: const pw.TextStyle(fontSize: 7)),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(2),
                child: pw.Text(data.nominationAccountNo, style: const pw.TextStyle(fontSize: 7)),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(2),
                child: pw.Text('', style: const pw.TextStyle(fontSize: 7)),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

// ...

pw.Widget _buildNominationForm(
  FormDataModel data,
  pw.MemoryImage? signature1Image,
  pw.MemoryImage? signature2Image, {
  pw.MemoryImage? witnessSignature1,
  pw.MemoryImage? witnessSignature2,
}) {
  return pw.Container(
    // ... container decoration ...
    child: pw.Column(
      children: [
        // ... header ...
        pw.Padding(
          padding: const pw.EdgeInsets.fromLTRB(6, 2, 6, 3),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _buildNominationTopPart(data),
              pw.SizedBox(height: 2),
              _buildNomineeDetailsPart(
                data,
                signature1Image,
                signature2Image,
                witnessSignature1: witnessSignature1,
                witnessSignature2: witnessSignature2,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// ...

pw.Widget _buildNomineeDetailsPart(
  FormDataModel data,
  pw.MemoryImage? signature1Image,
  pw.MemoryImage? signature2Image, {
  pw.MemoryImage? witnessSignature1,
  pw.MemoryImage? witnessSignature2,
}) {
  pw.Widget witnessBox({
    String? name,
    String? address,
    pw.MemoryImage? signature,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(2),
      decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            children: [
              pw.Text('Name:', style: const pw.TextStyle(fontSize: 7)),
              pw.SizedBox(width: 4),
              pw.Expanded(
                child: pw.Container(
                  decoration: const pw.BoxDecoration(
                    border: pw.Border(bottom: pw.BorderSide(style: pw.BorderStyle.dotted)),
                  ),
                  child: pw.Text(name ?? '', style: const pw.TextStyle(fontSize: 7)),
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 3),
          pw.Row(
            children: [
              pw.Text('Signature:', style: const pw.TextStyle(fontSize: 7)),
              pw.SizedBox(width: 4),
              pw.Expanded(
                child: signature != null
                    ? pw.Container(
                        height: 20,
                        child: pw.Image(signature, fit: pw.BoxFit.contain),
                      )
                    : dottedLine(),
              ),
            ],
          ),
          pw.SizedBox(height: 3),
          pw.Row(
            children: [
              pw.Text('Address:', style: const pw.TextStyle(fontSize: 7)),
              pw.SizedBox(width: 4),
              pw.Expanded(
                child: pw.Container(
                  decoration: const pw.BoxDecoration(
                    border: pw.Border(bottom: pw.BorderSide(style: pw.BorderStyle.dotted)),
                  ),
                  child: pw.Text(address ?? '', style: const pw.TextStyle(fontSize: 7)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  return pw.Column(
    children: [
      pw.SizedBox(height: 2),
      pw.Row(
        children: [
          pw.Expanded(
            child: witnessBox(
              name: data.witness1Name,
              address: data.witness1Address,
              signature: witnessSignature1,
            ),
          ),
          pw.SizedBox(width: 8),
          pw.Expanded(
            child: witnessBox(
              name: data.witness2Name,
              address: data.witness2Address,
              signature: witnessSignature2,
            ),
          ),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            flex: 3,
            child: pw.Text(
              '(Witnessess are required only in case of applicant is illiterate and if affixing thumb impression)',
              style: const pw.TextStyle(fontSize: 6.5),
            ),
          ),
          pw.Expanded(
            flex: 2,
            child: pw.Row(
              children: [
                pw.Text('Date', style: const pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 4),
                charBoxes(data.date, 8),
                pw.SizedBox(width: 8),
                pw.Text('Place', style: const pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 4),
                pw.Expanded(
                   child: pw.Container(
                    decoration: const pw.BoxDecoration(
                      border: pw.Border(bottom: pw.BorderSide(style: pw.BorderStyle.dotted)),
                    ),
                    child: pw.Text(data.declarationPlace, style: const pw.TextStyle(fontSize: 8)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      pw.SizedBox(height: 2),
      labeledCheckbox(
        'I/We do not want to nominate any person in this account',
        checked: data.nominationNo,
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        children: [
          pw.Expanded(
            child: signatureBox(
              image: signature1Image,
              text: data.signature1Text,
              label:
                  '(Signature of the Applicants/Thumb impression of the Applicants)',
              height: 20,
            ),
          ),
          pw.SizedBox(width: 8),
          pw.Expanded(
            child: signatureBox(
              image: signature2Image,
              text: data.signature2Text,
              label:
                  '(Signature of the Applicants/Thumb impression of the Applicants)',
              height: 20,
            ),
          ),
        ],
      ),
    ],
  );
}

// =========================================================================
// == SECTION 8: DECLARATION
// =========================================================================

pw.Widget buildDeclarationSection(
  FormDataModel data,
  pw.MemoryImage? signature1Image,
  pw.MemoryImage? signature2Image,
) {
  pw.Widget declarationPoint(String number, String text) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(number, style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(width: 3),
        pw.Expanded(
          child: pw.Text(
            text,
            style: const pw.TextStyle(fontSize: 8, height: 1.1),
            textAlign: pw.TextAlign.justify,
          ),
        ),
      ],
    );
  }

  pw.Widget minorAccountDeclaration() {
    final textStyle = pw.TextStyle(fontSize: 8, height: 1.1);
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('2.', style: textStyle),
        pw.SizedBox(width: 3),
        pw.Expanded(
          child: pw.Wrap(
            runSpacing: 1,
            children: [
              pw.Text(
                '(In case of Minor Accounts)\nI hereby declare that date of birth of the minor who is my ',
                style: textStyle,
              ),
              dottedLine(100),
              pw.Text(
                ' and I am his/her natural and lawful guardian/guardian appointed by court order dated ',
                style: textStyle,
              ),
              dottedLine(80),
              pw.Text(
                ' (copy enclosed) I shall represent the said minor in all future transactions of any description in the above account until the said minor attains majority. I indemnify the bank against the claim of the above minor for any withdrawal/transactions made by me in his/her account.',
                textAlign: pw.TextAlign.justify,
                style: textStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Pad the date string
  final declDate = data.declarationDate;
  final safeDate = declDate.padRight(8, ' ');

  // Get date components
  final formattedDate = declDate.isNotEmpty
      ? '${safeDate.substring(0, 2)}.${safeDate.substring(2, 4)}.${safeDate.substring(4, 8)}'
      : '00.00.0000';

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
        child: pw.Text(
          '8 DECLARATION CUM UNDERTAKING CUM SELF-CERTIFICATION',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.5),
        ),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColors.black, width: 0.5),
        ),
        padding: const pw.EdgeInsets.fromLTRB(4, 3, 4, 3),
        child: pw.Column(
          children: [
            declarationPoint(
              '1.',
              'I/We have read the copy of Terms and Conditions of the Account Opening given to me/us. The Terms and Conditions have been explained to me/us and having understood, I/we accept the same.',
            ),
            pw.SizedBox(height: 2),
            minorAccountDeclaration(),
            pw.SizedBox(height: 2),
            declarationPoint(
              '3.',
              '(Applicable in case of Term Deposit Accounts (Strike out if not required))\nI/We undertake that in case of term deposits with operating instructions "Either or Survivor", or" Former or Survivor in line with the operating instructions of the application-cum-deposit slip, premature termination/payment will be allowed to the survivor in event of the death of the either of the depositors or former as the case may be on submission of the death certificate of the deceased depositors along with application without obtaining consent of the legal heirs of the deceased depositors.',
            ),
            pw.SizedBox(height: 2),
            declarationPoint(
              '4.',
              'I/We hereby declare that I do not maintain a Basic Savings Bank Deposit Account (BSBDA) with any other Bank (Applicable in case of BSBD Account)',
            ),
            pw.SizedBox(height: 2),
            declarationPoint(
              '5.',
              'I/We hereby declare that the details above in this form including details in Annexure I and Annexure II are true and correct to the best of my/our knowledge and belief. I further, declare to inform you of any changes therein, immediately. In case of any of the above information is found to be false or untrue or misleading or misrepresenting, I/We am/are aware that I/We may be held liable for it. I/We agree to be bound by the terms and conditions, instructions, etc. as outlined for FATCA / CRS, rules of Bank ofIndia and the RBI and subsequent amendment(s). My/Our personal/KYC details may be shared with Central KYC registry.',
            ),
            pw.SizedBox(height: 2),
            declarationPoint(
              '6.',
              'I/We hereby consent to receiving information from Central KYC registry through SMS / Email address.',
            ),
            pw.SizedBox(height: 3),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Place: ${data.declarationPlace}',
                      style: const pw.TextStyle(fontSize: 8),
                    ),
                    pw.SizedBox(height: 2),
                    pw.Text(
                      'Date: $formattedDate',
                      style: const pw.TextStyle(fontSize: 8),
                    ),
                  ],
                ),
                pw.SizedBox(width: 15),
                pw.Expanded(
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        child: signatureBox(
                          image: signature1Image,
                          text: data.signature1Text,
                          label:
                              '(Signature of the Applicant/Thumb impression of the Applicant)',
                          height: 35,
                        ),
                      ),
                      pw.SizedBox(width: 8),
                      pw.Expanded(
                        child: signatureBox(
                          image: signature2Image,
                          text: data.signature2Text,
                          label:
                              '(Signature of the Applicant/Thumb impression of the Applicant)',
                          height: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

// =========================================================================
// == FINAL SECTION: FOR OFFICE USE / ATTESTATION
// =========================================================================

pw.Widget buildOfficeUseSection() {
  final textStyle = pw.TextStyle(fontSize: 7);
  final smallTextStyle = pw.TextStyle(fontSize: 6);

  pw.Widget _buildRightTable() {
    final borderStyle = pw.BorderSide(width: 0.5, color: PdfColors.black);

    pw.Widget tableCell(
      String text, {
      pw.TextAlign? align,
      pw.FontWeight? weight,
    }) {
      return pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        alignment: align == pw.TextAlign.center
            ? pw.Alignment.center
            : pw.Alignment.centerLeft,
        child: pw.Text(
          text,
          style: textStyle.copyWith(fontWeight: weight),
          textAlign: align,
        ),
      );
    }

    pw.Widget smallBox(String label) {
      return pw.Container(
        height: 10,
        decoration: pw.BoxDecoration(
          border: pw.Border(
            left: borderStyle,
            right: borderStyle,
            bottom: borderStyle,
          ),
        ),
        child: pw.Center(child: pw.Text(label, style: smallTextStyle)),
      );
    }

    pw.Widget emptyBox() {
      return pw.Container(
        height: 10,
        margin: const pw.EdgeInsets.symmetric(horizontal: 1),
        decoration: pw.BoxDecoration(
          border: pw.Border.fromBorderSide(borderStyle),
        ),
      );
    }

    final tableData = [
      ['initials', 'Account'],
      ['lal/lab', 'CIF Linking'],
      ['initials', 'Personalised Cheque'],
      ['initials', 'RINB'],
      ['ade/lab', 'MBS'],
      ['initials', 'SMS Alert'],
      ['', 'Removal of Posting'],
      ['', 'Scanning'],
    ];

    return pw.Table(
      border: pw.TableBorder(
        top: borderStyle,
        left: borderStyle,
        right: borderStyle,
        bottom: borderStyle,
        verticalInside: borderStyle,
      ),
      columnWidths: {
        0: pw.FlexColumnWidth(1.5),
        1: pw.FlexColumnWidth(4),
        2: pw.FlexColumnWidth(2.5),
        3: pw.FlexColumnWidth(2.5),
      },
      children: [
        pw.TableRow(
          decoration: pw.BoxDecoration(border: pw.Border(bottom: borderStyle)),
          children: [
            pw.SizedBox(),
            pw.SizedBox(),
            tableCell(
              'Queue No',
              align: pw.TextAlign.center,
              weight: pw.FontWeight.bold,
            ),
            tableCell(
              'Initials',
              align: pw.TextAlign.center,
              weight: pw.FontWeight.bold,
            ),
          ],
        ),
        ...tableData.map((rowData) {
          return pw.TableRow(
            decoration: pw.BoxDecoration(
              border: pw.Border(bottom: borderStyle),
            ),
            children: [
              smallBox(rowData[0]),
              tableCell(rowData[1]),
              emptyBox(),
              emptyBox(),
            ],
          );
        }),
      ],
    );
  }

  pw.Widget _buildLeftColumn() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
          padding: const pw.EdgeInsets.all(2),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('(for office use only)', style: textStyle),
              pw.Text('Open Account', style: textStyle),
              pw.Row(
                children: [
                  pw.Text('Date:', style: textStyle),
                  pw.SizedBox(width: 4),
                  charBoxes('', 8),
                  pw.SizedBox(width: 10),
                  pw.Expanded(
                    child: pw.Column(
                      children: [pw.SizedBox(height: 8), dottedLine()],
                    ),
                  ),
                ],
              ),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text('(Authorised signatory)', style: textStyle),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 1),
        pw.Row(
          children: [
            pw.Text('i) Internet Banking (INB) Kit No.:', style: textStyle),
            pw.Expanded(child: dottedLine()),
          ],
        ),
        pw.SizedBox(height: 1),
        pw.Row(
          children: [
            pw.Text('ii) INB Viewing rights', style: textStyle),
            pw.SizedBox(width: 6),
            labeledCheckbox('Transaction rights', checked: false),
            pw.SizedBox(width: 6),
            pw.Text('given on:', style: textStyle),
            pw.SizedBox(width: 2),
            charBoxes('', 8),
          ],
        ),
        pw.SizedBox(height: 1),
        pw.Row(
          children: [
            pw.Text('iii) ATM Card data transmitted on:', style: textStyle),
            pw.SizedBox(width: 2),
            charBoxes('', 12),
          ],
        ),
        pw.SizedBox(height: 1),
        pw.Row(
          children: [
            pw.Text('iv) Nomination Serial No:', style: textStyle),
            pw.SizedBox(width: 2),
            charBoxes('', 10),
          ],
        ),
        pw.SizedBox(height: 1),
        pw.Row(
          children: [
            pw.Text('v) Threshold (KYC) limit:', style: textStyle),
            pw.SizedBox(width: 2),
            charBoxes('', 10),
          ],
        ),
        pw.SizedBox(height: 1),
        pw.Text('vi) Phone Banking', style: textStyle),
        pw.SizedBox(height: 2),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'Risk Category',
              style: textStyle.copyWith(fontWeight: pw.FontWeight.bold),
            ),
            labeledCheckbox('Low Risk Category', checked: false),
            labeledCheckbox('Medium Risk', checked: false),
            labeledCheckbox('High Risk', checked: false),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildBottomRow() {
    pw.Widget approvalBox(String text) {
      return pw.Container(
        height: 32,
        width: double.infinity,
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
        padding: const pw.EdgeInsets.all(3),
        child: pw.Center(
          child: pw.Text(
            text,
            style: textStyle,
            textAlign: pw.TextAlign.center,
          ),
        ),
      );
    }

    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          flex: 2,
          child: approvalBox(
            'KYC including Due Diligence carried out & Account opned by',
          ),
        ),
        pw.SizedBox(width: 3),
        pw.Expanded(flex: 1, child: approvalBox('Signature & PF of Staff')),
        pw.SizedBox(width: 3),
        pw.Expanded(flex: 1, child: approvalBox('Account Approved by')),
        pw.SizedBox(width: 3),
        pw.Expanded(flex: 1, child: approvalBox('Signature & PF of Staff')),
      ],
    );
  }

  return pw.Column(
    children: [
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
        child: pw.Text(
          'FOR OFFICE USE/ATTESTATION',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.5),
        ),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
        padding: const pw.EdgeInsets.all(2),
        child: pw.Column(
          children: [
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(flex: 6, child: _buildLeftColumn()),
                pw.SizedBox(width: 4),
                pw.Expanded(flex: 5, child: _buildRightTable()),
              ],
            ),
            pw.SizedBox(height: 2),
            _buildBottomRow(),
          ],
        ),
      ),
    ],
  );
}
