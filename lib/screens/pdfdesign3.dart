// lib/screens/pdfdesign3.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart';
import 'pdf_helpers.dart';

// This function will build the entire third page
pw.Widget buildThirdPage(FormDataModel data, pw.MemoryImage? signature1, pw.MemoryImage? signature2) {
  return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildPageThreeHeader(data),
        pw.SizedBox(height: 2),
        _buildAccountTypeSection(data),
        pw.SizedBox(height: 2),
        _buildModeOfOperationSection(data),
        pw.SizedBox(height: 2),
        _buildServicesRequiredSection(data),
        pw.SizedBox(height: 2),
        _buildFixedDepositSection(data),
        pw.SizedBox(height: 2),
        _buildMultiOptionDepositSection(data),
        pw.SizedBox(height: 2),
        _buildRecurringDepositSection(data),
        pw.SizedBox(height: 2),
        _buildPage3Signatures(data, signature1, signature2),
      ],
  );
}

pw.Widget _buildPage3Signatures(FormDataModel data, pw.MemoryImage? signature1, pw.MemoryImage? signature2) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
    children: [
       pw.Column(
         children: [
           pw.Container(
             height: 25,
             width: 120,
             decoration: pw.BoxDecoration(border: pw.Border.all()),
             child: signature1 != null ? pw.Image(signature1, fit: pw.BoxFit.contain) : null,
           ),
           pw.Text("Signature of 1st Applicant", style: const pw.TextStyle(fontSize: 7)),
         ],
       ),
       pw.Column(
         children: [
           pw.Container(
             height: 25,
             width: 120,
             decoration: pw.BoxDecoration(border: pw.Border.all()),
             child: signature2 != null ? pw.Image(signature2, fit: pw.BoxFit.contain) : null,
           ),
           pw.Text("Signature of 2nd Applicant", style: const pw.TextStyle(fontSize: 7)),
         ],
       ),
    ],
  );
}

// Builds the header section for the third page
pw.Widget _buildPageThreeHeader(FormDataModel data) {
  // Get date components for display
  final date = data.date;
  final dateBoxes = date.isNotEmpty ? charBoxes(date, 8) : charBoxes('', 8);

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
                  pw.SizedBox(height: 2),
                  pw.Text(
                    'ACCOUNT OPENING FORM FOR INDIVIDUAL (PART -II)',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                  pw.Text(
                    '(SAVING BANK, CURRENT ACCOUNT AND TERM DEPOSITS)',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(width: 10),
            pw.Row(
              mainAxisSize: pw.MainAxisSize.min,
              children: [
                pw.Text('Date:', style: const pw.TextStyle(fontSize: 7)),
                pw.SizedBox(width: 4),
                dateBoxes,
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 5),

        // --- Middle Row: Instructions, IDs, and Stamp Box ---
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
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
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 120,
                        child: pw.Text(
                          'First Applicant Customer ID',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                      ),
                      charBoxes(data.firstApplicantCustomerId, 18),
                    ],
                  ),
                  pw.SizedBox(height: 4),
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 120,
                        child: pw.Text(
                          'Second Applicant Customer ID',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                      ),
                      charBoxes(data.secondApplicantCustomerId, 18),
                    ],
                  ),
                  pw.SizedBox(height: 4),
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 120,
                        child: pw.Text(
                          'Account No.',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                      ),
                      charBoxes(data.accountNo, 12),
                    ],
                  ),
                ],
              ),
            ),
            pw.SizedBox(width: 10),
            // Stamp Box
            pw.Container(
              width: 130,
              height: 60,
              decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
              child: pw.Center(
                child: pw.Text(
                  'Bank/Branch to affix rubber stamp of name and code no.',
                  style: const pw.TextStyle(
                    fontSize: 6,
                    color: PdfColors.grey700,
                  ),
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
pw.Widget _buildAccountTypeSection(FormDataModel data) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: pw.Text(
          '1. Type of Account',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
        ),
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          labeledCheckbox(
            'SAVINGS BANK ACCOUNT',
            checked: data.accountTypeSavingsBank,
          ),
          labeledCheckbox('BSBDA', checked: data.accountTypeBSBDA),
          labeledCheckbox(
            'SMALL ACCOUNT',
            checked: data.accountTypeSmallAccount,
          ),
          labeledCheckbox('CURRENT ACCOUNT', checked: data.accountTypeCurrent),
          labeledCheckbox(
            'FIXED DEPOSIT/RD',
            checked: data.accountTypeFixedDeposit,
          ),
          labeledCheckbox('CAPS GAIN(SB)', checked: data.accountTypeCapsGain),
        ],
      ),
    ],
  );
}

// BUILDS THE MODE OF OPERATION SECTION
pw.Widget _buildModeOfOperationSection(FormDataModel data) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: pw.Text(
          '2. Mode of Operation',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
        ),
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        children: [
          labeledCheckbox('Self', checked: data.modeOfOperationSelf),
          pw.SizedBox(width: 15),
          labeledCheckbox(
            'Either or Survivor',
            checked: data.modeOfOperationEitherOrSurvivor,
          ),
          pw.SizedBox(width: 15),
          labeledCheckbox(
            'Former or Survivor',
            checked: data.modeOfOperationFormerOrSurvivor,
          ),
          pw.SizedBox(width: 15),
          labeledCheckbox(
            'Any one or Survivor',
            checked: data.modeOfOperationAnyoneOrSurvivor,
          ),
          pw.SizedBox(width: 15),
          labeledCheckbox(
            'Jointly Operated',
            checked: data.modeOfOperationJointly,
          ),
          pw.SizedBox(width: 15),
          labeledCheckbox('Other', checked: data.modeOfOperationOtherCheckbox),
          pw.SizedBox(width: 4),
          pw.Container(
            width: 70,
            height: 10,
            decoration: const pw.BoxDecoration(
              border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black)),
            ),
            child: pw.Text(
              data.modeOfOperationOther,
              style: const pw.TextStyle(fontSize: 7),
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
pw.Widget _buildServicesRequiredSection(FormDataModel data) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // Section Title
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: pw.Text(
          '3. Services Required',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
        ),
      ),
      pw.SizedBox(height: 2),
      // Two-column layout
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(flex: 5, child: _buildLeftServicesColumn(data)),
          pw.SizedBox(width: 15),
          pw.Expanded(
            flex: 6,
            child: _buildRightServicesColumn(data),
          ),
        ],
      ),
    ],
  );
}

// Builds the left column of the services section
pw.Widget _buildLeftServicesColumn(FormDataModel data) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // --- ATM CARD ---
      pw.Text('1. ATM-CUM-DEBIT CARD', style: const pw.TextStyle(fontSize: 8)),
      pw.SizedBox(height: 1),
      _buildBoxedApplicantRow(
        '1st Applicant',
        isYesChecked: data.atmCard1stApplicant,
      ),
      pw.SizedBox(height: 1),
      _buildBoxedApplicantRow(
        '2nd Applicant',
        isYesChecked: data.atmCard2ndApplicant,
      ),
      pw.SizedBox(height: 1),
      pw.Text(
        '(Mobile no. is mandatory for services 2 to 8)',
        style: const pw.TextStyle(fontSize: 7),
      ),
      pw.SizedBox(height: 4),

      // --- CHEQUE BOOK ---
      pw.Row(
        children: [
          pw.Text('2. CHEQUE BOOK', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 8),
          labeledCheckbox('YES', checked: data.chequeBookYes),
          pw.SizedBox(width: 8),
          labeledCheckbox('NO', checked: data.chequeBookNo),
        ],
      ),
      pw.SizedBox(height: 1),
      pw.Text(
        '(Only for Regular SB/Current Accounts/Caps Gain(SB))\n(Not available for Regular BSBD/Small Accounts)',
        style: const pw.TextStyle(fontSize: 7),
      ),
      pw.SizedBox(height: 4),

      // --- INTERNET BANKING ---
      pw.Text(
        '3. INTERNET BANKING REQUIRED:',
        style: const pw.TextStyle(fontSize: 8),
      ),
      pw.Text(
        'Transaction rights required',
        style: const pw.TextStyle(fontSize: 8),
      ),
      pw.SizedBox(height: 1),
      _buildUnboxedApplicantRow(
        '1st Applicant',
        isYesChecked: data.netBankingYes,
      ),
      pw.SizedBox(height: 1),
      _buildUnboxedApplicantRow('2nd Applicant', isYesChecked: false), // Default or add field
      pw.SizedBox(height: 1),
      pw.Text(
        '(Available only for singly operated accounts and joint accounts operated by Either or Survivor mode. In case of accounts operated as Former or Survivor mode INB facility is available to1st applicant only)',
        style: const pw.TextStyle(fontSize: 6.5, height: 1.2),
      ),
    ],
  );
}

// Builds the right column of the services section
pw.Widget _buildRightServicesColumn(FormDataModel data) {
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
            charBoxes(data.atmCardName.isNotEmpty ? data.atmCardName : data.atmCardName1stApplicant, 22),
            pw.SizedBox(height: 3),
            charBoxes(data.atmCardName2ndApplicant, 22), 
          ],
        ),
      ),
      pw.SizedBox(height: 2),

      // --- OTHER SERVICES ---
      _buildSimpleServiceRow(
        '4. SMS ALERTS(Charges Applicable)',
        data.smsAlertYes,
        data.smsAlertNo,
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.only(left: 8),
        child: pw.Text(
          'SMS Alerts on Registered Mobile Number',
          style: const pw.TextStyle(fontSize: 7),
        ),
      ),
      pw.SizedBox(height: 3),
      _buildSimpleServiceRow('5. PHONE BANKING SERVICES:', data.phoneBankingYes, data.phoneBankingNo),
      pw.SizedBox(height: 3),
      _buildSimpleServiceRow(
        '6. MOBILE BANKING:',
        data.mobileBankingYes,
        data.mobileBankingNo,
      ),
      pw.SizedBox(height: 3),
      _buildSimpleServiceRow('7. PASSBOOK REQUIRED:', data.passbookYes, data.passbookNo),
      pw.Padding(
        padding: const pw.EdgeInsets.only(left: 8),
        child: pw.Text(
          '(For Savings Bank Account)',
          style: const pw.TextStyle(fontSize: 7),
        ),
      ),
      pw.SizedBox(height: 3),
      _buildSimpleServiceRowCustom(
        '8. e-Statement(at monthly intervals), in lieu of paper copy:',
        ['Required', 'Not Required'],
        [data.emailStatementYes, data.emailStatementNo],
      ),
    ],
  );
}

// Helpers
pw.Widget _buildBoxedApplicantRow(String label, {bool isYesChecked = false}) {
  return pw.Row(
    children: [
      pw.Container(
        width: 60,
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
        child: pw.Center(
          child: pw.Text(label, style: const pw.TextStyle(fontSize: 8)),
        ),
      ),
      pw.SizedBox(width: 8),
      labeledCheckbox('Yes', checked: isYesChecked),
      pw.SizedBox(width: 8),
      labeledCheckbox('No', checked: !isYesChecked),
    ],
  );
}

pw.Widget _buildUnboxedApplicantRow(String label, {bool isYesChecked = false}) {
  return pw.Row(
    children: [
      pw.SizedBox(
        width: 60,
        child: pw.Text(label, style: const pw.TextStyle(fontSize: 8)),
      ),
      pw.SizedBox(width: 8),
      labeledCheckbox('YES', checked: isYesChecked),
      pw.SizedBox(width: 8),
      labeledCheckbox('NO', checked: !isYesChecked),
    ],
  );
}

pw.Widget _buildSimpleServiceRow(
  String title,
  bool yesChecked,
  bool noChecked,
) {
  return pw.Row(
    children: [
      pw.Expanded(
        child: pw.Text(title, style: const pw.TextStyle(fontSize: 8)),
      ),
      labeledCheckbox('YES', checked: yesChecked),
      pw.SizedBox(width: 8),
      labeledCheckbox('NO', checked: noChecked),
    ],
  );
}

pw.Widget _buildSimpleServiceRowCustom(
  String title,
  List<String> options,
  List<bool> checked,
) {
  return pw.Row(
    children: [
      pw.Expanded(
        child: pw.Text(title, style: const pw.TextStyle(fontSize: 8)),
      ),
      labeledCheckbox(options[0], checked: checked[0]),
      pw.SizedBox(width: 4),
      labeledCheckbox(options[1], checked: checked[1]),
    ],
  );
}

// =========================================================================
// == END SERVICES SECTION
// =========================================================================

// =========================================================================
// == FIXED DEPOSIT SECTION
// =========================================================================
pw.Widget _buildFixedDepositSection(FormDataModel data) {
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
    height: 30,
    decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
    child: pw.Row(
      children: [
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
      ],
    ),
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
                labeledCheckbox(
                  'Auto renew principal & payback interest',
                  checked: data.fdAutoRenewPrincipalPaybackInterest,
                ),
                pw.SizedBox(height: 2),
                labeledCheckbox(
                  'Pay principal & interest',
                  checked: data.fdPayPrincipalAndInterest,
                ),
              ],
            ),
          ),
          pw.SizedBox(width: 10),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                labeledCheckbox(
                  'Auto renew principal & interest',
                  checked: data.fdAutoRenewBoth,
                ),
                pw.SizedBox(height: 2),
                pw.Row(
                  children: [
                    labeledCheckbox(
                      'Auto Renew with part amount for Rs.',
                      checked: data.fdAutoRenewPartAmount,
                    ),
                    pw.SizedBox(width: 4),
                    underlinedText(0),
                  ],
                ),
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
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
        ),
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          labeledCheckbox(
            'Recurring Deposit',
            checked: data.modRecurringDeposit,
          ),
          labeledCheckbox(
            'Double Benefit Deposit',
            checked: data.modDoubleBenefit,
          ),
          labeledCheckbox('MIC/QIC', checked: data.modMICQIC),
          labeledCheckbox(
            'Short / Fixed Deposit',
            checked: data.modShortFixedDeposit,
          ),
          labeledCheckbox('Tax Saving Scheme', checked: data.modTaxSaving),
          labeledCheckbox('Capital Gain (TDR)', checked: data.modCapitalGain),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  children: [
                    pw.Text(
                      'Amount: Rs. ',
                      style: const pw.TextStyle(fontSize: 8),
                    ),
                    pw.Text(
                      data.fdAmount,
                      style: const pw.TextStyle(fontSize: 8),
                    ),
                    underlinedText(60),
                    pw.SizedBox(width: 8),
                    pw.Text(
                      'Rs. (in words) ',
                      style: const pw.TextStyle(fontSize: 8),
                    ),
                    underlinedText(0),
                  ],
                ),
                pw.SizedBox(height: 2),
                pw.Row(
                  children: [
                    pw.Text('Period: ', style: const pw.TextStyle(fontSize: 8)),
                    underlinedText(30),
                    pw.Text(
                      ' year(s) ',
                      style: const pw.TextStyle(fontSize: 8),
                    ),
                    underlinedText(30),
                    pw.Text(
                      ' month(s) ',
                      style: const pw.TextStyle(fontSize: 8),
                    ),
                    underlinedText(30),
                    pw.Text(' days', style: const pw.TextStyle(fontSize: 8)),
                  ],
                ),
              ],
            ),
          ),
          pw.SizedBox(width: 8),
          stampBox,
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Text(
        'In case of Term Deposit, interest payable#:',
        style: const pw.TextStyle(fontSize: 8),
      ),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          labeledCheckbox('Monthly', checked: data.rdMonthly),
          labeledCheckbox('Quarterly', checked: data.rdQuarterly),
          labeledCheckbox('Calender Quarter', checked: data.rdCalenderQuarter),
          labeledCheckbox('Half Yearly', checked: data.rdHalfYearly),
          labeledCheckbox('Yearly', checked: data.rdYearly),
        ],
      ),
      pw.SizedBox(height: 2),
      maturityInstructionWidget,
      pw.SizedBox(height: 2),
      pw.Text(
        '*(Auto Renewal will be done for the similar term at the prevailing interest rate on the date of renewal.)',
        style: const pw.TextStyle(fontSize: 6.5),
      ),
      pw.SizedBox(height: 1),
      pw.Text(
        '@# (All Interest payable and Maturity instructions options will not be offered bt all Banks. Contact respective Banks for the options available) Proceeds/Residual amount):',
        style: const pw.TextStyle(fontSize: 6.5),
      ),
      pw.SizedBox(height: 4),
      pw.Text(
        'Payment instruction (Maturity Proceeds/Residual amount):',
        style: const pw.TextStyle(fontSize: 8),
      ),
      pw.Row(
        children: [
          labeledCheckbox('By credit to my Bank Account No.', checked: data.accountNo.isNotEmpty),
          pw.SizedBox(width: 8),
          charBoxes(data.accountNo, 15),
        ],
      ),
    ],
  );
}

// =========================================================================
// == MULTI-OPTION DEPOSIT SECTION
// =========================================================================
pw.Widget _buildMultiOptionDepositSection(FormDataModel data) {
  pw.Widget dottedText(double width) {
    return pw.Container(
      width: width,
      height: 10,
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(width: 0.5, style: pw.BorderStyle.dotted),
        ),
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
        child: pw.Text(
          '5. MULTI-OPTION DEPOSIT SCHEME/AUTO SWEEP',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
        ),
      ),
      pw.SizedBox(height: 2),

      // Type and Period Row
      pw.Row(
        children: [
          pw.Text('Type of Deposit', style: const pw.TextStyle(fontSize: 7)),
          pw.SizedBox(width: 4),
          labeledCheckbox('Term Deposit', checked: data.modTermDeposit),
          pw.SizedBox(width: 4),
          labeledCheckbox('Term Deposit (Reinvestment)', checked: data.modTermDepositReinvestment),
          pw.SizedBox(width: 10),
          pw.Text('Period of Deposit', style: const pw.TextStyle(fontSize: 7)),
          pw.Stack(
             children: [
               dottedText(40),
               pw.Positioned(
                 bottom: 2,
                 left: 5,
                 child: pw.Text(data.modPeriodYears, style: const pw.TextStyle(fontSize: 7)),
               ),
             ]
          ),
          pw.Text(' Years(s)', style: const pw.TextStyle(fontSize: 7)),
          pw.Stack(
             children: [
               dottedText(40),
               pw.Positioned(
                 bottom: 2,
                 left: 5,
                 child: pw.Text(data.modPeriodMonths, style: const pw.TextStyle(fontSize: 7)),
               ),
             ]
          ),
          pw.Text(' Months', style: const pw.TextStyle(fontSize: 7)),
        ],
      ),
      pw.SizedBox(height: 2),

      // Consent Rows
      pw.Text(
        'I/We hereby give consent for debiting my/our account for recovering service charges as normally applicable to Savings Bank and Current Account.',
        style: const pw.TextStyle(fontSize: 7),
      ),
      pw.SizedBox(height: 1),
      pw.Text(
        'I/We hereby give consent for debiting my/our Savings Bank/Current Account for creating/AUTO SWEEP as per the Terms and Conditions.',
        style: const pw.TextStyle(fontSize: 7),
      ),
      pw.SizedBox(height: 2),

      // Linked Account Row
      pw.Row(
        children: [
          pw.Text(
            'Linked Saving Bank/Current Account No.',
            style: const pw.TextStyle(fontSize: 7),
          ),
          pw.SizedBox(width: 4),
          charBoxes(data.debitAccountNo, 15),
        ],
      ),
      pw.SizedBox(height: 2),

      // Reverse Sweep Row
      pw.Row(
        children: [
          pw.Text(
            'Under reverse sweep facility for breaking the MOD to be broken by',
            style: const pw.TextStyle(fontSize: 7),
          ),
          pw.SizedBox(width: 4),
          labeledCheckbox('Last in first out', checked: true),
        ],
      ),
    ],
  );
}

// =========================================================================
// == NEW RECURRING DEPOSIT SECTION
// =========================================================================
pw.Widget _buildRecurringDepositSection(FormDataModel data) {
  pw.Widget dottedText(double width) {
    return pw.Container(
      width: width,
      height: 10,
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(width: 0.5, style: pw.BorderStyle.dotted),
        ),
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
          child: pw.Text(
            '6   RECURRING DEPOSIT',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.fromLTRB(4, 2, 4, 2),
          child: pw.Column(
            children: [
              // Installment Row
              pw.Row(
                children: [
                  labeledCheckbox('Monthly / Core Monthly installment:', checked: data.rdMonthly),
                  pw.SizedBox(width: 4),
                  pw.Text('Rs.', style: const pw.TextStyle(fontSize: 7)),
                  pw.Text(data.rdInstallment, style: const pw.TextStyle(fontSize: 7)),
                  dottedText(40),
                  pw.SizedBox(width: 4),
                  pw.Text(
                    'Rs. (In words)',
                    style: const pw.TextStyle(fontSize: 7),
                  ),
                  dottedText(80),
                  pw.SizedBox(width: 4),
                  pw.Text('Period:', style: const pw.TextStyle(fontSize: 7)),
                  dottedText(20),
                  pw.Text(' Years:', style: const pw.TextStyle(fontSize: 7)),
                  dottedText(20),
                  pw.Text(' Month(s)', style: const pw.TextStyle(fontSize: 7)),
                  dottedText(20),
                ],
              ),
              pw.SizedBox(height: 1),

              // Standing Instruction Row
              pw.Row(
                children: [
                  pw.SizedBox(
                    width: 180,
                    child: labeledCheckbox('Standing instruction (if any)', checked: data.debitAccountNo.isNotEmpty),
                  ),
                  pw.Text(
                    'Debit Account No.',
                    style: const pw.TextStyle(fontSize: 7),
                  ),
                  pw.SizedBox(width: 4),
                  pw.Expanded(
                    child: charBoxes(data.debitAccountNo, 18),
                  ),
                ],
              ),
              pw.SizedBox(height: 1),

              // On Maturity Row
              pw.Row(
                children: [
                  pw.SizedBox(
                    width: 180,
                    child: labeledCheckbox(
                      'On Maturity, credit proceeds to Account No.',
                      checked: true,
                    ),
                  ),
                  pw.SizedBox(width: 70), // Manual alignment
                  pw.Expanded(
                    child: charBoxes(data.debitAccountNo, 14),
                  ),
                ],
              ),
              pw.SizedBox(height: 3),

              // TDS Row
              pw.Row(
                children: [
                  pw.Text(
                    'For the above Term Deposit Account, please deduct applicable TDS from',
                    style: const pw.TextStyle(fontSize: 7),
                  ),
                  pw.SizedBox(width: 4),
                  pw.Text(
                    '(SB/CA Account No.)',
                    style: const pw.TextStyle(fontSize: 7),
                  ),
                  pw.SizedBox(width: 4),
                  pw.Expanded(
                    child: charBoxes(data.debitAccountNo, 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
