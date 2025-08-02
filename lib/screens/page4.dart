import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Page4Form extends StatefulWidget {
  const Page4Form({super.key});

  @override
  State<Page4Form> createState() => _Page4FormState();
}

class _Page4FormState extends State<Page4Form> {
  // Section 7: Nomination (FORM DA-1)
  final TextEditingController _nominationRegistrationNoController = TextEditingController();
  final TextEditingController _nominationNameController = TextEditingController(text: 'ARUNKUMAR');
  final TextEditingController _nominationBranchAddressController = TextEditingController();
  bool _nomineeNameOnPassbook = true;
  final TextEditingController _depositTypeController = TextEditingController();
  final TextEditingController _nominationAccountNumberController = TextEditingController();
  final TextEditingController _nomineeNameController = TextEditingController(text: 'KANAGARAJ');
  final TextEditingController _nomineeMobileNoController = TextEditingController(text: '9999999999');
  final TextEditingController _nomineeRelationshipController = TextEditingController(text: 'FATHER');
  final TextEditingController _nomineeAgeController = TextEditingController();
  final TextEditingController _nomineeDobController = TextEditingController(text: '01052000');
  final TextEditingController _minorAppointShriSmtKumController = TextEditingController();
  final TextEditingController _minorNomineeAgeController = TextEditingController();
  final TextEditingController _minorNomineeYearsController = TextEditingController();
  final TextEditingController _minorNomineeAddressController = TextEditingController();
  final TextEditingController _applicantSignature1Controller = TextEditingController();
  final TextEditingController _applicantSignature2Controller = TextEditingController();
  final TextEditingController _applicantSignature3Controller = TextEditingController();
  final TextEditingController _witness1NameController = TextEditingController();
  final TextEditingController _witness1AddressController = TextEditingController();
  final TextEditingController _witness1SignatureController = TextEditingController();
  final TextEditingController _witness2NameController = TextEditingController();
  final TextEditingController _witness2AddressController = TextEditingController();
  final TextEditingController _witness2SignatureController = TextEditingController();
  bool _doNotNominate = false;
  final TextEditingController _nonNominationDateController = TextEditingController();
  final TextEditingController _nonNominationPlaceController = TextEditingController();
  final TextEditingController _nonNominationApplicantSignature1Controller = TextEditingController();
  final TextEditingController _nonNominationApplicantSignature2Controller = TextEditingController();

  // Section 8: DECLARATION CUM UNDERTAKING CUM SELF-CERTIFICATION
  final TextEditingController _declarationMinorDobController = TextEditingController();
  final TextEditingController _declarationMinorGuardianNameController = TextEditingController();
  final TextEditingController _declarationPlaceController = TextEditingController(text: 'GANAPATHYPALAYAM');
  final TextEditingController _declarationDateController = TextEditingController(text: DateFormat('04022001').format(DateTime.now())); // Placeholder date
  final TextEditingController _declarationApplicantSignature1Controller = TextEditingController();
  final TextEditingController _declarationApplicantSignature2Controller = TextEditingController();

  // FOR OFFICE USE/ATTESTATION
  final TextEditingController _officeUseOpenAccountDateController = TextEditingController();
  final TextEditingController _officeUseAuthorisedSignatoryController = TextEditingController();
  final TextEditingController _officeUseInbKitNoController = TextEditingController();
  String? _officeUseTransactionRightsOption = ''; // Yes/No
  final TextEditingController _officeUseTransactionRightsGivenOnController = TextEditingController();
  final TextEditingController _officeUseInbViewingRightsController = TextEditingController();
  final TextEditingController _officeUseAtmCardDataTransmittedOnController = TextEditingController();
  final TextEditingController _officeUseNominationSerialNoController = TextEditingController();
  final TextEditingController _officeUseThresholdKycLimitController = TextEditingController();
  String? _officeUsePhoneBankingRiskCategory = 'Low Risk Category'; // Default as per image
  final TextEditingController _officeUseAccountQueueNoController = TextEditingController();
  final TextEditingController _officeUseAccountInitialsController = TextEditingController();
  final TextEditingController _officeUseCifLinkingQueueNoController = TextEditingController();
  final TextEditingController _officeUseCifLinkingInitialsController = TextEditingController();
  final TextEditingController _officeUsePersonalisedChequeQueueNoController = TextEditingController();
  final TextEditingController _officeUsePersonalisedChequeInitialsController = TextEditingController();
  final TextEditingController _officeUseRinbQueueNoController = TextEditingController();
  final TextEditingController _officeUseRinbInitialsController = TextEditingController();
  final TextEditingController _officeUseMbsQueueNoController = TextEditingController();
  final TextEditingController _officeUseMbsInitialsController = TextEditingController();
  final TextEditingController _officeUseSmsAlertQueueNoController = TextEditingController();
  final TextEditingController _officeUseSmsAlertInitialsController = TextEditingController();
  final TextEditingController _officeUseRemovalOfPostingQueueNoController = TextEditingController();
  final TextEditingController _officeUseRemovalOfPostingInitialsController = TextEditingController();
  final TextEditingController _officeUseScanningQueueNoController = TextEditingController();
  final TextEditingController _officeUseScanningInitialsController = TextEditingController();
  final TextEditingController _kycDueDiligenceSignatureController = TextEditingController();
  final TextEditingController _kycDueDiligencePfStaffController = TextEditingController();
  final TextEditingController _accountApprovedBySignatureController = TextEditingController();
  final TextEditingController _accountApprovedByPfStaffController = TextEditingController();


  @override
  void dispose() {
    _nominationRegistrationNoController.dispose();
    _nominationNameController.dispose();
    _nominationBranchAddressController.dispose();
    _depositTypeController.dispose();
    _nominationAccountNumberController.dispose();
    _nomineeNameController.dispose();
    _nomineeMobileNoController.dispose();
    _nomineeRelationshipController.dispose();
    _nomineeAgeController.dispose();
    _nomineeDobController.dispose();
    _minorAppointShriSmtKumController.dispose();
    _minorNomineeAgeController.dispose();
    _minorNomineeYearsController.dispose();
    _minorNomineeAddressController.dispose();
    _applicantSignature1Controller.dispose();
    _applicantSignature2Controller.dispose();
    _applicantSignature3Controller.dispose();
    _witness1NameController.dispose();
    _witness1AddressController.dispose();
    _witness1SignatureController.dispose();
    _witness2NameController.dispose();
    _witness2AddressController.dispose();
    _witness2SignatureController.dispose();
    _nonNominationDateController.dispose();
    _nonNominationPlaceController.dispose();
    _nonNominationApplicantSignature1Controller.dispose();
    _nonNominationApplicantSignature2Controller.dispose();
    _declarationMinorDobController.dispose();
    _declarationMinorGuardianNameController.dispose();
    _declarationPlaceController.dispose();
    _declarationDateController.dispose();
    _declarationApplicantSignature1Controller.dispose();
    _declarationApplicantSignature2Controller.dispose();
    _officeUseOpenAccountDateController.dispose();
    _officeUseAuthorisedSignatoryController.dispose();
    _officeUseInbKitNoController.dispose();
    _officeUseTransactionRightsGivenOnController.dispose();
    _officeUseInbViewingRightsController.dispose();
    _officeUseAtmCardDataTransmittedOnController.dispose();
    _officeUseNominationSerialNoController.dispose();
    _officeUseThresholdKycLimitController.dispose();
    _officeUseAccountQueueNoController.dispose();
    _officeUseAccountInitialsController.dispose();
    _officeUseCifLinkingQueueNoController.dispose();
    _officeUseCifLinkingInitialsController.dispose();
    _officeUsePersonalisedChequeQueueNoController.dispose();
    _officeUsePersonalisedChequeInitialsController.dispose();
    _officeUseRinbQueueNoController.dispose();
    _officeUseRinbInitialsController.dispose();
    _officeUseMbsQueueNoController.dispose();
    _officeUseMbsInitialsController.dispose();
    _officeUseSmsAlertQueueNoController.dispose();
    _officeUseSmsAlertInitialsController.dispose();
    _officeUseRemovalOfPostingQueueNoController.dispose();
    _officeUseRemovalOfPostingInitialsController.dispose();
    _officeUseScanningQueueNoController.dispose();
    _officeUseScanningInitialsController.dispose();
    _kycDueDiligenceSignatureController.dispose();
    _kycDueDiligencePfStaffController.dispose();
    _accountApprovedBySignatureController.dispose();
    _accountApprovedByPfStaffController.dispose();
    super.dispose();
  }

  // Helper function to pick date
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('ddMMyyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('7 Nomination (If required fill Form DA-1)'),
          _buildInfoText('FORM DA-1 (Nomination Form)'),
          _buildTextField(controller: _nominationRegistrationNoController, labelText: 'Registration No.'),
          _buildInfoText('Nomination under section 45ZA of the Banking Regulation Act, 1949 and Rules 1985 in respect of Bank Deposits.'),
          _buildInfoText('I/We _________ nominate the following person to whom in the event of my/minor\'s death the amount of this deposit, particulars of which are given below, may be returned by the Bank of India, _________ (name and address of the Branch / Office in which the deposit is held)'),
          _buildTextField(controller: _nominationNameController, labelText: 'I/We'),
          _buildTextField(controller: _nominationBranchAddressController, labelText: 'Branch / Office Name and Address'),
          _buildCheckbox('I/We want the name of the nominee to be printed on the passbook', _nomineeNameOnPassbook, (bool? value) {
            setState(() {
              _nomineeNameOnPassbook = value!;
            });
          }),
          _buildSectionTitle('Details of Deposit'),
          _buildTextField(controller: _depositTypeController, labelText: 'Type of Deposit:'),
          _buildTextField(controller: _nominationAccountNumberController, labelText: 'Account Number:'),
          _buildSectionTitle('Details of Nominee'),
          _buildTextField(controller: _nomineeNameController, labelText: 'Name:'),
          _buildTextField(controller: _nomineeMobileNoController, labelText: 'Mobile Number of the Nominee'),
          _buildTextField(controller: _nomineeRelationshipController, labelText: 'Relationship with the depositor:'),
          _buildTextField(controller: _nomineeAgeController, labelText: 'Age: _____ Years'),
          _buildTextField(
            controller: _nomineeDobController,
            labelText: 'Date of Birth of nominee (in case of minor)',
            readOnly: true,
            onTap: () => _selectDate(context, _nomineeDobController),
          ),
          _buildInfoText('As the nominee is a minor on this date, I appoint Shri/Smt/Kum _________ Age _________ Years Address _________ to receive the amount of deposit on behalf of the nominee in the event of my/minor\'s death during the minority of the nominee'),
          _buildTextField(controller: _minorAppointShriSmtKumController, labelText: 'Appoint Shri/Smt/Kum'),
          _buildTextField(controller: _minorNomineeAgeController, labelText: 'Minor Nominee Age'),
          _buildTextField(controller: _minorNomineeYearsController, labelText: 'Minor Nominee Years'),
          _buildTextField(controller: _minorNomineeAddressController, labelText: 'Minor Nominee Address'),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: const Center(child: Text('(Signature of the Applicants/Thumb impression of the Applicants)')),
                    ),
                    _buildTextField(controller: _applicantSignature1Controller, labelText: 'Signature of the Applicant 1'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: const Center(child: Text('(Signature of the Applicants/Thumb impression of the Applicants)')),
                    ),
                    _buildTextField(controller: _applicantSignature2Controller, labelText: 'Signature of the Applicant 2'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: const Center(child: Text('(Signature of the Applicants/Thumb impression of the Applicants)')),
                    ),
                    _buildTextField(controller: _applicantSignature3Controller, labelText: 'Signature of the Applicant 3'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildInfoText('(Witness are required only in case of applicant is illiterate and if affixing thumb impression)'),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(controller: _witness1SignatureController, labelText: 'Signature of the first witness'),
                    _buildTextField(controller: _witness1NameController, labelText: 'Name'),
                    _buildTextField(controller: _witness1AddressController, labelText: 'Address'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(controller: _witness2SignatureController, labelText: 'Signature of the second witness'),
                    _buildTextField(controller: _witness2NameController, labelText: 'Name'),
                    _buildTextField(controller: _witness2AddressController, labelText: 'Address'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildCheckbox('I/We do not want to nominate any person in this account', _doNotNominate, (bool? value) {
            setState(() {
              _doNotNominate = value!;
            });
          }),
          if (_doNotNominate)
            Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _buildTextField(controller: _nonNominationDateController, labelText: 'Date')),
                    const SizedBox(width: 10),
                    Expanded(child: _buildTextField(controller: _nonNominationPlaceController, labelText: 'Place')),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                            child: const Center(child: Text('(Signature of the Applicants)')),
                          ),
                          _buildTextField(controller: _nonNominationApplicantSignature1Controller, labelText: 'Applicant Signature 1'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                            child: const Center(child: Text('(Signature of the Applicants)')),
                          ),
                          _buildTextField(controller: _nonNominationApplicantSignature2Controller, labelText: 'Applicant Signature 2'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 20),

          // Section 8: DECLARATION CUM UNDERTAKING CUM SELF-CERTIFICATION
          _buildSectionTitle('8 DECLARATION CUM UNDERTAKING CUM SELF-CERTIFICATION'),
          _buildInfoText('1. I/We have read the copy of Terms and Conditions of the Account Opening given to me/us. The Terms and Conditions have been explained to me/us and having understood, I/we accept the same.'),
          _buildInfoText('2. (In case of Minor Accounts:)'),
          _buildInfoText('I hereby declare that date of birth of the minor who is my _________ is _________ and I am his/her natural and lawful guardian/guardian appointed by court order dated _________ (copy enclosed) I shall represent the said minor in all future transactions of any description in the above account until the said minor attains majority. I indemnify the bank against the claim of the above minor for any withdrawal/transactions made by me in his/her account.'),
          _buildTextField(controller: _declarationMinorDobController, labelText: 'Minor DOB'),
          _buildTextField(controller: _declarationMinorGuardianNameController, labelText: 'Minor Guardian Name'),
          _buildInfoText('3. (Applicable in case of Term Deposit Accounts (Strike out if not required))'),
          _buildInfoText('I/We undertake that in case of term deposits with operating instructions "Either or Survivor", or "Former or Survivor" in line with the operating instructions of the application-cum-deposit slip, premature termination / payment will be allowed to the survivor in event of the death of the either of the depositors or former as the case may be on submission of the death certificate of the deceased depositors along with application without obtaining consent of the legal heirs of the deceased depositors.'),
          _buildInfoText('4. I/ We hereby declare that I do not maintain a Basic Savings Bank Deposit Account (BSBDA) with any other Bank (Applicable in case of BSBD Account)'),
          _buildInfoText('5. I/ We hereby declare that the details above in this form including details in Annexure II and Annexure II are true and correct to the best of my / our knowledge and belief. I further, declare to inform you of any changes therein, immediately. In case of any of the above information is found to be false or untrue or misleading or misrepresenting, I / We am / are aware that I / We may be held liable for it. I / We agree to be bound by the terms and conditions. Instructions, etc. as outlined for FATCA / CRS, rules of Bank of India and the RBI and subsequent amendment(s). My / Our personal / KYC details may be shared with Central KYC registry.'),
          _buildInfoText('6. I / We hereby consent to receiving information from Central KYC registry through SMS / Email address.'),
          _buildTextField(controller: _declarationPlaceController, labelText: 'Place'),
          _buildTextField(
            controller: _declarationDateController,
            labelText: 'Date',
            readOnly: true,
            onTap: () => _selectDate(context, _declarationDateController),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: const Center(child: Text('(Signature of the Applicants/Thumb impression of the Applicants)')),
                    ),
                    _buildTextField(controller: _declarationApplicantSignature1Controller, labelText: 'Applicant Signature 1'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: const Center(child: Text('(Signature of the Applicants/Thumb impression of the Applicants)')),
                    ),
                    _buildTextField(controller: _declarationApplicantSignature2Controller, labelText: 'Applicant Signature 2'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // FOR OFFICE USE/ATTESTATION
          _buildSectionTitle('FOR OFFICE USE/ATTESTATION'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _officeUseOpenAccountDateController, labelText: 'Open Account Date')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _officeUseAuthorisedSignatoryController, labelText: 'Authorised signatory')),
            ],
          ),
          const SizedBox(height: 20),
          _buildInfoText('i) Internet Banking (INB) Kit No.'),
          _buildTextField(controller: _officeUseInbKitNoController, labelText: 'INB Kit No.'),
          _buildRowOfRadioButtons(
            'Transaction rights',
            [
              _buildRadioOption('given on', ['Yes', 'No'], _officeUseTransactionRightsOption, (value) {
                setState(() { _officeUseTransactionRightsOption = value; });
              }),
            ],
          ),
          _buildTextField(controller: _officeUseTransactionRightsGivenOnController, labelText: 'Given On'),
          _buildInfoText('ii) INB Viewing rights'),
          _buildTextField(controller: _officeUseInbViewingRightsController, labelText: 'INB Viewing Rights'),
          _buildInfoText('iii) ATM Card data transmitted on'),
          _buildTextField(controller: _officeUseAtmCardDataTransmittedOnController, labelText: 'ATM Card Data Transmitted On'),
          _buildInfoText('iv) Nomination Serial No.'),
          _buildTextField(controller: _officeUseNominationSerialNoController, labelText: 'Nomination Serial No.'),
          _buildInfoText('v) Threshold (KYC) limit'),
          _buildTextField(controller: _officeUseThresholdKycLimitController, labelText: 'Threshold (KYC) Limit'),
          _buildInfoText('vi) Phone Banking:'),
          _buildRadioGroup(
            'Risk Category',
            ['Low Risk Category', 'Medium Risk', 'High Risk'],
            _officeUsePhoneBankingRiskCategory,
                (String? value) {
              setState(() {
                _officeUsePhoneBankingRiskCategory = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoText('Account'),
                    _buildTextField(controller: _officeUseAccountQueueNoController, labelText: 'Queue No'),
                    _buildTextField(controller: _officeUseAccountInitialsController, labelText: 'Initials'),
                    _buildInfoText('CIF Linking'),
                    _buildTextField(controller: _officeUseCifLinkingQueueNoController, labelText: 'Queue No'),
                    _buildTextField(controller: _officeUseCifLinkingInitialsController, labelText: 'Initials'),
                    _buildInfoText('Personalised Cheque'),
                    _buildTextField(controller: _officeUsePersonalisedChequeQueueNoController, labelText: 'Queue No'),
                    _buildTextField(controller: _officeUsePersonalisedChequeInitialsController, labelText: 'Initials'),
                    _buildInfoText('RINB'),
                    _buildTextField(controller: _officeUseRinbQueueNoController, labelText: 'Queue No'),
                    _buildTextField(controller: _officeUseRinbInitialsController, labelText: 'Initials'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoText('MBS'),
                    _buildTextField(controller: _officeUseMbsQueueNoController, labelText: 'Queue No'),
                    _buildTextField(controller: _officeUseMbsInitialsController, labelText: 'Initials'),
                    _buildInfoText('SMS Alert'),
                    _buildTextField(controller: _officeUseSmsAlertQueueNoController, labelText: 'Queue No'),
                    _buildTextField(controller: _officeUseSmsAlertInitialsController, labelText: 'Initials'),
                    _buildInfoText('Removal of Posting'),
                    _buildTextField(controller: _officeUseRemovalOfPostingQueueNoController, labelText: 'Queue No'),
                    _buildTextField(controller: _officeUseRemovalOfPostingInitialsController, labelText: 'Initials'),
                    _buildInfoText('Scanning'),
                    _buildTextField(controller: _officeUseScanningQueueNoController, labelText: 'Queue No'),
                    _buildTextField(controller: _officeUseScanningInitialsController, labelText: 'Initials'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildInfoText('KYC Including Due Diligence carried out & Account opened by'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _kycDueDiligenceSignatureController, labelText: 'Signature')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _kycDueDiligencePfStaffController, labelText: 'PF of Staff')),
            ],
          ),
          const SizedBox(height: 20),
          _buildInfoText('Account Approved by'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _accountApprovedBySignatureController, labelText: 'Signature')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _accountApprovedByPfStaffController, labelText: 'PF of Staff')),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Helper Widgets (Copied from page1.dart/page2.dart to make page4.dart self-contained for now)
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
