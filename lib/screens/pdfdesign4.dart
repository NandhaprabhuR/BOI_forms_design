// lib/screens/pdfdesign4.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
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
          bottom: pw.BorderSide(width: 0.5, style: pw.BorderStyle.dotted)),
    ),
  );
}

pw.Widget signatureBox({String text = '', String? label, double height = 28}) {
  return pw.Column(
    mainAxisSize: pw.MainAxisSize.min,
    children: [
      pw.Container(
        height: height,
        width: double.infinity,
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
        child: text.isNotEmpty
            ? pw.Center(
          child: pw.Text(
            text,
            style:  pw.TextStyle(fontStyle: pw.FontStyle.italic, fontSize: 8),
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

pw.Widget buildFourthPage() {
  // FIXED: Using a Transform to scale the entire content down slightly.
  // This is the most reliable way to prevent page overflow.
  return pw.Transform.scale(
    scale: 0.95,
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildNominationTitleBar(),
        _buildNominationForm(),
        pw.SizedBox(height: 3),
        buildDeclarationSection(),
        pw.SizedBox(height: 3),
        buildOfficeUseSection(),
        // FIXED: Page number has been removed as requested.
      ],
    ),
  );
}

// =========================================================================
// == SECTION 7: NOMINATION FORM (DA-1)
// =========================================================================

pw.Widget _buildNominationTitleBar() {
  return pw.Container(
    width: double.infinity,
    padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
    decoration: pw.BoxDecoration(
      color: PdfColors.grey200,
      border: pw.Border.all(width: 0.5),
    ),
    child: pw.Text('7 Nomination (If required fill Form DA-1)',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.5)),
  );
}

pw.Widget _buildNominationForm() {
  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border(
        left: const pw.BorderSide(width: 0.5),
        right: const pw.BorderSide(width: 0.5),
        bottom: const pw.BorderSide(width: 0.5),
      ),
    ),
    child: pw.Column(
      children: [
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.symmetric(vertical: 1.5),
          decoration: const pw.BoxDecoration(
            border: pw.Border(
                top: pw.BorderSide(width: 1.5),
                bottom: pw.BorderSide(width: 0.5)),
          ),
          child: pw.Center(
            child: pw.Text('FORM DA-1 (Nomination Form)',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold, fontSize: 8.5)),
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.fromLTRB(6, 2, 6, 3),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _buildNominationTopPart(),
              pw.SizedBox(height: 2),
              _buildNomineeDetailsPart(),
            ],
          ),
        ),
      ],
    ),
  );
}

pw.Widget _buildNominationTopPart() {
  return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Details of Nomination:',
                style:
                pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8)),
            pw.Row(children: [
              pw.Text('Registration No.',
                  style: const pw.TextStyle(fontSize: 8)),
              pw.SizedBox(width: 4),
              charBoxes('', 10)
            ])
          ],
        ),
        pw.SizedBox(height: 2),
        pw.Text(
            'Nomination under section 45ZA of the Banking Regulation Act, 1949 and Rules 1985 in respect of Bank Deposits.',
            style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(height: 2),
        pw.Wrap(
          crossAxisAlignment: pw.WrapCrossAlignment.end,
          spacing: 2,
          runSpacing: 2,
          children: [
            pw.RichText(
              text: pw.TextSpan(
                style: const pw.TextStyle(
                    fontSize: 8, color: PdfColors.black, height: 1.2),
                children: [
                  const pw.TextSpan(text: 'I/We '),
                  pw.TextSpan(
                    text: '      Arunkumar      ',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      decoration: pw.TextDecoration.underline,
                    ),
                  ),
                  const pw.TextSpan(
                      text:
                      ' nominate the following person to whom in the event of my/minor\'s death the amount of this deposit, particulars of which are given below, may be returned by the Bank of India, '),
                ],
              ),
            ),
            dottedLine(150),
            pw.Text(
              ' (name and address of the Branch / Office in which the deposit is held)',
              style: const pw.TextStyle(fontSize: 7),
            )
          ],
        ),
        pw.SizedBox(height: 2),
        labeledCheckbox(
            'I/We want the name of the nominee to be printed on the passbook',
            checked: true),
        pw.SizedBox(height: 2),
        pw.Text('Details of Deposit',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8)),
        pw.SizedBox(height: 2),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text('Type of Deposit:', style: const pw.TextStyle(fontSize: 8)),
            pw.SizedBox(width: 4),
            pw.Expanded(flex: 2, child: underline(0)),
            pw.SizedBox(width: 20),
            pw.Text('Account Number:', style: const pw.TextStyle(fontSize: 8)),
            pw.SizedBox(width: 4),
            pw.Expanded(flex: 3, child: charBoxes('', 15)),
          ],
        ),
      ]);
}

pw.Widget _buildNomineeDetailsPart() {
  pw.Widget witnessBox() {
    return pw.Container(
        padding: const pw.EdgeInsets.all(2),
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(children: [
              pw.Text('Name:', style: const pw.TextStyle(fontSize: 7)),
              pw.SizedBox(width: 4),
              pw.Expanded(child: dottedLine())
            ]),
            pw.SizedBox(height: 3),
            pw.Row(children: [
              pw.Text('Signature:', style: const pw.TextStyle(fontSize: 7)),
              pw.SizedBox(width: 4),
              pw.Expanded(child: dottedLine())
            ]),
            pw.SizedBox(height: 3),
            pw.Row(children: [
              pw.Text('Address:', style: const pw.TextStyle(fontSize: 7)),
              pw.SizedBox(width: 4),
              pw.Expanded(child: dottedLine())
            ]),
          ],
        ));
  }

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text('Details of Nominee',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8)),
      pw.SizedBox(height: 2),
      pw.Row(children: [
        pw.Text('Name:', style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(width: 4),
        pw.Expanded(child: charBoxes('KANAGARAJ', 26)),
      ]),
      pw.SizedBox(height: 2),
      pw.Row(children: [
        pw.Text('Mobile Number of the Nominee',
            style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(width: 8),
        charBoxes('9999999999', 10),
      ]),
      pw.SizedBox(height: 2),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Text('Relationship with the depositor ',
              style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(
              width: 90,
              child: pw.Column(children: [
                pw.Padding(
                    padding: const pw.EdgeInsets.only(bottom: 1),
                    child: pw.Text('FATHER',
                        style: const pw.TextStyle(fontSize: 8))),
                dottedLine(),
              ])),
          pw.SizedBox(width: 8),
          pw.Text('Age', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 25, child: dottedLine()),
          pw.Text('Years', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 8),
          pw.Text('Date of Birth of nominee(in case of minor) ',
              style: const pw.TextStyle(fontSize: 8)),
          charBoxes('01052000', 8),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Text('As the nominee is a minor on this date, I appoint Shri/Smt/Kum ',
              style: const pw.TextStyle(fontSize: 8)),
          pw.Expanded(child: dottedLine()),
          pw.SizedBox(width: 20),
          pw.Text('Age ', style: const pw.TextStyle(fontSize: 8)),
          dottedLine(30),
          pw.Text(' Years', style: const pw.TextStyle(fontSize: 8)),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Address ', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 200, child: dottedLine()),
          pw.SizedBox(width: 4),
          pw.Expanded(
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                      'to receive the amount of deposit on behalf of the nominee in the event of my/minor’s',
                      style: const pw.TextStyle(fontSize: 8)),
                  pw.Text('death during the minority of the nominee',
                      style: const pw.TextStyle(fontSize: 8)),
                ]),
          ),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Row(children: [
        pw.Expanded(
            child: signatureBox(
                text: 'Arun Kumar',
                label:
                '(Signature of the Applicants/Thumb impression of the Applicants)')),
        pw.SizedBox(width: 8),
        pw.Expanded(
            child: signatureBox(
                label:
                '(Signature of the Applicants/Thumb impression of the Applicants)')),
      ]),
      pw.SizedBox(height: 2),
      pw.Row(children: [
        pw.Expanded(child: witnessBox()),
        pw.SizedBox(width: 8),
        pw.Expanded(child: witnessBox()),
      ]),
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
                charBoxes('', 8),
                pw.SizedBox(width: 8),
                pw.Text('Place', style: const pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 4),
                pw.Expanded(child: dottedLine()),
              ],
            ),
          ),
        ],
      ),
      pw.SizedBox(height: 2),
      labeledCheckbox('I/We do not want to nominate any person in this account'),
      pw.SizedBox(height: 2),
      pw.Row(children: [
        pw.Expanded(
            child: signatureBox(
                label:
                '(Signature of the Applicants/Thumb impression of the Applicants)',
                height: 20)),
        pw.SizedBox(width: 8),
        pw.Expanded(
            child: signatureBox(
                label:
                '(Signature of the Applicants/Thumb impression of the Applicants)',
                height: 20)),
      ]),
    ],
  );
}

// =========================================================================
// == SECTION 8: DECLARATION
// =========================================================================

pw.Widget buildDeclarationSection() {
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
                  style: textStyle),
              dottedLine(100),
              pw.Text(' and I am his/her natural and lawful guardian/guardian appointed by court order dated ', style: textStyle),
              dottedLine(80),
              pw.Text(
                  ' (copy enclosed) I shall represent the said minor in all future transactions of any description in the above account until the said minor attains majority. I indemnify the bank against the claim of the above minor for any withdrawal/transactions made by me in his/her account.',
                  textAlign: pw.TextAlign.justify,
                  style: textStyle),
            ],
          ),
        ),
      ],
    );
  }

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
              'I/We hereby declare that the details above in this form including details in Annexure I and Annexure II are true and correct to the best of my/our knowledge and belief. I further, declare to inform you of any changes therein, immediately. In case of any of the above information is found to be false or untrue or misleading or misrepresenting, I/We am/are aware that I/We may be held liable for it. I/We agree to be bound by the terms and conditions, instructions, etc. as outlined for FATCA / CRS, rules of Bank of India and the RBI and subsequent amendment(s). My/Our personal/KYC details may be shared with Central KYC registry.',
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
                    pw.Text('Place: GANAPATHYPALAYAM',
                        style: const pw.TextStyle(fontSize: 8)),
                    pw.SizedBox(height: 2),
                    pw.Text('Date: 04.02.2001',
                        style: const pw.TextStyle(fontSize: 8)),
                  ],
                ),
                pw.SizedBox(width: 15),
                pw.Expanded(
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        child: signatureBox(
                            text: 'Arun Kumar',
                            label:
                            '(Signature of the Applicant/Thumb impression of the Applicant)',
                            height: 35),
                      ),
                      pw.SizedBox(width: 8),
                      pw.Expanded(
                        child: signatureBox(
                            label:
                            '(Signature of the Applicant/Thumb impression of the Applicant)',
                            height: 35),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

// =========================================================================
// == FINAL SECTION: FOR OFFICE USE / ATTESTATION
// =========================================================================

pw.Widget buildOfficeUseSection() {
  final textStyle = pw.TextStyle(fontSize: 7);
  final smallTextStyle = pw.TextStyle(fontSize: 6);

  /// FIXED: This table is now built with a pw.Table for perfect alignment.
  pw.Widget _buildRightTable() {
    final borderStyle = pw.BorderSide(width: 0.5, color: PdfColors.black);

    pw.Widget tableCell(String text, {pw.TextAlign? align, pw.FontWeight? weight}) {
      return pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        alignment: align == pw.TextAlign.center ? pw.Alignment.center : pw.Alignment.centerLeft,
        child: pw.Text(text, style: textStyle.copyWith(fontWeight: weight), textAlign: align),
      );
    }

    pw.Widget smallBox(String label) {
      return pw.Container(
        height: 10,
        decoration: pw.BoxDecoration(border: pw.Border(
          left: borderStyle,
          right: borderStyle,
          bottom: borderStyle,
        )),
        child: pw.Center(child: pw.Text(label, style: smallTextStyle)),
      );
    }

    pw.Widget emptyBox() {
      return pw.Container(
        height: 10,
        margin: const pw.EdgeInsets.symmetric(horizontal: 1),
        decoration:  pw.BoxDecoration(border: pw.Border.fromBorderSide(borderStyle)),
      );
    }

    // FIXED: Changed from a Map to a List to guarantee row order.
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
              tableCell('Queue No', align: pw.TextAlign.center, weight: pw.FontWeight.bold),
              tableCell('Initials', align: pw.TextAlign.center, weight: pw.FontWeight.bold),
            ]
        ),
        ...tableData.map((rowData) {
          return pw.TableRow(
              decoration: pw.BoxDecoration(border: pw.Border(bottom: borderStyle)),
              children: [
                smallBox(rowData[0]),
                tableCell(rowData[1]),
                emptyBox(),
                emptyBox(),
              ]
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
                      child: pw.Column(children: [pw.SizedBox(height: 8), dottedLine()])),
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
        pw.Row(children: [
          pw.Text('i) Internet Banking (INB) Kit No.:', style: textStyle),
          pw.Expanded(child: dottedLine())
        ]),
        pw.SizedBox(height: 1),
        pw.Row(children: [
          pw.Text('ii) INB Viewing rights', style: textStyle),
          pw.SizedBox(width: 6),
          labeledCheckbox('Transaction rights', checked: false),
          pw.SizedBox(width: 6),
          pw.Text('given on:', style: textStyle),
          pw.SizedBox(width: 2),
          charBoxes('', 8)
        ]),
        pw.SizedBox(height: 1),
        pw.Row(children: [
          pw.Text('iii) ATM Card data transmitted on:', style: textStyle),
          pw.SizedBox(width: 2),
          charBoxes('', 12)
        ]),
        pw.SizedBox(height: 1),
        pw.Row(children: [
          pw.Text('iv) Nomination Serial No:', style: textStyle),
          pw.SizedBox(width: 2),
          charBoxes('', 10)
        ]),
        pw.SizedBox(height: 1),
        pw.Row(children: [
          pw.Text('v) Threshold (KYC) limit:', style: textStyle),
          pw.SizedBox(width: 2),
          charBoxes('', 10)
        ]),
        pw.SizedBox(height: 1),
        pw.Text('vi) Phone Banking', style: textStyle),
        pw.SizedBox(height: 2),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Risk Category',
                style: textStyle.copyWith(fontWeight: pw.FontWeight.bold)),
            labeledCheckbox('Low Risk Category', checked: false),
            labeledCheckbox('Medium Risk', checked: false),
            labeledCheckbox('High Risk', checked: false),
          ],
        )
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

    return pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.Expanded(
          flex: 2,
          child: approvalBox(
              'KYC including Due Diligence carried out & Account opned by')),
      pw.SizedBox(width: 3),
      pw.Expanded(
          flex: 1,
          child: approvalBox('Signature & PF of Staff')),
      pw.SizedBox(width: 3),
      pw.Expanded(
          flex: 1,
          child: approvalBox('Account Approved by')),
      pw.SizedBox(width: 3),
      pw.Expanded(
          flex: 1,
          child: approvalBox('Signature & PF of Staff')),
    ]);
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
          ))
    ],
  );
}

