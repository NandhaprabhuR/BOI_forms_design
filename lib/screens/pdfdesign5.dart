// lib/screens/pdfdesign5.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart'; // <--- ADDED: Import the data model

/// Builds the entire fifth page of the document.
pw.Widget buildFifthPage(FormDataModel data) { // <--- MODIFIED: Accepts data
  /// A helper function for creating the signature box.
  pw.Widget _signatureBox({String text = '', String? label, double height = 40}) {
    return pw.Column(
      mainAxisSize: pw.MainAxisSize.min,
      children: [
        pw.Container(
          height: height,
          width: 180, // Fixed width for the signature box
          decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
          child: text.isNotEmpty
              ? pw.Center(
            child: pw.Text(
              text,
              style:  pw.TextStyle(fontStyle: pw.FontStyle.italic),
            ),
          )
              : pw.SizedBox(),
        ),
        if (label != null) pw.SizedBox(height: 2),
        if (label != null)
          pw.Text(
            label,
            style: const pw.TextStyle(fontSize: 7),
            textAlign: pw.TextAlign.center,
          ),
      ],
    );
  }

  /// A helper function to build each numbered term point for consistency.
  pw.Widget _buildTermPoint(String number, String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 2), // Compact spacing
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(
            width: 15,
            child: pw.Text(number, style: const pw.TextStyle(fontSize: 7.5)),
          ),
          pw.Expanded(
            child: pw.Text(
              text,
              textAlign: pw.TextAlign.justify,
              style: const pw.TextStyle(fontSize: 7.5, height: 1.1), // Compact font and line height
            ),
          ),
        ],
      ),
    );
  }

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // Page Title
      pw.Container(
        width: double.infinity,
        padding: const pw.EdgeInsets.symmetric(vertical: 2.5),
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
        child: pw.Center(
          child: pw.Text(
            'TERMS AND CONDITIONS FOR OPENING OF SB ACCOUNTS',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9.5),
          ),
        ),
      ),
      pw.SizedBox(height: 5),

      // Bordered container for all terms
      pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColors.black, width: 0.5),
        ),
        padding: const pw.EdgeInsets.fromLTRB(5, 4, 5, 4),
        child: pw.Column(
          children: [
            _buildTermPoint('1.', 'I affirm and declare that I have read over and understood the rules and regulations of the "Bank" and those relating to various services offered by the Bank including but not limiting to debit card/internet banking/SMS banking/Tele-Banking/Mobile Banking/Virtual Banking and any other facilities. I agree to abide by the same as amended/modified from time to time by the Bank/Regulator/Government published through circulars, notifications, notice board/websites/newspaper publications etc. I waive the rights, if any, to have personal notice in respect of such amendments/modifications. I agree that the transactions and requests executed in my account(s) through internet, mobile, tele-banking or virtual banking under my User ID and password/PIN/OTP will be legally binding on me & I am responsible for the maintenance of secrecy and confidentiality of the authentication credentials and any other information/details/OTP/PIN, etc. in such matters. I agree that Bank has got all the rights to debit my account for any service charge, expenses or other dues which the Bank is entitled/liable to recover from me. I also authorise the bank and agree to close/discontinue my account without any notice to me. I hereby undertake to inform the Bank on any change in my communication address or constitution.'),
            _buildTermPoint('2.', 'In respect of accounts opened on the basis of Aadhaar details, I hereby declare that I have submitted the Aadhaar Card issued by UIDAI voluntarily for identification and/or address proof towards the compliance of KYC norms under the PMLA, 2002 and I hereby consent that the Bank may verify the same with the UIDAI and authorise the UIDAI expressly to release the identity and address through biometric authentication to the Bank. I wish to seed this account with NPCI mapper to enable me to receive Direct Benefit Transfer (DBT) including LPG subsidy from Govt of India (GOI) in this account. I understand that if more than one benefit transfer is due to me, I will receive all the benefit transfer in this account.'),
            _buildTermPoint('3.', 'I confirm and declare that I am not prevented/prohibited/restricted by any applicable legal/regulatory/contractual or other provisions from opening and/or maintaining the accounts or to transact with the Bank in any other way.'),
            _buildTermPoint('4.', 'I agree that my personal KYC details may be shared with Central KYC registry or any other competent authority. I hereby consent to receive information from the Bank/Central KYC Registry/GoI/RBI or any other authority through SMS/e-mail on my registered mobile number/e-mail address. I also agree that the non-receipt of any such SMS/e-mail shall not make the Bank liable for any loss or damage whatsoever in nature.'),
            _buildTermPoint('5.', 'I hereby certify that I have declared my status as per the rules applicable under section 285BA of the Income Tax Act, 1961 as notified by Central Board of Direct Taxes (CBDT) vide Notification No. S.O. 2155(E) dated 7th August 2015 and RBI Circular Ref No. DBR.AML.BC.No.36/14.01.001/2015-16 dated 28 August 2015 in the matter including any subsequent modification/amendment thereof.'),
            _buildTermPoint('6.', 'I understand, acknowledge and authorize that as per the provisions of Income Tax Act, Rules made thereunder and the guidelines issued by the Government/RBI in the matter, depending upon the residential status and/or other criteria stipulated therein, the Bank may have to report the details in respect of my account(s) as per the prescribed format to the Central Board of Direct Taxes (CBDT) or other Government Agencies to comply with the obligations as per the Inter-Governmental Agreements (IGA) in respect of Foreign Accounts Tax Compliance Act (FATCA) and Common Reporting Standards (CRS) and/or any other similar arrangements.'),
            _buildTermPoint('7.', 'I certify & declare that the information provided by me for opening account and availing other services herein or through website/electronically as applicable to me signed/authenticated by me as well as in the documentary evidence provided by me for opening account and availing other services are, to the best of my knowledge and belief, true, correct and complete and that I have not withheld any material information that may affect the assessment/categorization of my account as a U.S. Reportable Account or Other Reportable Account or otherwise. In case any of the information or details provided by me is found to be false or untrue or misleading or misrepresenting, I am aware that I may be held liable for it.'),
            _buildTermPoint('8.', 'I undertake the responsibility to declare and disclose immediately and in no case beyond 30 days from the date of change, any changes that may take place in the information provided herein/or otherwise, as well as in the documentary evidence provided by me or if any certification becomes incorrect or undergoes a change. I further undertake to provide fresh and valid self-certification along with documentary evidence as and when so required; nevertheless all declaration and undertaking given herein will also be applicable to all such modified/amended document/information provided by me unless revised self-certification as above is provided to the Bank.'),
            _buildTermPoint('9.', 'I also agree that my failure to disclose any material fact/information known to me now or in future or my failure to remedy any deficiency in documents/information/other details within the stipulated period, may invalidate me from transacting in the account and the Bank would be within its right to put restrictions in the operations of my account or to close it or to report to any regulator and/or any authority designated by the Government of India (GoI)/RBI for the said purpose or take any other action as may be deemed appropriate by the Bank under the guidelines issued by CBDT/RBI/GoI from time to time.'),
            _buildTermPoint('10.', 'I also agree to furnish and intimate to the Bank any other particulars that are called upon me to provide on account of any change in law either in India or abroad in the above matter or otherwise.'),
            _buildTermPoint('11.', 'I shall indemnify the Bank from any loss/damage that may be caused to the Bank on account of any defect/mistake in the details provided herein or on account of providing incorrect or incomplete information by me.'),
            _buildTermPoint('12.', 'I undertake to submit data/information together with fresh KYC documents for updation of KYC details at periodical intervals as may be required by the Bank.'),
            _buildTermPoint('13.', 'I understand that the account will be activated and debits will be allowed only after completion of Customer Due Diligence relating to KYC by the Bank.'),
            _buildTermPoint('14.', 'In case the account is opened without PAN, I undertake to submit PAN on or before such date as may be notified by the Government of India, failing which the account shall cease to be operational till the time PAN is submitted, as per Prevention of Money-Laundering (Maintenance of Records) Rules 2005.'),
            _buildTermPoint('15.', 'In case, deemed OVDs are submitted for Current Address at the time of Account opening, I undertake to submit Aadhaar or any of the OVD having Current Address within 3 months from the date of account opening, failing which I understand that my account may cease to be operational as per GOI guidelines at the material time.'),
            _buildTermPoint('16.', 'I have received the Welcome Kit containing INB Kit and ATM card/cheque book and understand that in case of any misuse/misplacement of the contents of the Kit, the Bank will not be liable for any loss/damage.'),
            _buildTermPoint('17.', 'I hereby certify that the Savings Bank Account would be used by me to route transactions of only non-business/non-commercial nature. In the event of occurrence of such transactions or any such transactions that may be construed as commercial/business/dubious or undesirable, the Bank reserves the right to unilaterally freeze operations in such accounts and/or close the account.'),
            _buildTermPoint('18.', 'I have been advised of Average Monthly Balance (AMB) requirement for the account to be opened and given to understand that these requirements are subject to revision/changes and such revision/changes will be uploaded in the Bank\'s site which will be acceptable to me as a notice to that effect.'),
            _buildTermPoint('19.', 'I confirm that the product features of BSBD account have been explained to me (applicable to BSBD account applicant).'),
            _buildTermPoint('20.', 'I acknowledge receipt of rules and regulations of Savings Bank Account.'),
            _buildTermPoint('21.', 'I have been advised that if I do not provide my mobile number, I will not be eligible for any facility of electronic transactions other than ATM cash withdrawals.'),
            _buildTermPoint('22.', '(Applicable for accounts opened for credit of social Welfare Benefits)\nI understand that this account will be opened under BSBD category. I also understand that in case, I do not wish to continue in this BSBD account, and switch over to Regular Savings Bank account, I will have to maintain the Average Monthly Balance (AMB) applicable for Regular Savings Bank Account. I therefore undertake to maintain AMB in the account if I switch over to Regular Savings Bank Account from BSBD.'),
            _buildTermPoint('23.', '(Applicable for accounts opened in the name of Minors)\nI understand that the requirements of Average Quarterly Balance (AQB) and penalty for non-maintenance will be applicable in this account once the applicant becomes Major. I therefore undertake to maintain Average Monthly Balance (AMB) from the date of attaining majority.'),
            _buildTermPoint('24.', 'I hereby declare that the details furnished above are true and correct to the best of my knowledge and belief and I undertake to inform you of any changes therein, immediately in case any of the above information is found to be false or untrue or misleading or misrepresenting, I am aware that I may be held liable for it.'),
            _buildTermPoint('25.', 'I/We confirm that the product features of account have been explained to me.'),
            _buildTermPoint('26.', 'I/We hereby give consent for debiting my/our account for recovering service charges as normally applicable to Saving Bank and Current Account.'),

            pw.SizedBox(height: 8),

            // FIXED: Signature box is now below point 26 and aligned to the right.
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: _signatureBox(
                text: data.signature1Text, // <--- MODIFIED: Use model data
                label: 'Signature / Thumb Impression of\nApplicant(s)',
              ),
            ),
          ],
        ),
      ),
      pw.SizedBox(height: 5),
      pw.Center(child: pw.Text('5', style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
    ],
  );
}