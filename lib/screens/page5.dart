import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Page5Form extends StatefulWidget {
  const Page5Form({super.key});

  @override
  State<Page5Form> createState() => _Page5FormState();
}

class _Page5FormState extends State<Page5Form> {
  // Section 1: Terms and Conditions for SB Accounts
  // No specific controllers for the long text, just display it

  // Section 8: Declaration Cum Undertaking Cum Self-Certification (from previous page, but seems to continue here)
  // Re-evaluating based on the new image, this is part of the terms and conditions itself.
  // No new controllers are needed for this section, as it's primarily text.

  // Checkboxes/Fields explicitly visible in the new images
  bool _iHaveReadTerms = false; // "I/We have read and understood the rules..."
  bool _iConfirmProductFeaturesBSBD = false; // "I confirm that the product features of BSBD account have been explained to me"
  bool _iConfirmConsentReceivingInfoCKYC = false; // "I confirm that my personal / KYC details may be shared with Central KYC registry through SMS / Email address."

  final TextEditingController _applicantSignatureController = TextEditingController(); // Signature at the end of the form

  @override
  void dispose() {
    _applicantSignatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('TERMS & CONDITIONS FOR OPENING OF SB ACCOUNTS'),
          _buildInfoText('1. I/We have read and over and understood the rules and regulations of the "Bank" and those relating to various services offered by the Bank including but not limiting to debit card/ Internet banking/ SMS banking/ Tele banking/ Mobile banking/ Virtual Banking and any other facilities. I agree to abide by the same as amended/modified from time to time by the Bank/ Regulator/ Government published through circulars, notifications, notice board/websites/newspaper publications etc. I/We the rights, if any, to have personal notice in respect of such amendments/modifications. I agree that the transactions and requests executed in my account(s) through internet, mobile, tele-banking or virtual banking which the account shall cease to be operational till the time PAN is submitted, as per Prevention of Money -Laundering (Maintenance of Records) Rules 2005.'),
          _buildInfoText('2. In respect of accounts opened on the basis of Aadhaar details, I hereby declare that I have submitted the Aadhaar Card issued by UIDAI voluntarily for identification and / or address proof towards the compliance of KYC norms under the PMLA, 2002 and I hereby consent that the Bank may verify the same with the UIDAI and authorise the UIDAI expressly to release the identity and address through biometric authentication to the Bank. I wish to send this account with NPCI (mapper to enable me to receive Direct Benefit Transfer (DBT) including LPG subsidy from Govt of India (GOI) in this account. I understand that if more than one benefit transfer is due to me, I will receive all the benefit transfer in this account.'),
          _buildInfoText('3. I confirm and declare that I am not prevented/prohibited/restricted by any applicable legal/regulatory/contractual or other provisions from opening and/or maintaining the accounts or to transact with the Bank in any other way.'),
          _buildInfoText('4. I agree that my personal KYC details may be shared with Central KYC registry or any other competent authority. I hereby consent to receive information from the Bank/Central KYC Registry/GoI/RBI or any other authority through SMS/e-mail on my registered mobile number/e-mail address. I also agree that the non-receipt of any such SMS/e-mail shall not make the Bank liable for any loss or damage whatsoever in nature.'),
          _buildInfoText('5. I hereby certify that I have declared my status as per the rules applicable under section 28BSBA of the Income Tax Act, 1961 as notified by Central Board of Direct Taxes (CBDT) vide Notification No. SO 2155(E) dated 7 August 2015 and RBI Circular Ref No. DBRAMLBC.No.36/14.01.001/2015-16 dated 28 August 2015 in the matter including any subsequent modification/amendment thereof.'),
          _buildInfoText('6. I understand, I acknowledge and authorize that as per the provisions of Income Tax Act, Rules made thereunder and the guidelines issued by the Government/RBI in the matter, depending upon the residential status and/or other criteria stipulated therein, the Bank may have to report the details in respect of my account(s) as per the prescribed format to the Central Board of Direct Taxes (CBDT) for other Government Agencies to comply with the obligations as per the Inter-Governmental Agreements (IGA) in respect of Foreign Accounts Tax Compliance Act (FATCA) and Common Reporting Standards (CRS) and/or any other similar arrangements.'),
          _buildInfoText('7. I certify & declare that the information provided by me for opening account and availing other services herein or through website/electronically as applicable to me signed/authenticated by me as well as in the documentary evidence provided by me for opening account and availing other services are, to the best of my knowledge and belief, true, correct and complete and that I have not withheld any material information that may affect the assessment/categorization of my account as a U.S. Reportable Account or Other Reportable Account or otherwise. In case any of the information or details provided by me is found to be false or untrue or misleading or misrepresenting, I am aware that I may be held liable for it.'),
          _buildInfoText('8. I undertake the responsibility to declare and disclose immediately and in no case beyond 30 days from the date of change, any changes that may take place in the information provided herein/or otherwise, as well as in the documentary evidence provided by me or any certification becomes incorrect or undergoes a change. I further undertake to provide fresh and valid self-certification along with documentary evidence as and when so required, nevertheless all declaration and undertaking given herein will also be applicable to all such modified/amended document/information provided by me unless revised self-certification as above is provided to the Bank.'),
          _buildInfoText('9. I also agree that my failure to disclose any material fact/information known to me now or in future or my failure to remedy any deficiency in documents/information/other details within the stipulated period, may invalidate me from transacting in the account and the Bank would be within its right to put restrictions in the operations of my account to close it or to report to any regulator and/or any authority designated by the Government of India (GoI)/RBI for the said purpose or take any other action as may be deemed appropriate by the Bank under the guidelines issued by CBDT/RBI/GoI from time to time.'),
          _buildInfoText('10. I also agree to furnish and intimate to the Bank any other particulars that are called upon me to provide on account of any change in law either in India or abroad in the above matter or otherwise.'),
          _buildInfoText('11. I shall indemnify the Bank from any loss/damage that may be caused to the Bank on account of any defect/mistake in the details provided herein or on account of providing incorrect or incomplete information by me.'),
          _buildInfoText('12. I undertake to submit data/information together with fresh KYC documents for updation of KYC details at periodical intervals as may be required by the Bank.'),
          _buildInfoText('13. I understand that the account will be activated and debits will be allowed only after completion of Customer Due Diligence relating to KYC by the Bank.'),
          _buildInfoText('14. In case the account is opened without PAN, I undertake to submit PAN on or before such date as may be notified by the Government of India, failing which the account shall cease to be operational till the time PAN is submitted, as per Prevention of Money -Laundering (Maintenance of Records) Rules 2005.'),
          _buildInfoText('15. In case, deemed OVDs are submitted for Current Address at the time of Account opening, I undertake to submit Aadhaar or any of the OVD having Current Address within 3 months from the date of account opening failing which I understand that my account may cease to be operational as per GOI guidelines at the material time.'),
          _buildInfoText('16. I have received the Welcome kit containing INB Kit and ATM card/cheque book and understand that in case of any misuse/misplacement of the contents of the Kit, the Bank will not be liable for any loss/damage.'),
          _buildInfoText('17. I hereby certify that the Savings Bank Account would be used by me to route transactions of only non-business/non-commercial nature. In the event of occurrence of such transactions or any such transactions that may be construed as commercial business/dubious or undesirable, the Bank reserves the right to unilaterally freeze operations in such accounts and/or close the account.'),
          _buildInfoText('18. I have been advised of Average Monthly Balance (AMB) requirement for the account to be opened and given to understand that these requirements are subject to revision/changes and such revision/changes will be uploaded in the Bank\'s site which will be acceptable to me as a notice to that effect.'),
          _buildInfoText('19. I confirm that the product features of BSBD account have been explained to me (applicable to BSBD account applicant)'),
          _buildInfoText('20. I acknowledge receipt of rules and regulations of Savings Bank Account.'),
          _buildInfoText('21. I have been advised that if I do not provide my mobile number, I will not be eligible for any facility of electronic transactions other than ATM cash withdrawals.'),
          _buildInfoText('22. (Applicable for accounts opened for credit / social Welfare Benefits.)'),
          _buildInfoText('I understand that this account will be opened under BSBD category. I also understand that in case, I do not wish to continue in this BSBD account, and switch over to Regular Savings Bank account, I will have to maintain the Average Monthly Balance (AMB) applicable for Regular Savings Bank Account. I therefore undertake to maintain AMB in the account if I switch over to Regular Savings Bank Account from BSBD.'),
          _buildInfoText('23. (Applicable for accounts opened in the name of Minors)'),
          _buildInfoText('I understand that the requirements of Average Quarterly Balance (AQB) and penalty for non-maintenance will be applicable in this account once the applicant becomes Major. I therefore undertake to maintain Average Monthly Balance (AQB) from the date of attaining majority.'),
          _buildInfoText('24. I hereby declare that the details furnished above are true and correct to the best of my knowledge and belief and I undertake to inform you of any changes therein, immediately. In case any of the above information is found to be false or untrue or misleading or misrepresenting, I am aware that I may be held liable for it.'),
          _buildInfoText('25. I/We confirm that the product features of account have been explained to me'),
          _buildInfoText('26. I/We hereby give consent for debiting my/our account for recovering service charges as normally applicable to Saving Bank and Current Account.'),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: const Center(child: Text('Signature / Thumb Impression of Applicant(s)')),
                    ),
                    _buildTextField(controller: _applicantSignatureController, labelText: 'Signature / Thumb Impression of Applicant(s)'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Helper Widgets (Copied from previous pages for self-containment)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue[900],
        ),
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool readOnly = false,
    VoidCallback? onTap,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.blue[600]!, width: 2.0),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
      ),
    );
  }

  Widget _buildCheckbox(String title, bool value, ValueChanged<bool?> onChanged) {
    return SizedBox(
      width: 180, // Approximate width for checkbox and text
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue[700],
          ),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowOfCheckboxes(String title, List<Widget> checkboxes) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Wrap(
            spacing: 0.0,
            runSpacing: 0.0,
            children: checkboxes,
          ),
        ],
      ),
    );
  }

  Widget _buildRadioGroup(String title, List<String> options, String? selectedOption, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          Wrap(
            spacing: 0.0,
            runSpacing: 0.0,
            children: options.map((option) {
              return SizedBox(
                width: 200, // Approximate width for radio and text
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<String>(
                      value: option,
                      groupValue: selectedOption,
                      onChanged: onChanged,
                      activeColor: Colors.blue[700],
                    ),
                    Flexible(
                      child: Text(
                        option,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String title, List<String> options, String? selectedOption, ValueChanged<String?> onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 120, // Adjust width as needed for the title
          child: Text(
            title,
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ...options.map((option) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<String>(
                value: option,
                groupValue: selectedOption,
                onChanged: onChanged,
                activeColor: Colors.blue[700],
              ),
              Text(
                option,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildRowOfRadioButtons(String title, List<Widget> radioOptionWidgets) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          Wrap(
            spacing: 0.0,
            runSpacing: 0.0,
            children: radioOptionWidgets,
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxGroup(
      String title, Map<String, bool> options, Set<String> selectedOptions,
      void Function(String, bool?) onChanged, {bool isSingleSelection = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          Wrap(
            spacing: 0.0,
            runSpacing: 0.0,
            children: options.keys.map((option) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20, // Example: roughly half screen width minus padding
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: selectedOptions.contains(option),
                      onChanged: (bool? value) {
                        if (isSingleSelection && value == true) {
                          setState(() {
                            selectedOptions.clear(); // Clear all other selections
                            selectedOptions.add(option);
                          });
                        } else {
                          onChanged(option, value);
                        }
                      },
                      activeColor: Colors.blue[700],
                    ),
                    Flexible(
                      child: Text(
                        option,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
