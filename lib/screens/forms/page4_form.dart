// lib/screens/forms/page4_form.dart

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../model/form_data_model.dart';
import 'form_helper.dart';

class Page4Form extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page4Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page4Form> createState() => _Page4FormState();
}

class _Page4FormState extends State<Page4Form> {
  // Controllers
  late TextEditingController _registrationNoController;
  late TextEditingController _depositTypeController;
  late TextEditingController _accountNumberController;
  late TextEditingController _nomineeNameController;
  late TextEditingController _nomineeMobileController;
  late TextEditingController _nomineeRelationshipController;
  late TextEditingController _nomineeAgeController;
  late TextEditingController _nomineeDobController;
  late TextEditingController _guardianNameController;
  late TextEditingController _guardianAgeController;
  late TextEditingController _nomineeAddressController;
  late TextEditingController _witness1NameController;
  late TextEditingController _witness1AddressController;
  late TextEditingController _witness2NameController;
  late TextEditingController _witness2AddressController;
  late TextEditingController _witnessDateController;
  late TextEditingController _witnessPlaceController;

  // Section 8 Declaration Controllers
  late TextEditingController _minorDobController;
  late TextEditingController _guardianOrderDateController;
  late TextEditingController _declarationPlaceController;
  late TextEditingController _declarationDateController;

  // Office Use/Attestation Controllers
  late TextEditingController _officeOpenAccountDateController;
  late TextEditingController _officeInbKitNoController;
  late TextEditingController _officeInbViewingRightsDateController;
  late TextEditingController _officeInbTransactionRightsDateController;
  late TextEditingController _officeAtmCardDataController;
  late TextEditingController _officeNominationSerialNoController;
  late TextEditingController _officeThresholdKycController;
  late TextEditingController _officePhoneBankingController;
  late TextEditingController _officeAccountTransactionNoController;
  late TextEditingController _officeAccountInitialsController;
  late TextEditingController _officeCifLinkingTransactionNoController;
  late TextEditingController _officeCifLinkingInitialsController;
  late TextEditingController _officePersonalisedChequeTransactionNoController;
  late TextEditingController _officePersonalisedChequeInitialsController;
  late TextEditingController _officeRinbTransactionNoController;
  late TextEditingController _officeRinbInitialsController;
  late TextEditingController _officeMbsTransactionNoController;
  late TextEditingController _officeMbsInitialsController;
  late TextEditingController _officeSmsAlertTransactionNoController;
  late TextEditingController _officeSmsAlertInitialsController;
  late TextEditingController _officeRemovalPostingTransactionNoController;
  late TextEditingController _officeRemovalPostingInitialsController;
  late TextEditingController _officeScanningTransactionNoController;
  late TextEditingController _officeScanningInitialsController;
  late TextEditingController _officeKycAccountOpenedByController;
  late TextEditingController _officeAccountApprovedByController;

  // Checkboxes
  bool _printNomineeOnPassbook = false;
  bool _doNotWantToNominate = false;
  bool _declaration1Accepted = false;
  bool _declaration2MinorAccount = false;
  bool _declaration3TermDeposit = false;
  bool _declaration4NoBSBDA = false;
  bool _declaration5DetailsTrue = false;
  bool _declaration6ConsentKYC = false;
  bool _officeRiskLow = false;
  bool _officeRiskMedium = false;
  bool _officeRiskHigh = false;

  // Image paths for signatures
  String? _applicantSignature1Path;
  String? _applicantSignature2Path;
  String? _witness1SignaturePath;
  String? _witness2SignaturePath;
  String? _noNominationSignature1Path;
  String? _noNominationSignature2Path;
  String? _declarationSignature1Path;
  String? _declarationSignature2Path;
  String? _officeAuthorisedSignaturePath;
  String? _officeKycStaffSignaturePath;
  String? _officeApprovalStaffSignaturePath;

  @override
  void initState() {
    super.initState();
    _registrationNoController = TextEditingController();
    _depositTypeController = TextEditingController();
    _accountNumberController = TextEditingController();
    _nomineeNameController = TextEditingController(
      text: widget.initialData.nomineeName,
    );
    _nomineeMobileController = TextEditingController(
      text: widget.initialData.nomineeMobile,
    );
    _nomineeRelationshipController = TextEditingController(
      text: widget.initialData.nomineeRelationship,
    );
    _nomineeAgeController = TextEditingController();
    _nomineeDobController = TextEditingController(
      text: widget.initialData.nomineeDob,
    );
    _guardianNameController = TextEditingController(
      text: widget.initialData.nomineeGuardianName,
    );
    _guardianAgeController = TextEditingController();
    _nomineeAddressController = TextEditingController(
      text: widget.initialData.nomineeAddress,
    );
    _witness1NameController = TextEditingController(
      text: widget.initialData.witness1Name,
    );
    _witness1AddressController = TextEditingController(
      text: widget.initialData.witness1Address,
    );
    _witness2NameController = TextEditingController(
      text: widget.initialData.witness2Name,
    );
    _witness2AddressController = TextEditingController(
      text: widget.initialData.witness2Address,
    );
    _witnessDateController = TextEditingController();
    _witnessPlaceController = TextEditingController();
    _minorDobController = TextEditingController();
    _guardianOrderDateController = TextEditingController();
    _declarationPlaceController = TextEditingController();
    _declarationDateController = TextEditingController();
    _officeOpenAccountDateController = TextEditingController();
    _officeInbKitNoController = TextEditingController();
    _officeInbViewingRightsDateController = TextEditingController();
    _officeInbTransactionRightsDateController = TextEditingController();
    _officeAtmCardDataController = TextEditingController();
    _officeNominationSerialNoController = TextEditingController();
    _officeThresholdKycController = TextEditingController();
    _officePhoneBankingController = TextEditingController();
    _officeAccountTransactionNoController = TextEditingController();
    _officeAccountInitialsController = TextEditingController();
    _officeCifLinkingTransactionNoController = TextEditingController();
    _officeCifLinkingInitialsController = TextEditingController();
    _officePersonalisedChequeTransactionNoController = TextEditingController();
    _officePersonalisedChequeInitialsController = TextEditingController();
    _officeRinbTransactionNoController = TextEditingController();
    _officeRinbInitialsController = TextEditingController();
    _officeMbsTransactionNoController = TextEditingController();
    _officeMbsInitialsController = TextEditingController();
    _officeSmsAlertTransactionNoController = TextEditingController();
    _officeSmsAlertInitialsController = TextEditingController();
    _officeRemovalPostingTransactionNoController = TextEditingController();
    _officeRemovalPostingInitialsController = TextEditingController();
    _officeScanningTransactionNoController = TextEditingController();
    _officeScanningInitialsController = TextEditingController();
    _officeKycAccountOpenedByController = TextEditingController();
    _officeAccountApprovedByController = TextEditingController();

    FormHelper.addListeners([
      _registrationNoController,
      _depositTypeController,
      _accountNumberController,
      _nomineeNameController,
      _nomineeMobileController,
      _nomineeRelationshipController,
      _nomineeAgeController,
      _nomineeDobController,
      _guardianNameController,
      _guardianAgeController,
      _nomineeAddressController,
      _witness1NameController,
      _witness1AddressController,
      _witness2NameController,
      _witness2AddressController,
      _witnessDateController,
      _witnessPlaceController,
      _minorDobController,
      _guardianOrderDateController,
      _declarationPlaceController,
      _declarationDateController,
      _officeOpenAccountDateController,
      _officeInbKitNoController,
      _officeInbViewingRightsDateController,
      _officeInbTransactionRightsDateController,
      _officeAtmCardDataController,
      _officeNominationSerialNoController,
      _officeThresholdKycController,
      _officePhoneBankingController,
      _officeAccountTransactionNoController,
      _officeAccountInitialsController,
      _officeCifLinkingTransactionNoController,
      _officeCifLinkingInitialsController,
      _officePersonalisedChequeTransactionNoController,
      _officePersonalisedChequeInitialsController,
      _officeRinbTransactionNoController,
      _officeRinbInitialsController,
      _officeMbsTransactionNoController,
      _officeMbsInitialsController,
      _officeSmsAlertTransactionNoController,
      _officeSmsAlertInitialsController,
      _officeRemovalPostingTransactionNoController,
      _officeRemovalPostingInitialsController,
      _officeScanningTransactionNoController,
      _officeScanningInitialsController,
      _officeKycAccountOpenedByController,
      _officeAccountApprovedByController,
    ], _notifyChange);
  }

  void _notifyChange() {
    widget.onDataChanged(_buildUpdatedData());
  }

  Future<void> _pickImage(Function(String?) setPath) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        setPath(image.path);
        _notifyChange();
      });
    }
  }

  FormDataModel _buildUpdatedData() {
    return FormDataModel(
      branchName: widget.initialData.branchName,
      branchCode: widget.initialData.branchCode,
      date: widget.initialData.date,
      customerId: widget.initialData.customerId,
      accountNo: widget.initialData.accountNo,
      ckycNo: widget.initialData.ckycNo,
      existingCustomerId: widget.initialData.existingCustomerId,
      customerFirstName: widget.initialData.customerFirstName,
      customerMiddleName: widget.initialData.customerMiddleName,
      customerLastName: widget.initialData.customerLastName,
      customerPrefix: widget.initialData.customerPrefix,
      maidenName: widget.initialData.maidenName,
      maidenNamePrefix: widget.initialData.maidenNamePrefix,
      fatherName: widget.initialData.fatherName,
      motherName: widget.initialData.motherName,
      spouseName: widget.initialData.spouseName,
      mobileNo: widget.initialData.mobileNo,
      emailId: widget.initialData.emailId,
      alternateMobileNo: widget.initialData.alternateMobileNo,
      telOff: widget.initialData.telOff,
      telRes: widget.initialData.telRes,
      aadharDocNo: widget.initialData.aadharDocNo,
      currentAddress: widget.initialData.currentAddress,
      currentCity: widget.initialData.currentCity,
      currentDistrict: widget.initialData.currentDistrict,
      currentState: widget.initialData.currentState,
      currentPin: widget.initialData.currentPin,
      dob: widget.initialData.dob,
      occupationType: widget.initialData.occupationType,
      monthlyIncome: widget.initialData.monthlyIncome,
      netWorth: widget.initialData.netWorth,
      estAnnualTurnover: widget.initialData.estAnnualTurnover,
      noOfDependents: widget.initialData.noOfDependents,
      guardianPrefix: widget.initialData.guardianPrefix,
      guardianName: widget.initialData.guardianName,
      guardianMiddleName: widget.initialData.guardianMiddleName,
      guardianSurname: widget.initialData.guardianSurname,
      relationshipWithGuardian: widget.initialData.relationshipWithGuardian,
      placeCityOfBirth: widget.initialData.placeCityOfBirth,
      countryCodeOfBirth: widget.initialData.countryCodeOfBirth,
      citizenship: widget.initialData.citizenship,
      panTaxIdNumber: widget.initialData.panTaxIdNumber,
      alternateCountry: widget.initialData.alternateCountry,
      stdCode: widget.initialData.stdCode,
      landlineNo: widget.initialData.landlineNo,
      alternateStdCode: widget.initialData.alternateStdCode,
      alternateLandlineNo: widget.initialData.alternateLandlineNo,
      documentNo: widget.initialData.documentNo,
      issueDate: widget.initialData.issueDate,
      expiryDate: widget.initialData.expiryDate,
      correspondenceAddress: widget.initialData.correspondenceAddress,
      correspondenceCity: widget.initialData.correspondenceCity,
      correspondenceDistrict: widget.initialData.correspondenceDistrict,
      correspondenceState: widget.initialData.correspondenceState,
      correspondencePin: widget.initialData.correspondencePin,
      ovdDocumentNo: widget.initialData.ovdDocumentNo,
      ovdDocumentDate: widget.initialData.ovdDocumentDate,
      applicantSignatureName: widget.initialData.applicantSignatureName,
      declarationPlace: widget.initialData.declarationPlace,
      declarationDate: widget.initialData.declarationDate,
      officialName: widget.initialData.officialName,
      pfNo: widget.initialData.pfNo,
      designation: widget.initialData.designation,
      ssNo: widget.initialData.ssNo,
      officeUseDate: widget.initialData.officeUseDate,
      firstApplicantCustomerId: widget.initialData.firstApplicantCustomerId,
      secondApplicantCustomerId: widget.initialData.secondApplicantCustomerId,
      atmCardName: widget.initialData.atmCardName,
      fdAmount: widget.initialData.fdAmount,
      rdInstallment: widget.initialData.rdInstallment,
      debitAccountNo: widget.initialData.debitAccountNo,
      modeOfOperationOther: widget.initialData.modeOfOperationOther,
      nominationRegistrationNo: widget.initialData.nominationRegistrationNo,
      depositType: widget.initialData.depositType,
      nominationAccountNo: widget.initialData.nominationAccountNo,
      nomineeName: _nomineeNameController.text,
      nomineeMobile: _nomineeMobileController.text,
      nomineeRelationship: _nomineeRelationshipController.text,
      nomineeDob: _nomineeDobController.text,
      nomineeAddress: _nomineeAddressController.text,
      nomineeGuardianName: _guardianNameController.text,
      witness1Name: _witness1NameController.text,
      witness1Address: _witness1AddressController.text,
      witness2Name: _witness2NameController.text,
      witness2Address: _witness2AddressController.text,
      form60FirstName: widget.initialData.form60FirstName,
      form60MiddleName: widget.initialData.form60MiddleName,
      form60Surname: widget.initialData.form60Surname,
      form60DateOfBirth: widget.initialData.form60DateOfBirth,
      form60FatherName: widget.initialData.form60FatherName,
      form60FlatNo: widget.initialData.form60FlatNo,
      form60PremisesName: widget.initialData.form60PremisesName,
      form60RoadStreet: widget.initialData.form60RoadStreet,
      form60AreaLocality: widget.initialData.form60AreaLocality,
      form60TownDistrictState: widget.initialData.form60TownDistrictState,
      form60PinCode: widget.initialData.form60PinCode,
      form60TelephoneSTD: widget.initialData.form60TelephoneSTD,
      form60MobileNumber: widget.initialData.form60MobileNumber,
      form60TransactionAmount: widget.initialData.form60TransactionAmount,
      form60TransactionDate: widget.initialData.form60TransactionDate,
      form60JointPersonsCount: widget.initialData.form60JointPersonsCount,
      form60ModeCash: widget.initialData.form60ModeCash,
      form60ModeCheque: widget.initialData.form60ModeCheque,
      form60ModeCard: widget.initialData.form60ModeCard,
      form60ModeDraft: widget.initialData.form60ModeDraft,
      form60ModeOnlineTransfer: widget.initialData.form60ModeOnlineTransfer,
      form60ModeOther: widget.initialData.form60ModeOther,
      form60AadhaarNumber: widget.initialData.form60AadhaarNumber,
      // Row 17-18 fields
      form60PanApplicationDate: widget.initialData.form60PanApplicationDate,
      form60PanAckNo: widget.initialData.form60PanAckNo,
      form60AgriculturalIncome: widget.initialData.form60AgriculturalIncome,
      form60OtherIncome: widget.initialData.form60OtherIncome,
      // Verification section fields
      form60VerifiedDay: widget.initialData.form60VerifiedDay,
      form60VerifiedMonth: widget.initialData.form60VerifiedMonth,
      form60VerifiedYear: widget.initialData.form60VerifiedYear,
      form60VerificationPlace: widget.initialData.form60VerificationPlace,
      form60DeclarantSignature: widget.initialData.form60DeclarantSignature,
      relatedPersonFirstName: widget.initialData.relatedPersonFirstName,
      relatedPersonPrefix: widget.initialData.relatedPersonPrefix,
      relatedPersonDocNo: widget.initialData.relatedPersonDocNo,
      signature1Text: widget.initialData.signature1Text,
      signature2Text: widget.initialData.signature2Text,
    );
  }

  @override
  void dispose() {
    FormHelper.disposeControllers([
      _registrationNoController,
      _depositTypeController,
      _accountNumberController,
      _nomineeNameController,
      _nomineeMobileController,
      _nomineeRelationshipController,
      _nomineeAgeController,
      _nomineeDobController,
      _guardianNameController,
      _guardianAgeController,
      _nomineeAddressController,
      _witness1NameController,
      _witness1AddressController,
      _witness2NameController,
      _witness2AddressController,
      _witnessDateController,
      _witnessPlaceController,
      _minorDobController,
      _guardianOrderDateController,
      _declarationPlaceController,
      _declarationDateController,
      _officeOpenAccountDateController,
      _officeInbKitNoController,
      _officeInbViewingRightsDateController,
      _officeInbTransactionRightsDateController,
      _officeAtmCardDataController,
      _officeNominationSerialNoController,
      _officeThresholdKycController,
      _officePhoneBankingController,
      _officeAccountTransactionNoController,
      _officeAccountInitialsController,
      _officeCifLinkingTransactionNoController,
      _officeCifLinkingInitialsController,
      _officePersonalisedChequeTransactionNoController,
      _officePersonalisedChequeInitialsController,
      _officeRinbTransactionNoController,
      _officeRinbInitialsController,
      _officeMbsTransactionNoController,
      _officeMbsInitialsController,
      _officeSmsAlertTransactionNoController,
      _officeSmsAlertInitialsController,
      _officeRemovalPostingTransactionNoController,
      _officeRemovalPostingInitialsController,
      _officeScanningTransactionNoController,
      _officeScanningInitialsController,
      _officeKycAccountOpenedByController,
      _officeAccountApprovedByController,
    ]);
    super.dispose();
  }

  Widget _buildSignatureBox(
    String label,
    String? imagePath,
    Function(String?) setPath,
  ) {
    return GestureDetector(
      onTap: () => _pickImage(setPath),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.shade50,
        ),
        child: imagePath != null
            ? Stack(
                children: [
                  Center(
                    child: Image.file(File(imagePath), fit: BoxFit.contain),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 16),
                      onPressed: () {
                        setState(() {
                          setPath(null);
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
                  Icon(Icons.gesture, color: Colors.grey.shade600),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 2),
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
              '7 Nomination (If required fill Form DA-1)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Form DA-1 Title
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'FORM DA-1 (Nomination Form)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),

          // Details of Nomination Header
          const Text(
            'Details of Nomination:',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          FormHelper.buildTextField(
            'Registration No.',
            _registrationNoController,
          ),
          const SizedBox(height: 12),

          const Text(
            'Nomination under section 45ZA of the Banking Regulation Act, 1949 and Rules 1985 in respect of Bank Deposits.',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 8),

          const Text(
            'I/We nominate the following person to whom in the event of my/minor\'s death the amount of this deposit, particulars of which are given below, may be returned by the Bank of India.',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Checkbox(
                value: _printNomineeOnPassbook,
                onChanged: (val) {
                  setState(() {
                    _printNomineeOnPassbook = val ?? false;
                    _notifyChange();
                  });
                },
              ),
              const Expanded(
                child: Text(
                  'I/We want the name of the nominee to be printed on the passbook',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Details of Deposit
          FormHelper.buildSectionTitle('Details of Deposit'),
          const SizedBox(height: 12),

          FormHelper.buildTextField('Type of Deposit:', _depositTypeController),
          const SizedBox(height: 12),

          FormHelper.buildTextField(
            'Account Number:',
            _accountNumberController,
          ),
          const SizedBox(height: 16),

          // Details of Nominee
          FormHelper.buildSectionTitle('Details of Nominee'),
          const SizedBox(height: 12),

          FormHelper.buildTextField('Name:', _nomineeNameController),
          const SizedBox(height: 12),

          FormHelper.buildTextField(
            'Mobile Number of the Nominee',
            _nomineeMobileController,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),

          FormHelper.buildTextField(
            'Relationship with the depositor',
            _nomineeRelationshipController,
          ),
          const SizedBox(height: 12),

          FormHelper.buildTextField(
            'Age (Years)',
            _nomineeAgeController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),

          FormHelper.buildTextField(
            'Date of Birth of nominee (in case of minor) DDMMYYYY',
            _nomineeDobController,
          ),
          const SizedBox(height: 12),

          const Text(
            'As the nominee is a minor on this date, I appoint:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),

          FormHelper.buildTextField(
            'Guardian Name (Shri/Smt/Kum)',
            _guardianNameController,
          ),
          const SizedBox(height: 12),

          FormHelper.buildTextField(
            'Guardian Age (Years)',
            _guardianAgeController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),

          const Text(
            'to receive the amount of deposit on behalf of the nominee in the event of my/minor\'s death during the minority of the nominee',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 12),

          FormHelper.buildTextField(
            'Nominee Address',
            _nomineeAddressController,
            maxLines: 3,
          ),
          const SizedBox(height: 16),

          // Signatures Section
          FormHelper.buildSectionTitle('Signatures'),
          const SizedBox(height: 12),

          const Text(
            'Signature of the Applicants / Thumb impression of the Applicants',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: _buildSignatureBox(
                  'Applicant 1',
                  _applicantSignature1Path,
                  (path) => _applicantSignature1Path = path,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSignatureBox(
                  'Applicant 2',
                  _applicantSignature2Path,
                  (path) => _applicantSignature2Path = path,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Witnesses Section
          FormHelper.buildSectionTitle('Signature of the witnesses'),
          const SizedBox(height: 8),
          const Text(
            '(Witnesses are required only in case of applicant is illiterate and if affixing thumb impression)',
            style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 12),

          // Witness 1
          const Text(
            'Witness 1',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField('Name:', _witness1NameController),
          const SizedBox(height: 8),
          _buildSignatureBox(
            'Signature',
            _witness1SignaturePath,
            (path) => _witness1SignaturePath = path,
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Address',
            _witness1AddressController,
            maxLines: 2,
          ),
          const SizedBox(height: 16),

          // Witness 2
          const Text(
            'Witness 2',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField('Name:', _witness2NameController),
          const SizedBox(height: 8),
          _buildSignatureBox(
            'Signature',
            _witness2SignaturePath,
            (path) => _witness2SignaturePath = path,
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Address',
            _witness2AddressController,
            maxLines: 2,
          ),
          const SizedBox(height: 16),

          FormHelper.buildTextField('Date (DDMMYYYY)', _witnessDateController),
          const SizedBox(height: 12),

          FormHelper.buildTextField('Place', _witnessPlaceController),
          const SizedBox(height: 24),

          // Do not want to nominate section
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _doNotWantToNominate,
                      onChanged: (val) {
                        setState(() {
                          _doNotWantToNominate = val ?? false;
                          _notifyChange();
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'I/We do not want to nominate any person in this account',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Signature of the Applicants / Thumb impression of the Applicants',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _buildSignatureBox(
                        'Applicant 1',
                        _noNominationSignature1Path,
                        (path) => _noNominationSignature1Path = path,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildSignatureBox(
                        'Applicant 2',
                        _noNominationSignature2Path,
                        (path) => _noNominationSignature2Path = path,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Section 8: Declaration cum Undertaking cum Self-Certification
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              '8 DECLARATION CUM UNDERTAKING CUM SELF-CERTIFICATION',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Declaration Point 1
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: _declaration1Accepted,
                onChanged: (val) {
                  setState(() {
                    _declaration1Accepted = val ?? false;
                    _notifyChange();
                  });
                },
              ),
              const Expanded(
                child: Text(
                  '1. I/We have read the copy of Terms and Conditions of the Account Opening given to me/us. The Terms and Conditions have been explained to me/us and having understood, I/we accept the same.',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Declaration Point 2 - Minor Accounts
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _declaration2MinorAccount,
                    onChanged: (val) {
                      setState(() {
                        _declaration2MinorAccount = val ?? false;
                        _notifyChange();
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      '2. (In case of Minor Accounts)',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 48.0),
                child: Text(
                  'I hereby declare that date of birth of the minor who is my ........................... is .................................and I am his/her natural and lawful guardian/guardian appointed by court order dated.............................(copy enclosed) I shall represent the said minor in all future transactions of any description in the above account until the said minor attains majority. I indemnify the bank against the claim of the above minor for any withdrawal/transactions made by me in his/her account).',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: Column(
                  children: [
                    FormHelper.buildTextField(
                      'Date of Birth of Minor',
                      _minorDobController,
                    ),
                    const SizedBox(height: 8),
                    FormHelper.buildTextField(
                      'Guardian Order Date',
                      _guardianOrderDateController,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Declaration Point 3 - Term Deposit
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: _declaration3TermDeposit,
                onChanged: (val) {
                  setState(() {
                    _declaration3TermDeposit = val ?? false;
                    _notifyChange();
                  });
                },
              ),
              const Expanded(
                child: Text(
                  '3. (Applicable in case of Term Deposit Accounts- (Strike out if not required))\n\nI/We undertake that in case of term deposits with operating instructions \'Either or Survivor\', or \'Former or Survivor\' in line with the operating instructions of the application-cum-deposit slip, premature termination/payment will be allowed to the survivor in event of the death of the either of the depositors or former as the case may be on submission of the death certificate of the deceased depositors along with application without obtaining consent of the legal heirs of the deceased depositors.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Declaration Point 4 - No BSBDA
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: _declaration4NoBSBDA,
                onChanged: (val) {
                  setState(() {
                    _declaration4NoBSBDA = val ?? false;
                    _notifyChange();
                  });
                },
              ),
              const Expanded(
                child: Text(
                  '4. I / We hereby declare that I do not maintain a Basic Savings Bank Deposit Account (BSBDA) with any other Bank (Applicable in case of BSBD Account)',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Declaration Point 5 - Details True
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: _declaration5DetailsTrue,
                onChanged: (val) {
                  setState(() {
                    _declaration5DetailsTrue = val ?? false;
                    _notifyChange();
                  });
                },
              ),
              const Expanded(
                child: Text(
                  '5. I /We herby declare that the details above in this form including details in Annexure I and Annexure II are true and correct to the best of my / our knowledge and belief. I further declare to inform you of any changes therein, immediately. In case of any of the above information is found to be false or untrue or misleading or misrepresenting, I/ We am /are aware that I / We may be held liable for it. I / We agree to be bound by the terms and conditions, instructions, etc. as outlined for FATCA / CRS, rules of Bank of India and the RBI and subsequent amendment(s). My / Our personal / KYC details may be shared with Central KYC registry.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Declaration Point 6 - Consent KYC
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: _declaration6ConsentKYC,
                onChanged: (val) {
                  setState(() {
                    _declaration6ConsentKYC = val ?? false;
                    _notifyChange();
                  });
                },
              ),
              const Expanded(
                child: Text(
                  '6. I /We herby consent to receiving information from Central KYC registry through SMS / Email address.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Place and Date
          FormHelper.buildTextField('Place:', _declarationPlaceController),
          const SizedBox(height: 12),
          FormHelper.buildTextField('Date:', _declarationDateController),
          const SizedBox(height: 16),

          // Declaration Signatures
          const Text(
            'Signature of the Applicants / Thumb impression of the Applicants',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildSignatureBox(
                  'Applicant 1',
                  _declarationSignature1Path,
                  (path) => _declarationSignature1Path = path,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSignatureBox(
                  'Applicant 2',
                  _declarationSignature2Path,
                  (path) => _declarationSignature2Path = path,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // FOR OFFICE USE/ATTESTATION Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'FOR OFFICE USE/ATTESTATION',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Office Use Only - Open Account
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '(for office use only)',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Open Account',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                FormHelper.buildTextField(
                  'Date: (DDMMYYYY)',
                  _officeOpenAccountDateController,
                ),
                const SizedBox(height: 12),
                _buildSignatureBox(
                  'Authorised Signatory',
                  _officeAuthorisedSignaturePath,
                  (path) => _officeAuthorisedSignaturePath = path,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Internet Banking Details
          const Text(
            'i) Internet Banking (INB) Kit No:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField('', _officeInbKitNoController),
          const SizedBox(height: 12),

          const Text(
            'ii) INB Viewing rights / Transaction rights given on:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Viewing Rights Date (DDMMYYYY)',
            _officeInbViewingRightsDateController,
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Transaction Rights Date (DDMMYYYY)',
            _officeInbTransactionRightsDateController,
          ),
          const SizedBox(height: 12),

          const Text(
            'iii) ATM Card data transmitted on:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Date (DDMMYYYY)',
            _officeAtmCardDataController,
          ),
          const SizedBox(height: 12),

          const Text(
            'iv) Nomination Serial No:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField('', _officeNominationSerialNoController),
          const SizedBox(height: 12),

          const Text(
            'v) Threshold (KYC) limit:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField('', _officeThresholdKycController),
          const SizedBox(height: 12),

          const Text(
            'vi) Phone Banking:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField('', _officePhoneBankingController),
          const SizedBox(height: 16),

          // Risk Category
          const Text(
            'Risk Category',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text('Low Risk', style: TextStyle(fontSize: 13)),
                  value: _officeRiskLow,
                  onChanged: (val) {
                    setState(() {
                      _officeRiskLow = val ?? false;
                      _notifyChange();
                    });
                  },
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: const Text(
                    'Medium Risk',
                    style: TextStyle(fontSize: 13),
                  ),
                  value: _officeRiskMedium,
                  onChanged: (val) {
                    setState(() {
                      _officeRiskMedium = val ?? false;
                      _notifyChange();
                    });
                  },
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: const Text(
                    'High Risk',
                    style: TextStyle(fontSize: 13),
                  ),
                  value: _officeRiskHigh,
                  onChanged: (val) {
                    setState(() {
                      _officeRiskHigh = val ?? false;
                      _notifyChange();
                    });
                  },
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Transaction Table
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                // Header Row
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Service',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Transaction No',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Initials',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                // Account
                _buildTransactionRow(
                  'Account',
                  _officeAccountTransactionNoController,
                  _officeAccountInitialsController,
                ),
                // CIF Linking
                _buildTransactionRow(
                  'CIF Linking',
                  _officeCifLinkingTransactionNoController,
                  _officeCifLinkingInitialsController,
                ),
                // Personalised Cheque
                _buildTransactionRow(
                  'Personalised Cheque',
                  _officePersonalisedChequeTransactionNoController,
                  _officePersonalisedChequeInitialsController,
                ),
                // RINB
                _buildTransactionRow(
                  'RINB',
                  _officeRinbTransactionNoController,
                  _officeRinbInitialsController,
                ),
                // MBS
                _buildTransactionRow(
                  'MBS',
                  _officeMbsTransactionNoController,
                  _officeMbsInitialsController,
                ),
                // SMS Alert
                _buildTransactionRow(
                  'SMS Alert',
                  _officeSmsAlertTransactionNoController,
                  _officeSmsAlertInitialsController,
                ),
                // Removal of Posting
                _buildTransactionRow(
                  'Removal of Posting',
                  _officeRemovalPostingTransactionNoController,
                  _officeRemovalPostingInitialsController,
                ),
                // Scanning
                _buildTransactionRow(
                  'Scanning',
                  _officeScanningTransactionNoController,
                  _officeScanningInitialsController,
                  isLast: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // KYC and Account Approval
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'KYC including Due Diligence carried out & Account opened by',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                FormHelper.buildTextField(
                  'Name',
                  _officeKycAccountOpenedByController,
                ),
                const SizedBox(height: 12),
                _buildSignatureBox(
                  'Signature & PF of Staff',
                  _officeKycStaffSignaturePath,
                  (path) => _officeKycStaffSignaturePath = path,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Account Approved by',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                FormHelper.buildTextField(
                  'Name',
                  _officeAccountApprovedByController,
                ),
                const SizedBox(height: 12),
                _buildSignatureBox(
                  'Signature & PF of Staff',
                  _officeApprovalStaffSignaturePath,
                  (path) => _officeApprovalStaffSignaturePath = path,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTransactionRow(
    String label,
    TextEditingController transactionController,
    TextEditingController initialsController, {
    bool isLast = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(label, style: const TextStyle(fontSize: 12)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey.shade300),
                  right: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: TextField(
                controller: transactionController,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  isDense: true,
                ),
                onChanged: (_) => _notifyChange(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: initialsController,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                isDense: true,
              ),
              onChanged: (_) => _notifyChange(),
            ),
          ),
        ],
      ),
    );
  }
}
