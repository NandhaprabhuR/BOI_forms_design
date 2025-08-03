// lib/screens/pdf_page_three.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'pdf_helpers.dart';

// This function will build the entire third page
pw.Widget buildThirdPage() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      _buildPageThreeHeader(),
      pw.SizedBox(height: 3), // Reduced space
      _buildAccountTypeSection(),
      pw.SizedBox(height: 3), // Reduced space
      _buildModeOfOperationSection(),
      pw.SizedBox(height: 3), // Reduced space
      _buildServicesRequiredSection(),
      pw.SizedBox(height: 3), // Reduced space
      _buildFixedDepositSection(),
      pw.SizedBox(height: 3), // Reduced space
      _buildMultiOptionDepositSection(),
      pw.SizedBox(height: 3), // Reduced space
      _buildRecurringDepositSection(),
    ],
  );
}

// Builds the header section for the third page
pw.Widget _buildPageThreeHeader() {
  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.black, width: 0.5),
    ),
    padding: const pw.EdgeInsets.all(8),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // --- Top Row: Title and Date ---
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 4), // Vertical alignment adjustment
                  pw.Text(
                    'ACCOUNT OPENING FORM FOR INDIVIDUAL (PART -II)',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 10),
                  ),
                  pw.Text(
                    '(SAVING BANK, CURRENT ACCOUNT AND TERM DEPOSITS)',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 9),
                  ),
                ],
              ),
            ),
            pw.SizedBox(width: 10), // Spacer
            pw.Row(
              mainAxisSize: pw.MainAxisSize.min,
              children: [
                pw.Text('Date:', style: const pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 4),
                charBoxes('', 8), // 8 boxes for date
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 10),

        // --- Middle Row: Instructions, IDs, and Stamp Box ---
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.end, // Align items to the bottom
          children: [
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Fields marked asterisk (*) are mandatory. Please fill up in BLOCK letters only and use black ink for signature',
                    style: const pw.TextStyle(fontSize: 7),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    '(For office use only)',
                    style: const pw.TextStyle(fontSize: 8),
                  ),
                  pw.SizedBox(height: 8),
                  // ID and Account Fields
                  pw.Row(children: [
                    pw.SizedBox(
                        width: 120,
                        child: pw.Text('First Applicant Customer ID',
                            style: const pw.TextStyle(fontSize: 8))),
                    charBoxes('', 18), // 18 boxes for ID
                  ]),
                  pw.SizedBox(height: 4),
                  pw.Row(children: [
                    pw.SizedBox(
                        width: 120,
                        child: pw.Text('Second Applicant Customer ID',
                            style: const pw.TextStyle(fontSize: 8))),
                    charBoxes('', 18), // 18 boxes for ID
                  ]),
                  pw.SizedBox(height: 4),
                  pw.Row(children: [
                    pw.SizedBox(
                        width: 120,
                        child: pw.Text('Account No.',
                            style: const pw.TextStyle(fontSize: 8))),
                    charBoxes('', 12), // 12 boxes for Account No.
                  ]),
                ],
              ),
            ),
            pw.SizedBox(width: 10), // Spacer between left column and stamp
            // Stamp Box
            pw.Container(
              width: 130,
              height: 60,
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
        pw.SizedBox(height: 8),
        pw.Divider(color: PdfColors.black, height: 1),
        pw.SizedBox(height: 4),

        // --- Bottom Row: Request Text ---
        pw.Text(
          'I/We request you to open my/our deposit account with your branch/bank as under: (Tick (✓) relevant type of account)',
          style: const pw.TextStyle(fontSize: 8),
        ),
      ],
    ),
  );
}

// BUILDS THE ACCOUNT TYPE SECTION
pw.Widget _buildAccountTypeSection() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: pw.Text('1. Type of Account',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.5)),
      ),
      pw.SizedBox(height: 4),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          labeledCheckbox('SAVINGS BANK ACCOUNT', checked: true),
          labeledCheckbox('BSBDA'),
          labeledCheckbox('SMALL ACCOUNT'),
          labeledCheckbox('CURRENT ACCOUNT'),
          labeledCheckbox('FIXED DEPOSIT/RD'),
          labeledCheckbox('CAPS GAIN(SB)'),
        ],
      ),
    ],
  );
}

// BUILDS THE MODE OF OPERATION SECTION
pw.Widget _buildModeOfOperationSection() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: pw.Text('2. Mode of Operation',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.5)),
      ),
      pw.SizedBox(height: 4),
      pw.Row(
        children: [
          labeledCheckbox('Self'),
          pw.SizedBox(width: 15),
          labeledCheckbox('Either or Survivor'),
          pw.SizedBox(width: 15),
          labeledCheckbox('Former or Survivor'),
          pw.SizedBox(width: 15),
          labeledCheckbox('Any one or Survivor'),
          pw.SizedBox(width: 15),
          labeledCheckbox('Jointly Operated'),
          pw.SizedBox(width: 15),
          labeledCheckbox('Other'),
          pw.SizedBox(width: 4),
          pw.Container(
            width: 70,
            height: 10,
            decoration: const pw.BoxDecoration(
              border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black)),
            ),
          ),
        ],
      ),
    ],
  );
}

// =========================================================================
// == SERVICES REQUIRED SECTION AND ITS HELPERS
// =========================================================================

// Main builder for the entire section 3
pw.Widget _buildServicesRequiredSection() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // Section Title
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: pw.Text('3. Services Required',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.5)),
      ),
      pw.SizedBox(height: 4),
      // Two-column layout
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            flex: 5,
            child: _buildLeftServicesColumn(),
          ),
          pw.SizedBox(width: 15),
          pw.Expanded(
            flex: 6,
            child: _buildRightServicesColumn(),
          ),
        ],
      )
    ],
  );
}

// Builds the left column of the services section
pw.Widget _buildLeftServicesColumn() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // --- ATM CARD ---
      pw.Text('1. ATM-CUM-DEBIT CARD', style: const pw.TextStyle(fontSize: 8)),
      pw.SizedBox(height: 2),
      _buildBoxedApplicantRow('1st Applicant', isYesChecked: true),
      pw.SizedBox(height: 2),
      _buildBoxedApplicantRow('2nd Applicant'),
      pw.SizedBox(height: 2),
      pw.Text('(Mobile no. is mandatory for services 2 to 8)',
          style: const pw.TextStyle(fontSize: 7)),
      pw.SizedBox(height: 8),

      // --- CHEQUE BOOK ---
      pw.Row(children: [
        pw.Text('2. CHEQUE BOOK', style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(width: 8),
        labeledCheckbox('YES', checked: true),
        pw.SizedBox(width: 8),
        labeledCheckbox('NO'),
      ]),
      pw.SizedBox(height: 2),
      pw.Text(
          '(Only for Regular SB/Current Accounts/Caps Gain(SB))\n(Not available for Regular BSBD/Small Accounts)',
          style: const pw.TextStyle(fontSize: 7)),
      pw.SizedBox(height: 8),

      // --- INTERNET BANKING ---
      pw.Text('3. INTERNET BANKING REQUIRED:',
          style: const pw.TextStyle(fontSize: 8)),
      pw.Text('Transaction rights required',
          style: const pw.TextStyle(fontSize: 8)),
      pw.SizedBox(height: 2),
      _buildUnboxedApplicantRow('1st Applicant'),
      pw.SizedBox(height: 2),
      _buildUnboxedApplicantRow('2nd Applicant'),
      pw.SizedBox(height: 2),
      pw.Text(
          '(Available only for singly operated accounts and joint accounts operated by Either or Survivor mode. In case of accounts operated as Former or Survivor mode INB facility is available to1st applicant only)',
          style: const pw.TextStyle(fontSize: 6.5, height: 1.2)),
    ],
  );
}

// Builds the right column of the services section
pw.Widget _buildRightServicesColumn() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // --- NAME ON CARD ---
      pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColors.black, width: 0.5),
        ),
        padding: const pw.EdgeInsets.all(4),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Name on Card:', style: const pw.TextStyle(fontSize: 8)),
            pw.SizedBox(height: 3),
            charBoxes('ARUNKUMAR', 22),
            pw.SizedBox(height: 3),
            charBoxes('', 22),
          ],
        ),
      ),
      pw.SizedBox(height: 4),

      // --- OTHER SERVICES ---
      _buildSimpleServiceRow('4. SMS ALERTS(Charges Applicable)'),
      pw.Padding(
        padding: const pw.EdgeInsets.only(left: 8),
        child: pw.Text('SMS Alerts on Registered Mobile Number',
            style: const pw.TextStyle(fontSize: 7)),
      ),
      pw.SizedBox(height: 6),
      _buildSimpleServiceRow('5. PHONE BANKING SERVICES:'),
      pw.SizedBox(height: 6),
      _buildSimpleServiceRow('6. MOBILE BANKING:'),
      pw.SizedBox(height: 6),
      _buildSimpleServiceRow('7. PASSBOOK REQUIRED:'),
      pw.Padding(
        padding: const pw.EdgeInsets.only(left: 8),
        child: pw.Text('(For Savings Bank Account)',
            style: const pw.TextStyle(fontSize: 7)),
      ),
      pw.SizedBox(height: 6),
      _buildSimpleServiceRow(
          '8. e-Statement(at monthly intervals), in lieu of paper copy:',
          options: ['Required', 'Not Required']),
    ],
  );
}

// Helper for applicant rows with a BOXED label
pw.Widget _buildBoxedApplicantRow(String label, {bool isYesChecked = false}) {
  return pw.Row(children: [
    pw.Container(
      width: 60,
      padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
      child:
      pw.Center(child: pw.Text(label, style: const pw.TextStyle(fontSize: 8))),
    ),
    pw.SizedBox(width: 8),
    labeledCheckbox('Yes', checked: isYesChecked),
    pw.SizedBox(width: 8),
    labeledCheckbox('No'),
  ]);
}

// Helper for applicant rows with an UNBOXED label
pw.Widget _buildUnboxedApplicantRow(String label) {
  return pw.Row(children: [
    pw.SizedBox(
      width: 60,
      child: pw.Text(label, style: const pw.TextStyle(fontSize: 8)),
    ),
    pw.SizedBox(width: 8),
    labeledCheckbox('YES'),
    pw.SizedBox(width: 8),
    labeledCheckbox('NO'),
  ]);
}

// Helper for simple "Title: [ ] YES [ ] NO" rows
pw.Widget _buildSimpleServiceRow(String title, {List<String>? options}) {
  options ??= ['YES', 'NO'];
  return pw.Row(
    children: [
      pw.Expanded(child: pw.Text(title, style: const pw.TextStyle(fontSize: 8))),
      labeledCheckbox(options[0]),
      pw.SizedBox(width: 4),
      labeledCheckbox(options[1]),
    ],
  );
}

// =========================================================================
// == END SERVICES SECTION
// =========================================================================

// =========================================================================
// == FIXED DEPOSIT SECTION
// =========================================================================
pw.Widget _buildFixedDepositSection() {
  pw.Widget underlinedText(double width) {
    return pw.Container(
      width: width,
      height: 10,
      decoration: const pw.BoxDecoration(
        border: pw.Border(bottom: pw.BorderSide(width: 0.5)),
      ),
    );
  }

  // REVISED STAMP BOX
  final stampBox = pw.Container(
    width: 150,
    height: 40,
    decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
    child: pw.Row(children: [
      pw.Expanded(
        flex: 3,
        child: pw.Padding(
          padding: const pw.EdgeInsets.all(2),
          child: pw.Text(
            'Name of Depositor(s) Amount and Period of Deposit authenticated by Cash Officer in case of illiterate Depositor',
            style: const pw.TextStyle(fontSize: 5, color: PdfColors.grey700),
            textAlign: pw.TextAlign.center,
          ),
        ),
      ),
      pw.VerticalDivider(width: 0.5, color: PdfColors.black),
      pw.Expanded(
        flex: 2,
        child: pw.Center(
          child: pw.Text(
            'Initials of Cash Officer',
            textAlign: pw.TextAlign.center,
            style: const pw.TextStyle(fontSize: 5, color: PdfColors.grey700),
          ),
        ),
      ),
    ]),
  );

  final maturityInstructionWidget = pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text('Maturity instruction#', style: const pw.TextStyle(fontSize: 8)),
      pw.SizedBox(height: 2),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                labeledCheckbox('Auto renew principal & payback interest'),
                pw.SizedBox(height: 2),
                labeledCheckbox('Pay principal & interest'),
              ],
            ),
          ),
          pw.SizedBox(width: 10),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                labeledCheckbox('Auto renew principal & interest'),
                pw.SizedBox(height: 2),
                pw.Row(children: [
                  labeledCheckbox('Auto Renew with part amount for Rs.'),
                  pw.SizedBox(width: 4),
                  pw.Expanded(child: underlinedText(0)),
                ]),
              ],
            ),
          ),
        ],
      ),
    ],
  );

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: pw.Text(
            '4. Fixed Deposit: For the following products/facilities, please furnish options/details:',
            style:
            pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.5)),
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          labeledCheckbox('Recurring Deposit'),
          labeledCheckbox('Double Benefit Deposit'),
          labeledCheckbox('MIC/QIC'),
          labeledCheckbox('Short / Fixed Deposit'),
          labeledCheckbox('Tax Saving Scheme'),
          labeledCheckbox('Capital Gain (TDR)'),
        ],
      ),
      pw.SizedBox(height: 4),
      pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Expanded(
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(children: [
                  pw.Text('Amount: Rs. ', style: const pw.TextStyle(fontSize: 8)),
                  underlinedText(60),
                  pw.SizedBox(width: 8),
                  pw.Text('Rs. (in words) ',
                      style: const pw.TextStyle(fontSize: 8)),
                  pw.Expanded(child: underlinedText(0)),
                ]),
                pw.SizedBox(height: 4),
                pw.Row(children: [
                  pw.Text('Period: ', style: const pw.TextStyle(fontSize: 8)),
                  underlinedText(30),
                  pw.Text(' year(s) ', style: const pw.TextStyle(fontSize: 8)),
                  underlinedText(30),
                  pw.Text(' month(s) ', style: const pw.TextStyle(fontSize: 8)),
                  underlinedText(30),
                  pw.Text(' days', style: const pw.TextStyle(fontSize: 8)),
                ]),
              ]),
        ),
        pw.SizedBox(width: 8),
        stampBox,
      ]),
      pw.SizedBox(height: 4),
      pw.Text('In case of Term Deposit, interest payable#:',
          style: const pw.TextStyle(fontSize: 8)),
      pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            labeledCheckbox('Monthly'),
            labeledCheckbox('Quarterly'),
            labeledCheckbox('Calender Quarter'),
            labeledCheckbox('Half Yearly'),
            labeledCheckbox('Yearly'),
          ]),
      pw.SizedBox(height: 4),
      maturityInstructionWidget,
      pw.SizedBox(height: 2),
      pw.Text(
          '*(Auto Renewal will be done for the similar term at the prevailing interest rate on the date of renewal.)',
          style: const pw.TextStyle(fontSize: 6.5)),
      pw.SizedBox(height: 1),
      pw.Text(
          '@# (All Interest payable and Maturity instructions options will not be offered bt all Banks. Contact respective Banks for the options available) Proceeds/Residual amount):',
          style: const pw.TextStyle(fontSize: 6.5)),
      pw.SizedBox(height: 4),
      pw.Text('Payment instruction (Maturity Proceeds/Residual amount):',
          style: const pw.TextStyle(fontSize: 8)),
      pw.Row(children: [
        labeledCheckbox('By credit to my Bank Account No.'),
        pw.SizedBox(width: 8),
        charBoxes('', 15),
      ]),
    ],
  );
}

// =========================================================================
// == END FIXED DEPOSIT SECTION
// =========================================================================

// =========================================================================
// == MULTI-OPTION DEPOSIT SECTION
// =========================================================================
pw.Widget _buildMultiOptionDepositSection() {
  pw.Widget dottedText(double width) {
    return pw.Container(
      width: width,
      height: 10,
      decoration: const pw.BoxDecoration(
        border: pw.Border(
            bottom: pw.BorderSide(width: 0.5, style: pw.BorderStyle.dotted)),
      ),
    );
  }

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // Title
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: pw.Text('5. MULTI-OPTION DEPOSIT SCHEME/AUTO SWEEP',
            style:
            pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.5)),
      ),
      pw.SizedBox(height: 4),

      // Type and Period Row
      pw.Row(children: [
        pw.Text('Type of Deposit', style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(width: 8),
        labeledCheckbox('Term Deposit'),
        pw.SizedBox(width: 8),
        labeledCheckbox('Term Deposit (Reinvestment)'),
        pw.SizedBox(width: 20),
        pw.Text('Period of Deposit', style: const pw.TextStyle(fontSize: 8)),
        dottedText(50),
        pw.Text(' Years(s)', style: const pw.TextStyle(fontSize: 8)),
        dottedText(50),
        pw.Text(' Months', style: const pw.TextStyle(fontSize: 8)),
      ]),
      pw.SizedBox(height: 4),

      // Consent Rows
      pw.Text(
        'I/We hereby give consent for debiting my/our account for recovering service charges as normally applicable to Savings Bank and Current Account.',
        style: const pw.TextStyle(fontSize: 8),
      ),
      pw.SizedBox(height: 2),
      pw.Text(
        'I/We hereby give consent for debiting my/our Savings Bank/Current Account for creating/AUTO SWEEP as per the Terms and Conditions.',
        style: const pw.TextStyle(fontSize: 8),
      ),
      pw.SizedBox(height: 4),

      // Linked Account Row
      pw.Row(children: [
        pw.Text('Linked Saving Bank/Current Account No.',
            style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(width: 8),
        charBoxes('', 15),
      ]),
      pw.SizedBox(height: 4),

      // Reverse Sweep Row
      pw.Row(children: [
        pw.Text('Under reverse sweep facility for breaking the MOD to be broken by',
            style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(width: 8),
        labeledCheckbox('Last in first out', checked: true),
      ]),
    ],
  );
}

// =========================================================================
// == NEW RECURRING DEPOSIT SECTION (UPDATED)
// =========================================================================
pw.Widget _buildRecurringDepositSection() {
  pw.Widget dottedText(double width) {
    return pw.Container(
      width: width,
      height: 10,
      decoration: const pw.BoxDecoration(
        border: pw.Border(
            bottom: pw.BorderSide(width: 0.5, style: pw.BorderStyle.dotted)),
      ),
    );
  }

  return pw.Container(
    decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
    child: pw.Column(
      children: [
        pw.Container(
          width: double.infinity,
          color: PdfColors.grey200,
          padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: pw.Text('6   RECURRING DEPOSIT',
              style:
              pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.5)),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.fromLTRB(4, 3, 4, 3),
          child: pw.Column(
            children: [
              // Installment Row
              pw.Row(children: [
                labeledCheckbox('Monthly / Core Monthly installment:'),
                pw.SizedBox(width: 4),
                pw.Text('Rs.', style: const pw.TextStyle(fontSize: 8)),
                dottedText(40),
                pw.SizedBox(width: 4),
                pw.Text('Rs. (In words)',
                    style: const pw.TextStyle(fontSize: 8)),
                dottedText(60),
                pw.SizedBox(width: 4),
                pw.Text('Period:', style: const pw.TextStyle(fontSize: 8)),
                dottedText(20),
                pw.Text(' Years:', style: const pw.TextStyle(fontSize: 8)),
                dottedText(20),
                pw.Text(' Month(s)', style: const pw.TextStyle(fontSize: 8)),
                dottedText(20),
              ]),
              pw.SizedBox(height: 3),

              // Standing Instruction Row
              pw.Row(children: [
                pw.SizedBox(
                    width: 180,
                    child: labeledCheckbox('Standing instruction (if any)')),
                pw.Text('Debit Account No.',
                    style: const pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 8),
                pw.Expanded(child: charBoxes('', 18)),
              ]),
              pw.SizedBox(height: 3),

              // On Maturity Row
              pw.Row(children: [
                pw.SizedBox(
                    width: 180,
                    child: labeledCheckbox('On Maturity, credit proceeds to Account No.')),
                pw.SizedBox(width: 70), // Manual alignment
                pw.Expanded(child: charBoxes('', 14)),
              ]),
              pw.SizedBox(height: 6),

              // TDS Row
              pw.Row(children: [
                pw.Text(
                    'For the above Term Deposit Account, please deduct applicable TDS from',
                    style: const pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 4),
                pw.Text('(SB/CA Account No.)',
                    style: const pw.TextStyle(fontSize: 8)),
                pw.SizedBox(width: 4),
                pw.Expanded(child: charBoxes('', 18)),
              ]),
            ],
          ),
        ),
      ],
    ),
  );
}