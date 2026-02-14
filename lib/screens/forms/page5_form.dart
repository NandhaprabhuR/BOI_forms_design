// lib/screens/forms/page5_form.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import '../model/form_data_model.dart';

class Page5Form extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page5Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page5Form> createState() => _Page5FormState();
}

class _Page5FormState extends State<Page5Form> {
  // Image path for signature
  String? _termsSignaturePath;

  @override
  void initState() {
    super.initState();
    // Initialize signature from model if declared
    _termsSignaturePath = widget.initialData.bsbdSignature.isNotEmpty 
        ? widget.initialData.bsbdSignature 
        : null;
  }

  void _notifyChange() {
    widget.initialData.bsbdSignature = _termsSignaturePath ?? '';
    widget.onDataChanged(widget.initialData);
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      final base64String = 'data:image/png;base64,${base64Encode(bytes)}';
      setState(() {
        _termsSignaturePath = base64String;
        _notifyChange();
      });
    }
  }

  Widget _buildSignatureBox() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.shade50,
        ),
        child: _termsSignaturePath != null
            ? Stack(
                children: [
                  Center(
                    child: kIsWeb
                        ? Image.network(
                            _termsSignaturePath!,
                            fit: BoxFit.contain,
                          )
                        : Image.file(
                            File(_termsSignaturePath!),
                            fit: BoxFit.contain,
                          ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 16),
                      onPressed: () {
                        setState(() {
                          _termsSignaturePath = null;
                          _notifyChange();
                        });
                      },
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.gesture, color: Colors.grey.shade600, size: 32),
                  const SizedBox(height: 8),
                  Text(
                    'Signature / Thumb Impression of Applicant(s)',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap to add',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue.shade700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'TERMS AND CONDITIONS FOR OPENING OF BANK ACCOUNTS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          // Term 1
          const Text(
            '1. I affirm and declare that I have read over and understood the rules and regulations of the "Bank" and those relating to various services offered by the Bank including but not limiting to debit card/internet banking/SMS banking/Tele-Banking/Mobile Banking/Virtual Banking and any other facilities. I agree to abide by the same as amended/modified from time to time by the Bank/Regulator/Government published through circulars, notifications, notice board/websites/newspaper publications, etc. I waive the rights, if any, to have personal notice in respect of such amendments/modifications.I agree that the transactions and requests executed in my account(s)through internet, mobile, tele- banking or virtual banking under my User ID and password/PIN/OTP will be legally binding on me & I am responsible for the maintenance of secrecy and confidentiality of the authentication credentials and any other information/details/OTP/PIN, etc., in such matters. I agree that Bank has got all the rights to debit my account for any service charge, expenses or other dues which the Bank is entitled/ liable to recover from me. I also authorise the Bank and agree to close/discontinue my account without any notice to me. I hereby undertake to inform the Bank on any change in my communication address or constitution.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 2
          const Text(
            '2. In respect of accounts opened on the basis of Aadhaar details, I hereby declare that I have submitted the Aadhaar Card issued by UIDAI voluntarily for identification towards the compliance of KYC norms under PMLA, 2002 and I hereby consent that the Bank may verify the same with the UIDAI and authorise the UIDAI to expressly release the identity and address through biometric authentication to theBank. I wish to seed this account with NPCI mapper to enable me to receive Direct BenefitTransfer (DBT) including LPG subsidy from Govt of India (GOI) in this account. I understand that if more than one benefit transfer is due to me, I will receive all the benefit transfer in this account.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 3
          const Text(
            '3. I confirm and declare that I am not prevented/prohibited/restricted by any applicable legal/regulatory/contractual or other provisions from opening and/or maintaining the accounts or to transact with the Bank in any other way.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 4
          const Text(
            '4. I agree that my personal KYC details may be shared with Central KYC registry or any other competent authority. I hereby consent to receive information from the Bank/Central KYC Registry/ GoI/RBI or any other authority through SMS/e-mail on my registered mobile number/ e-mail address. I also agree that the non-receipt of any such SMS/e-mail shall not make the Bank liable for any loss or damage whatsoever in nature.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 5
          const Text(
            '5. I hereby certify that I have declared my status as per the rules applicable under section 285BA of the Income Tax Act, 1961 as notified by Central Board of Direct Taxes (CBDT) vide Notification No. S.O. 2155(E) dated 7 August 2015 and RBI Circular Ref No. DBR.AML.BC.No.36/ 14.01.001/2015-16 dated 28 August 2015 in the matter including any subsequent modification/amendment thereof.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 6
          const Text(
            '6. I understand, acknowledge and authorize that as per the provisions of Income Tax Act, Rules made thereunder and the guidelines issued by the Government/RBI in the matter,depending upon the residential status and/or other criteria stipulated therein, the Bank may have to report the details in respect of my account(s) as per the prescribed format to the Central Board of Direct Taxes (CBDT)or other Government Agencies to comply with the obligations as per the Inter- Governmental Agreements (IGA) in respect of Foreign Accounts Tax Compliance Act (FATCA) and Common Reporting Standards (CRS) and / or any other similar arrangements.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 7
          const Text(
            '7. I certify & declare that the information provided by me for opening loan account and availing other services herein or through website/electronically as applicable to me signed/authenticated by me as well as in the documentary evidence provided by me for opening loan account and availing other services are, to the best of my knowledge and belief, true, correct and complete and that I have not withheld any material information that may affect the assessment/categorization of my account as a U.S. Reportable Account or Other Reportable Account or otherwise. In case any of the information or details provided by me is found to be false or untrue or misleading or misrepresenting, I am aware that I may be held liable for it.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 8
          const Text(
            '8. I undertake the responsibility to declare and disclose immediately and in no case beyond 30 days from the date of change, any changes that may take place in the information provided herein/or otherwise, as well as in the documentary evidence provided by me or if any certification becomes incorrect or undergoes a change. I further undertake to provide fresh and valid self–certification along with documentary evidence as and when so required,nevertheless all declaration and undertaking given herein will also be applicable to all such modified/amended document/information provided by me unless revised self–certification as above is provided to the Bank.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 9
          const Text(
            '9. I also agree that my failure to disclose any material fact/information known to me now or in future or my failure to remedy any deficiency in documents/information/other details within the stipulated period, may invalidate me from transacting in the account and the Bank would be within its right to put restrictions in the operations of my account or to close it or to report to any regulator and/or any authority designated by the Government of India(GoI)/RBI for the said purpose or take any other action as may be deemed appropriate by the Bank under the guidelines issued by CBDT/ RBI/GoI from time to time.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 10
          const Text(
            '10. I also agree to furnish and intimate to the Bank any other particulars that are called upon me to provide on account of any change in law either in India or abroad in the above matter or otherwise.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 11
          const Text(
            '11. I shall indemnify the Bank from any loss/damage that may be caused to the Bank on account of any defect/mistake in the details provided herein or on account of providing incorrect or incomplete information by me.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 12
          const Text(
            '12. I undertake to submit data/information together with fresh KYC documents for updation of KYC details at periodical intervals as may be required by the Bank.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 13
          const Text(
            '13. I understand that the account will be activated and debits will be allowed only after completion of Customer Due Diligence relating to KYC by the Bank.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 14
          const Text(
            '14. In case the account is opened without PAN, I undertake to submit PAN on or before such date as may be notified by the Government of India, failing which the account shall cease to be operational till the time PAN is submitted, as per Prevention of Money -Laundering (Maintenance of Records ) Rules 2005.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 15
          const Text(
            '15. In case, deemed OVDs are submitted for Current Address at the time of Account opening, I undertake to submit Aadhaar or any of the OVD having Current Address within 3 months from the date of account opening, failing which I understand that my account may cease to be operational as per GOI guidelines at the material time.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 16
          const Text(
            '16. I have received the Welcome Kit containing Internet Banking Kit and ATM card/cheque book and understand that in case of any misuse/misplacement of the contents of the Kit, the Bank will not be liable for any loss/damage.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 17
          const Text(
            '17. I hereby certify that the Savings Bank Account would be used by me to route transactions of only non-business/non-commercial nature.In the event of occurrence of such transactions or any such transactions that may be construed as commercial/business/dubious or undesirable, the Bank reserves the right to unilaterally freeze operations in such accounts and /or close the account.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 18
          const Text(
            '18. I have been advised of Average Quarterly Balance(AQB) requirement for the account to be opened and given to understand that these requirements are subject to revision/changes and such revision/ changes will be uploaded in the Bank\'s site which will be acceptable to me as a notice to that effect.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 19
          const Text(
            '19. I confirm that the product features of BSBD account have been explained to me(applicable to BSBD account applicant)',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 20
          const Text(
            '20. I acknowledge receipt of rules and regulations of Savings Bank Account.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 21
          const Text(
            '21. I have been advised that if I do not provide my mobile number, I will not be eligible for any facility of electronic transactions other than ATM cash withdrawal.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 22
          const Text(
            '22. (Applicable for account opened for credit of Social Welfare Benefits)',
            style: TextStyle(
              fontSize: 12,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 8),
          const Text(
            'I understand that this account will be opened under BSBD category. I also understand that in case, I do not wish to continue in this BSBD account, and switch over to Regular Savings Bank account, I will have to maintain the Average Quarterly Balance(AQB) applicable for Regular Savings Bank Account .I therefore undertake to maintain AQB in the account if I switch over to Regular Savings Bank Account from BSBD.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 23
          const Text(
            '23. (Applicable for accounts opened in the name of Minors)',
            style: TextStyle(
              fontSize: 12,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 8),
          const Text(
            'I understand that the requirements of Average Quarterly Balance(AQB) and penalty for non-maintenance will be applicable in this account once the applicant becomes Major.I therefore undertake to maintain Average Monthly Balance(AQB) from the date of attaining majority.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 24
          const Text(
            '24. I hereby declare that the details furnished above are true and correct to the best of my knowledge and belief and I undertake to inform you of any changes therein, immediately in case any of the above information is found to be false or untrue or misleading or misrepresenting. I am aware that I may be held liable for it.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 25
          const Text(
            '25. I/We confirm that the product features of account have been explained to me',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Term 26
          const Text(
            '26. I/ We hereby give consent for debiting my /our account for recovering service charges as normally applicable to Saving Bank and Current Account.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),

          // Signature Section
          const Text(
            'Signature / Thumb Impression of Applicant(s)',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildSignatureBox(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
