// lib/screens/pdfdesign6.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart'; // <--- NEW: Import the data model

/// Builds the sixth page using a hybrid two-column and single-column layout.
pw.Widget buildSixthPage(FormDataModel data) { // <--- MODIFIED
  // NEW: A Container to wrap the entire page content and add a border
  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.black, width: 1.5),
    ),
    padding: const pw.EdgeInsets.all(10), // Padding between the border and content
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // PART 1: A Row containing the two columns for the main rules.
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // ========== LEFT COLUMN ==========
            pw.Expanded(
              child: _buildSavingsBankRulesSection(),
            ),
            pw.SizedBox(width: 15), // Gutter space between the two columns

            // ========== RIGHT COLUMN ==========
            pw.Expanded(
              child: _buildGeneralRulesSection(),
            ),
          ],
        ),

        pw.SizedBox(height: 10), // Space after the two-column block

        // PART 2: The final sections in a single, full-width column.
        _buildBsbdFeaturesSection(),
        pw.SizedBox(height: 5),
        _buildAcknowledgementForm(data), // <--- MODIFIED
      ],
    ),
  );
}

/// Builds the "SAVINGS BANK RULES (ABRIDGED)" section with summarized text. (Unchanged)
pw.Widget _buildSavingsBankRulesSection() {
  const double headingFontSize = 9;
  const double bodyFontSize = 8.5;
  const double bodyLineSpacing = 1.1;
  const double sectionSpacing = 6;

  pw.Widget _buildRuleSection(String title, String content) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            decoration: pw.TextDecoration.underline,
            fontSize: headingFontSize,
          ),
        ),
        pw.SizedBox(height: 3),
        pw.Text(
          content,
          textAlign: pw.TextAlign.justify,
          style: const pw.TextStyle(
            fontSize: bodyFontSize,
            height: bodyLineSpacing,
          ),
        ),
        pw.SizedBox(height: sectionSpacing),
      ],
    );
  }

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        padding: const pw.EdgeInsets.symmetric(vertical: 2.5),
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.7)),
        child: pw.Center(
          child: pw.Text(
            'SAVINGS BANK RULES (ABRIDGED)',
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border(
            left: pw.BorderSide(width: 0.7),
            right: pw.BorderSide(width: 0.7),
            bottom: pw.BorderSide(width: 0.7),
          ),
        ),
        padding: const pw.EdgeInsets.fromLTRB(6, 6, 6, 0),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _buildRuleSection(
                'Know Your Customer Guidelines',
                'Any person fulfilling account opening requirements may, upon agreeing to comply with the prescribed rules, open a Savings Bank Account, provided she/he furnishes proof of identity and proof of address as required by the Bank.'),
            _buildRuleSection('Nomination & Survivorship Facility',
                'The nomination facility is available and advised for smooth settlement of claims. Nomination is for one person only. If no nomination is made, this should be recorded on the form. Joint accounts have survivorship benefits.'),
            _buildRuleSection(
                'Types of Accounts, Balance Stipulation & Service Charges',
                'Accounts can be opened with or without a chequebook. Current monthly average balance rules and charges for non-maintenance are available on the Bank\'s website or at Branches. No maximum balance ceiling, except for minor accounts.'),
            _buildRuleSection('Minors Accounts',
                'Minors above ten years who can sign uniformly may open accounts in their single name. Joint accounts with guardians are also permitted.'),
            _buildRuleSection('How To Open An Account?', // Summarized
                'Applicants should attend the Bank personally to submit the application form, KYC documents, and photographs. Signatures must be legible and uniform. The provided account number should always be quoted when dealing with the Bank.'),
            _buildRuleSection('Pass Book', // Summarized
                'The pass book and cheque book must be kept safe. The pass book is required for withdrawals via withdrawal form but not for deposits. It should be updated regularly and entries examined for errors. A duplicate pass book can be issued on written request and on payment of prescribed charges.'),
            _buildRuleSection('Cheque Book', // Summarized
                'A cheque book is issued after completing formalities, subject to applicable charges. Only official bank cheques should be used. The Bank may refuse other cheques and has policies on issuing multiple books. Stop payment instructions are available for a fee.'),
          ],
        ),
      ),
    ],
  );
}

/// Builds the second section of rules with summarized text. (Unchanged)
pw.Widget _buildGeneralRulesSection() {
  const double headingFontSize = 9;
  const double bodyFontSize = 8.5;
  const double bodyLineSpacing = 1.1;
  const double sectionSpacing = 6;

  pw.Widget _buildGeneralRule(String title, String content) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: headingFontSize,
          ),
        ),
        pw.SizedBox(height: 3),
        pw.Text(
          content,
          textAlign: pw.TextAlign.justify,
          style: const pw.TextStyle(
            fontSize: bodyFontSize,
            height: bodyLineSpacing,
          ),
        ),
        pw.SizedBox(height: sectionSpacing),
      ],
    );
  }

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      _buildGeneralRule('General',
          'A Savings Bank account is for building savings, not for Current Account usage. The Bank may close an account if it is used for a non-permitted purpose.'),
      _buildGeneralRule('Deposits',
          'Rules for free cash deposits are decided by the Bank. Cheques/drafts in the account holder\'s name are accepted. Third-party instruments are not. Immediate credit for outstation instruments may be available. Charges are available on the Bank\'s website.'),
      _buildGeneralRule('Withdrawals', // Summarized
          'Withdrawals can be made personally with a withdrawal form and passbook, or via ATM/Debit Card. Minimum withdrawal amounts and limits on free transactions apply. Third-party withdrawals require a letter of authority. Special provisions exist for sick or incapacitated customers.'),
      _buildGeneralRule('Overdrafts',
          'Overdrafts may be permitted in exceptional cases with prior arrangements. Cheques drawn in excess of balance will be returned, and a service charge applied.'),
      _buildGeneralRule('Inoperative Accounts',
          'Accounts are classified as inoperative after 24 months of no operations. Customers are advised to operate accounts regularly. Charges are available on the Bank\'s website.'),
      _buildGeneralRule('Standing Instructions',
          'Customers can request the Bank to make periodical payments like insurance premiums from their account, subject to service charges.'),
      _buildGeneralRule('Payment of Interest',
          'Interest is calculated daily and credited quarterly per RBI guidelines. It is paid if it amounts to Re 1/- or more and is rounded to the nearest rupee. Interest is credited even on frozen accounts.'),
      _buildGeneralRule('Transfer & Closure of Account',
          'Accounts can be transferred between branches on request. For closure, a reason must be stated and the passbook submitted. Joint accounts require all signatories. A service charge applies if closed within one year of opening.'),
      _buildGeneralRule('Change in Rules',
          'The Bank reserves the right to alter, delete or add to any of these Rules and service charges for which the customer will be duly notified through Bank\'s website and/or branch notice board.'),
    ],
  );
}

/// Builds the "Features of BSBD account" section (Single Column). (Unchanged)
pw.Widget _buildBsbdFeaturesSection() {
  const double fontSize = 8.5;

  pw.Widget indentedItem(String text) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(width: 12),
        pw.Expanded(child: pw.Text(text, style: pw.TextStyle(fontSize: fontSize))),
      ],
    );
  }

  return pw.Column(
    children: [
      pw.Divider(thickness: 1.5),
      pw.SizedBox(height: 5),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Features of BSBD account: ', style: pw.TextStyle(fontSize: fontSize)),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('i. The deposit of cash at bank branch as well as ATMs/CDMs, Issue of Cheque Books', style: pw.TextStyle(fontSize: fontSize)),
                pw.SizedBox(height: 2),
                indentedItem('ii. Receipt / credit of money through any electronic channel or by means of deposit/ collection of cheques drawn by Central / State Government agencies and departments.'),
                pw.SizedBox(height: 2),
                indentedItem('iii. No limit on number and value of deposits that can be made in month.'),
                pw.SizedBox(height: 2),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      child: indentedItem('iv. Maximum 4 withdrawals including ATM withdrawals'),
                    ),
                    pw.Text('v. ATM Card or ATM-cum-Debit Card', style: pw.TextStyle(fontSize: fontSize)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

/// Builds the final "ACKNOWLEDGEMENT DA-1" form
pw.Widget _buildAcknowledgementForm(FormDataModel data) { // <--- MODIFIED
  const double regularFontSize = 9.0;
  const double smallFontSize = 8.0;
  const PdfColor borderColor = PdfColors.black;

  pw.Widget underline(double width) {
    return pw.Container(
      width: width,
      height: 8,
      decoration: pw.BoxDecoration(
        border: pw.Border(bottom: pw.BorderSide(color: borderColor, width: 0.5)),
      ),
    );
  }

  pw.Widget registrationBoxes() {
    return pw.Row(
      children: List.generate(
        10,
            (index) => pw.Container(
          width: 15,
          height: 15,
          margin: const pw.EdgeInsets.only(right: 1),
          decoration: pw.BoxDecoration(border: pw.Border.all(color: borderColor, width: 0.5)),
        ),
      ),
    );
  }

  return pw.Column(
    children: [
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all(color: borderColor, width: 0.5)),
        child: pw.Column(
          children: [
            pw.Text('ACKNOWLEDGEMENT DA-1',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: regularFontSize)),
            pw.Divider(thickness: 0.5, height: 1),
            pw.Padding(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('We acknowledge receipt of nomination made by you in favour of:',
                      style: pw.TextStyle(fontSize: regularFontSize)),
                  pw.SizedBox(height: 8),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text('Name of the Nominee', style: pw.TextStyle(fontSize: regularFontSize)),
                      pw.SizedBox(width: 4),
                      pw.Text(data.nomineeName, style: pw.TextStyle(fontSize: regularFontSize)), // <--- FROM MODEL
                      pw.Expanded(child: underline(double.infinity)),
                      pw.SizedBox(width: 4),
                      pw.Text('Age:', style: pw.TextStyle(fontSize: regularFontSize)),
                      pw.SizedBox(width: 4),
                      underline(25),
                      pw.SizedBox(width: 4),
                      pw.Text('Years.', style: pw.TextStyle(fontSize: regularFontSize)),
                    ],
                  ),
                  pw.SizedBox(height: 8),
                  pw.Row(
                    children: [
                      pw.Text('With respect to your Account Number',
                          style: pw.TextStyle(fontSize: regularFontSize)),
                      pw.SizedBox(width: 4),
                      pw.Expanded(child: underline(double.infinity)),
                    ],
                  ),
                  pw.SizedBox(height: 8),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('Registration No.', style: pw.TextStyle(fontSize: regularFontSize)),
                          pw.SizedBox(height: 2),
                          registrationBoxes(),
                        ],
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Row(children: [
                            pw.Text('Date:', style: pw.TextStyle(fontSize: regularFontSize)),
                            underline(80),
                          ]),
                          pw.SizedBox(height: 15),
                          pw.Text('Yours faithfully', style: pw.TextStyle(fontSize: regularFontSize)),
                          pw.SizedBox(height: 15),
                          pw.Text('Signature of Bank Official with Seal', style: pw.TextStyle(fontSize: smallFontSize)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      pw.SizedBox(height: 2),
      pw.Divider(thickness: 1.5),
    ],
  );
}