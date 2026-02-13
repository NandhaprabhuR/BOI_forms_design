// lib/screens/forms/page3_form_enhanced.dart

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import '../model/form_data_model.dart';
import 'form_helper.dart';

class Page3FormEnhanced extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page3FormEnhanced({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page3FormEnhanced> createState() => _Page3FormEnhancedState();
}

class _Page3FormEnhancedState extends State<Page3FormEnhanced> {
  late TextEditingController _page3DateController;
  late TextEditingController _page3AccountNoController;
  late TextEditingController _firstApplicantCustomerIdController;
  late TextEditingController _secondApplicantCustomerIdController;
  late TextEditingController _atmCardName1stController;
  late TextEditingController _atmCardName2ndController;
  late TextEditingController _fdAmountController;
  late TextEditingController _fdAmountWordsController;
  late TextEditingController _fdPeriodYearsController;
  late TextEditingController _fdPeriodMonthsController;
  late TextEditingController _fdPeriodDaysController;
  late TextEditingController _rdInstallmentController;
  late TextEditingController _debitAccountNoController;
  late TextEditingController _modeOfOperationOtherController;
  late TextEditingController _nominationRegistrationNoController;
  late TextEditingController _depositTypeController;
  late TextEditingController _nominationAccountNoController;

  // Section 5: Multi-Option Deposit
  late TextEditingController _modPeriodYearsController;
  late TextEditingController _modPeriodMonthsController;
  late TextEditingController _modLinkedAccountController;
  late TextEditingController _modTdsAccountController;

  // Section 6: Recurring/Flexi Deposit
  late TextEditingController _rdAmountController;
  late TextEditingController _rdAmountWordsController;
  late TextEditingController _rdPeriodYearsController;
  late TextEditingController _rdPeriodMonthsController;
  late TextEditingController _rdDebitAccountController;
  late TextEditingController _rdMaturityAccountController;

  // Checkbox states
  bool _accountTypeSavings = false;
  bool _accountTypeBSBDA = false;
  bool _accountTypeSmall = false;
  bool _accountTypeCurrent = false;
  bool _accountTypeFixedDeposit = false;
  bool _accountTypeCapsGain = false;

  bool _modeOfOperationSelf = false;
  bool _modeOfOperationEitherOrSurvivor = false;
  bool _modeOfOperationFormerOrSurvivor = false;
  bool _modeOfOperationAnyOneOrSurvivor = false;
  bool _modeOfOperationJointly = false;
  bool _modeOfOperationOtherChecked = false;

  bool _atmCard1stApplicant = false;
  bool _atmCard2ndApplicant = false;
  bool _netBankingYes = false;
  bool _netBankingNo = false;
  bool _mobileBankingYes = false;
  bool _mobileBankingNo = false;
  bool _smsAlertYes = false;
  bool _smsAlertNo = false;
  bool _emailStatementYes = false;
  bool _emailStatementNo = false;
  bool _chequeBookYes = false;
  bool _chequeBookNo = false;

  bool _nominationYes = false;
  bool _nominationNo = false;

  bool _fdAutoRenewPrincipalPaybackInterest = false;
  bool _fdPayPrincipalAndInterest = false;
  bool _fdAutoRenewBoth = false;
  bool _fdAutoRenewPartAmount = false;

  bool _modRecurringDeposit = false;
  bool _modDoubleBenefit = false;
  bool _modMICQIC = false;
  bool _modShortFixedDeposit = false;
  bool _modTaxSaving = false;
  bool _modCapitalGain = false;

  bool _rdMonthly = false;
  bool _rdQuarterly = false;
  bool _rdCalenderQuarter = false;
  bool _rdHalfYearly = false;
  bool _rdYearly = false;

  // Rubber stamp image
  String? _rubberStampImagePath;

  // Section 5: Multi-Option Deposit state
  bool _modTermDeposit = false;
  bool _modTermDepositReinvestment = false;
  bool _modReverseSweepLastInFirstOut = false;

  // Section 6: Recurring Deposit state
  bool _rdMonthlyCore = false;
  bool _rdStandingInstruction = false;
  bool _rdMaturityCredit = false;

  @override
  void initState() {
    super.initState();
    _page3DateController = TextEditingController();
    _page3AccountNoController = TextEditingController();
    _firstApplicantCustomerIdController = TextEditingController(
      text: widget.initialData.firstApplicantCustomerId,
    );
    _secondApplicantCustomerIdController = TextEditingController(
      text: widget.initialData.secondApplicantCustomerId,
    );
    _atmCardName1stController = TextEditingController(
      text: widget.initialData.atmCardName,
    );
    _atmCardName2ndController = TextEditingController();
    _fdAmountController = TextEditingController(
      text: widget.initialData.fdAmount,
    );
    _fdAmountWordsController = TextEditingController();
    _fdPeriodYearsController = TextEditingController();
    _fdPeriodMonthsController = TextEditingController();
    _fdPeriodDaysController = TextEditingController();
    _rdInstallmentController = TextEditingController(
      text: widget.initialData.rdInstallment,
    );
    _debitAccountNoController = TextEditingController(
      text: widget.initialData.debitAccountNo,
    );
    _modeOfOperationOtherController = TextEditingController(
      text: widget.initialData.modeOfOperationOther,
    );
    _nominationRegistrationNoController = TextEditingController(
      text: widget.initialData.nominationRegistrationNo,
    );
    _depositTypeController = TextEditingController(
      text: widget.initialData.depositType,
    );
    _nominationAccountNoController = TextEditingController(
      text: widget.initialData.nominationAccountNo,
    );

    // Section 5: Multi-Option Deposit
    _modPeriodYearsController = TextEditingController();
    _modPeriodMonthsController = TextEditingController();
    _modLinkedAccountController = TextEditingController();
    _modTdsAccountController = TextEditingController();

    // Section 6: Recurring/Flexi Deposit
    _rdAmountController = TextEditingController();
    _rdAmountWordsController = TextEditingController();
    _rdPeriodYearsController = TextEditingController();
    _rdPeriodMonthsController = TextEditingController();
    _rdDebitAccountController = TextEditingController();
    _rdMaturityAccountController = TextEditingController();

    // Initialize checkbox states from initial data
    _accountTypeSavings = widget.initialData.accountTypeSavingsBank;
    _accountTypeBSBDA = widget.initialData.accountTypeBSBDA;
    _accountTypeSmall = widget.initialData.accountTypeSmallAccount;
    _accountTypeCurrent = widget.initialData.accountTypeCurrent;
    _accountTypeFixedDeposit = widget.initialData.accountTypeFixedDeposit;
    _accountTypeCapsGain = widget.initialData.accountTypeCapsGain;

    _modeOfOperationSelf = widget.initialData.modeOfOperationSelf;
    _modeOfOperationEitherOrSurvivor =
        widget.initialData.modeOfOperationEitherOrSurvivor;
    _modeOfOperationFormerOrSurvivor =
        widget.initialData.modeOfOperationFormerOrSurvivor;
    _modeOfOperationAnyOneOrSurvivor =
        widget.initialData.modeOfOperationAnyoneOrSurvivor;
    _modeOfOperationJointly = widget.initialData.modeOfOperationJointly;
    _modeOfOperationOtherChecked =
        widget.initialData.modeOfOperationOtherCheckbox;

    _atmCard1stApplicant = widget.initialData.atmCard1stApplicant;
    _atmCard2ndApplicant = widget.initialData.atmCard2ndApplicant;
    _netBankingYes = widget.initialData.netBankingYes;
    _netBankingNo = widget.initialData.netBankingNo;
    _mobileBankingYes = widget.initialData.mobileBankingYes;
    _mobileBankingNo = widget.initialData.mobileBankingNo;
    _smsAlertYes = widget.initialData.smsAlertYes;
    _smsAlertNo = widget.initialData.smsAlertNo;
    _emailStatementYes = widget.initialData.emailStatementYes;
    _emailStatementNo = widget.initialData.emailStatementNo;
    _chequeBookYes = widget.initialData.chequeBookYes;
    _chequeBookNo = widget.initialData.chequeBookNo;

    _nominationYes = widget.initialData.nominationYes;
    _nominationNo = widget.initialData.nominationNo;

    _fdAutoRenewPrincipalPaybackInterest =
        widget.initialData.fdAutoRenewPrincipalPaybackInterest;
    _fdPayPrincipalAndInterest = widget.initialData.fdPayPrincipalAndInterest;
    _fdAutoRenewBoth = widget.initialData.fdAutoRenewBoth;
    _fdAutoRenewPartAmount = widget.initialData.fdAutoRenewPartAmount;

    _modRecurringDeposit = widget.initialData.modRecurringDeposit;
    _modDoubleBenefit = widget.initialData.modDoubleBenefit;
    _modMICQIC = widget.initialData.modMICQIC;
    _modShortFixedDeposit = widget.initialData.modShortFixedDeposit;
    _modTaxSaving = widget.initialData.modTaxSaving;
    _modCapitalGain = widget.initialData.modCapitalGain;

    _rdMonthly = widget.initialData.rdMonthly;
    _rdQuarterly = widget.initialData.rdQuarterly;
    _rdCalenderQuarter = widget.initialData.rdCalenderQuarter;
    _rdHalfYearly = widget.initialData.rdHalfYearly;
    _rdYearly = widget.initialData.rdYearly;

    FormHelper.addListeners([
      _page3DateController,
      _page3AccountNoController,
      _firstApplicantCustomerIdController,
      _secondApplicantCustomerIdController,
      _atmCardName1stController,
      _atmCardName2ndController,
      _fdAmountController,
      _fdAmountWordsController,
      _fdPeriodYearsController,
      _fdPeriodMonthsController,
      _fdPeriodDaysController,
      _rdInstallmentController,
      _debitAccountNoController,
      _modeOfOperationOtherController,
      _nominationRegistrationNoController,
      _depositTypeController,
      _nominationAccountNoController,
      _modPeriodYearsController,
      _modPeriodMonthsController,
      _modLinkedAccountController,
      _modTdsAccountController,
      _rdAmountController,
      _rdAmountWordsController,
      _rdPeriodYearsController,
      _rdPeriodMonthsController,
      _rdDebitAccountController,
      _rdMaturityAccountController,
    ], _notifyChange);
  }

  void _notifyChange() {
    widget.onDataChanged(_buildUpdatedData());
  }

  Future<void> _pickRubberStampImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _rubberStampImagePath = image.path;
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
      firstApplicantCustomerId: _firstApplicantCustomerIdController.text,
      secondApplicantCustomerId: _secondApplicantCustomerIdController.text,
      atmCardName: _atmCardName1stController.text,
      fdAmount: _fdAmountController.text,
      rdInstallment: _rdInstallmentController.text,
      debitAccountNo: _debitAccountNoController.text,
      modeOfOperationOther: _modeOfOperationOtherController.text,
      nominationRegistrationNo: _nominationRegistrationNoController.text,
      depositType: _depositTypeController.text,
      nominationAccountNo: _nominationAccountNoController.text,
      nomineeName: widget.initialData.nomineeName,
      nomineeMobile: widget.initialData.nomineeMobile,
      nomineeRelationship: widget.initialData.nomineeRelationship,
      nomineeDob: widget.initialData.nomineeDob,
      nomineeAddress: widget.initialData.nomineeAddress,
      nomineeGuardianName: widget.initialData.nomineeGuardianName,
      witness1Name: widget.initialData.witness1Name,
      witness1Address: widget.initialData.witness1Address,
      witness2Name: widget.initialData.witness2Name,
      witness2Address: widget.initialData.witness2Address,
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
      applicantPhoto: widget.initialData.applicantPhoto,
      witnessSignature1: widget.initialData.witnessSignature1,
      witnessSignature2: widget.initialData.witnessSignature2,
      // Checkboxes
      accountTypeSavingsBank: _accountTypeSavings,
      accountTypeBSBDA: _accountTypeBSBDA,
      accountTypeSmallAccount: _accountTypeSmall,
      accountTypeCurrent: _accountTypeCurrent,
      accountTypeFixedDeposit: _accountTypeFixedDeposit,
      accountTypeCapsGain: _accountTypeCapsGain,
      modeOfOperationSelf: _modeOfOperationSelf,
      modeOfOperationEitherOrSurvivor: _modeOfOperationEitherOrSurvivor,
      modeOfOperationFormerOrSurvivor: _modeOfOperationFormerOrSurvivor,
      modeOfOperationAnyoneOrSurvivor: _modeOfOperationAnyOneOrSurvivor,
      modeOfOperationJointly: _modeOfOperationJointly,
      modeOfOperationOtherCheckbox: _modeOfOperationOtherChecked,
      atmCard1stApplicant: _atmCard1stApplicant,
      atmCard2ndApplicant: _atmCard2ndApplicant,
      netBankingYes: _netBankingYes,
      netBankingNo: _netBankingNo,
      mobileBankingYes: _mobileBankingYes,
      mobileBankingNo: _mobileBankingNo,
      smsAlertYes: _smsAlertYes,
      smsAlertNo: _smsAlertNo,
      emailStatementYes: _emailStatementYes,
      emailStatementNo: _emailStatementNo,
      chequeBookYes: _chequeBookYes,
      chequeBookNo: _chequeBookNo,
      nominationYes: _nominationYes,
      nominationNo: _nominationNo,
      fdAutoRenewPrincipalPaybackInterest: _fdAutoRenewPrincipalPaybackInterest,
      fdPayPrincipalAndInterest: _fdPayPrincipalAndInterest,
      fdAutoRenewBoth: _fdAutoRenewBoth,
      fdAutoRenewPartAmount: _fdAutoRenewPartAmount,
      modRecurringDeposit: _modRecurringDeposit,
      modDoubleBenefit: _modDoubleBenefit,
      modMICQIC: _modMICQIC,
      modShortFixedDeposit: _modShortFixedDeposit,
      modTaxSaving: _modTaxSaving,
      modCapitalGain: _modCapitalGain,
      rdMonthly: _rdMonthly,
      rdQuarterly: _rdQuarterly,
      rdCalenderQuarter: _rdCalenderQuarter,
      rdHalfYearly: _rdHalfYearly,
      rdYearly: _rdYearly,
      fatcaIndianCitizen: widget.initialData.fatcaIndianCitizen,
      fatcaNonIndianCitizen: widget.initialData.fatcaNonIndianCitizen,
      pepYes: widget.initialData.pepYes,
      pepNo: widget.initialData.pepNo,
    );
  }

  @override
  @override
  void dispose() {
    FormHelper.disposeControllers([
      _page3DateController,
      _page3AccountNoController,
      _firstApplicantCustomerIdController,
      _secondApplicantCustomerIdController,
      _atmCardName1stController,
      _atmCardName2ndController,
      _fdAmountController,
      _fdAmountWordsController,
      _fdPeriodYearsController,
      _fdPeriodMonthsController,
      _fdPeriodDaysController,
      _rdInstallmentController,
      _debitAccountNoController,
      _modeOfOperationOtherController,
      _nominationRegistrationNoController,
      _depositTypeController,
      _nominationAccountNoController,
      _modPeriodYearsController,
      _modPeriodMonthsController,
      _modLinkedAccountController,
      _modTdsAccountController,
      _rdAmountController,
      _rdAmountWordsController,
      _rdPeriodYearsController,
      _rdPeriodMonthsController,
      _rdDebitAccountController,
      _rdMaturityAccountController,
    ]);
    super.dispose();
  }

  Widget _buildCheckboxGroup(String title, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        if (title.isNotEmpty) const SizedBox(height: 8),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: items.map((item) {
            return InkWell(
              onTap: () {
                setState(() {
                  item['onChanged'](!item['value']);
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: item['value'],
                    onChanged: (val) {
                      setState(() {
                        item['onChanged'](val ?? false);
                      });
                    },
                  ),
                  Text(item['label']),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ACCOUNT OPENING FORM FOR INDIVIDUAL (PART -II)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                '(SAVING BANK, CURRENT ACCOUNT AND TERM DEPOSITS)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text(
                    'Date: ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: _page3DateController,
                      decoration: const InputDecoration(
                        hintText: 'D D M M Y Y Y Y',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Fields marked asterix (*) are mandatory. Please fill up in BLOCK letters only and use black ink for signature',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '(For office use only)',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),

          FormHelper.buildTextField(
            'First Applicant Customer ID',
            _firstApplicantCustomerIdController,
          ),
          const SizedBox(height: 12),

          FormHelper.buildTextField(
            'Second Applicant Customer ID',
            _secondApplicantCustomerIdController,
          ),
          const SizedBox(height: 12),

          FormHelper.buildTextField('Account No.', _page3AccountNoController),
          const SizedBox(height: 16),

          GestureDetector(
            onTap: _pickRubberStampImage,
            child: Container(
              height: 150,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey.shade50,
              ),
              child: _rubberStampImagePath != null
                  ? Stack(
                      children: [
                        Center(
                          child: kIsWeb
                              ? Image.network(
                                  _rubberStampImagePath!,
                                  fit: BoxFit.contain,
                                )
                              : Image.file(
                                  File(_rubberStampImagePath!),
                                  fit: BoxFit.contain,
                                ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.close, size: 20),
                            onPressed: () {
                              setState(() {
                                _rubberStampImagePath = null;
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
                        Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 40,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Bank/Branch to affix rubber stamp of\nname and code no.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Tap to add image',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.blue.shade700,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'I/We request you to open my/our deposit account with your branch/bank as under: (Tick (✓) relevant type of account)',
              style: TextStyle(fontSize: 13),
            ),
          ),
          const SizedBox(height: 12),
          // Account Type Checkboxes
          FormHelper.buildSectionTitle('1. Type of Account'),
          _buildCheckboxGroup('Select account type(s):', [
            {
              'label': 'Savings Bank Account',
              'value': _accountTypeSavings,
              'onChanged': (val) {
                if (val == true) {
                  _accountTypeSavings = true;
                  _accountTypeBSBDA = false;
                  _accountTypeSmall = false;
                  _accountTypeCurrent = false;
                  _accountTypeFixedDeposit = false;
                  _accountTypeCapsGain = false;
                } else {
                  _accountTypeSavings = false;
                }
                _notifyChange();
              },
            },
            {
              'label': 'BSBDA',
              'value': _accountTypeBSBDA,
              'onChanged': (val) {
                if (val == true) {
                  _accountTypeBSBDA = true;
                  _accountTypeSavings = false;
                  _accountTypeSmall = false;
                  _accountTypeCurrent = false;
                  _accountTypeFixedDeposit = false;
                  _accountTypeCapsGain = false;
                } else {
                  _accountTypeBSBDA = false;
                }
                _notifyChange();
              },
            },
            {
              'label': 'Small Account',
              'value': _accountTypeSmall,
              'onChanged': (val) {
                if (val == true) {
                  _accountTypeSmall = true;
                  _accountTypeSavings = false;
                  _accountTypeBSBDA = false;
                  _accountTypeCurrent = false;
                  _accountTypeFixedDeposit = false;
                  _accountTypeCapsGain = false;
                } else {
                  _accountTypeSmall = false;
                }
                _notifyChange();
              },
            },
            {
              'label': 'Current Account',
              'value': _accountTypeCurrent,
              'onChanged': (val) {
                if (val == true) {
                  _accountTypeCurrent = true;
                  _accountTypeSavings = false;
                  _accountTypeBSBDA = false;
                  _accountTypeSmall = false;
                  _accountTypeFixedDeposit = false;
                  _accountTypeCapsGain = false;
                } else {
                  _accountTypeCurrent = false;
                }
                _notifyChange();
              },
            },
            {
              'label': 'Fixed Deposit/RD',
              'value': _accountTypeFixedDeposit,
              'onChanged': (val) {
                if (val == true) {
                  _accountTypeFixedDeposit = true;
                  _accountTypeSavings = false;
                  _accountTypeBSBDA = false;
                  _accountTypeSmall = false;
                  _accountTypeCurrent = false;
                  _accountTypeCapsGain = false;
                } else {
                  _accountTypeFixedDeposit = false;
                }
                _notifyChange();
              },
            },
            {
              'label': 'CAPS GAIN (SB)',
              'value': _accountTypeCapsGain,
              'onChanged': (val) {
                if (val == true) {
                  _accountTypeCapsGain = true;
                  _accountTypeSavings = false;
                  _accountTypeBSBDA = false;
                  _accountTypeSmall = false;
                  _accountTypeCurrent = false;
                  _accountTypeFixedDeposit = false;
                } else {
                  _accountTypeCapsGain = false;
                }
                _notifyChange();
              },
            },
          ]),

          // Mode of Operation Checkboxes
          FormHelper.buildSectionTitle('2. Mode of Operation'),
          _buildCheckboxGroup('Select mode of operation:', [
            {
              'label': 'Self',
              'value': _modeOfOperationSelf,
              'onChanged': (val) {
                if (val == true) {
                  _modeOfOperationSelf = true;
                  _modeOfOperationEitherOrSurvivor = false;
                  _modeOfOperationFormerOrSurvivor = false;
                  _modeOfOperationAnyOneOrSurvivor = false;
                  _modeOfOperationJointly = false;
                  _modeOfOperationOtherChecked = false;
                } else {
                  _modeOfOperationSelf = false;
                }
                _notifyChange();
              },
            },
            {
              'label': 'Either or Survivor',
              'value': _modeOfOperationEitherOrSurvivor,
              'onChanged': (val) {
                if (val == true) {
                  _modeOfOperationEitherOrSurvivor = true;
                  _modeOfOperationSelf = false;
                  _modeOfOperationFormerOrSurvivor = false;
                  _modeOfOperationAnyOneOrSurvivor = false;
                  _modeOfOperationJointly = false;
                  _modeOfOperationOtherChecked = false;
                } else {
                  _modeOfOperationEitherOrSurvivor = false;
                }
                _notifyChange();
              },
            },
            {
              'label': 'Former or Survivor',
              'value': _modeOfOperationFormerOrSurvivor,
              'onChanged': (val) {
                if (val == true) {
                  _modeOfOperationFormerOrSurvivor = true;
                  _modeOfOperationSelf = false;
                  _modeOfOperationEitherOrSurvivor = false;
                  _modeOfOperationAnyOneOrSurvivor = false;
                  _modeOfOperationJointly = false;
                  _modeOfOperationOtherChecked = false;
                } else {
                  _modeOfOperationFormerOrSurvivor = false;
                }
                _notifyChange();
              },
            },
            {
              'label': 'Any one or Survivor',
              'value': _modeOfOperationAnyOneOrSurvivor,
              'onChanged': (val) {
                if (val == true) {
                  _modeOfOperationAnyOneOrSurvivor = true;
                  _modeOfOperationSelf = false;
                  _modeOfOperationEitherOrSurvivor = false;
                  _modeOfOperationFormerOrSurvivor = false;
                  _modeOfOperationJointly = false;
                  _modeOfOperationOtherChecked = false;
                } else {
                  _modeOfOperationAnyOneOrSurvivor = false;
                }
                _notifyChange();
              },
            },
            {
              'label': 'Jointly Operated',
              'value': _modeOfOperationJointly,
              'onChanged': (val) {
                if (val == true) {
                  _modeOfOperationJointly = true;
                  _modeOfOperationSelf = false;
                  _modeOfOperationEitherOrSurvivor = false;
                  _modeOfOperationFormerOrSurvivor = false;
                  _modeOfOperationAnyOneOrSurvivor = false;
                  _modeOfOperationOtherChecked = false;
                } else {
                  _modeOfOperationJointly = false;
                }
                _notifyChange();
              },
            },
            {
              'label': 'Other',
              'value': _modeOfOperationOtherChecked,
              'onChanged': (val) {
                if (val == true) {
                  _modeOfOperationOtherChecked = true;
                  _modeOfOperationSelf = false;
                  _modeOfOperationEitherOrSurvivor = false;
                  _modeOfOperationFormerOrSurvivor = false;
                  _modeOfOperationAnyOneOrSurvivor = false;
                  _modeOfOperationJointly = false;
                } else {
                  _modeOfOperationOtherChecked = false;
                }
                _notifyChange();
              },
            },
          ]),
          FormHelper.buildTextField(
            'If Other, specify',
            _modeOfOperationOtherController,
          ),

          // Services Required Section
          FormHelper.buildSectionTitle('3. Services Required'),

          // 1. ATM-CUM-DEBIT CARD
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '1. ATM-CUM-DEBIT CARD',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text('1st Applicant'),
                  value: _atmCard1stApplicant,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  onChanged: (val) {
                    setState(() {
                      _atmCard1stApplicant = val ?? false;
                      _notifyChange();
                    });
                  },
                ),
              ),
              const SizedBox(width: 20),
              const Text('Yes', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 40),
              const Text('No', style: TextStyle(fontSize: 14)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text('2nd Applicant'),
                  value: _atmCard2ndApplicant,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  onChanged: (val) {
                    setState(() {
                      _atmCard2ndApplicant = val ?? false;
                      _notifyChange();
                    });
                  },
                ),
              ),
              const SizedBox(width: 20),
              const Text('Yes', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 40),
              const Text('No', style: TextStyle(fontSize: 14)),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name as would appear on the card',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                const SizedBox(height: 8),
                FormHelper.buildTextField(
                  '1st Applicant Name',
                  _atmCardName1stController,
                ),
                const SizedBox(height: 8),
                FormHelper.buildTextField(
                  '2nd Applicant Name',
                  _atmCardName2ndController,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '(Mobile no. is mandatory for services 1 to 8)',
              style: TextStyle(
                fontSize: 11,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 2. CHEQUE BOOK
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '2. CHEQUE BOOK',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                value: _chequeBookYes,
                onChanged: (val) {
                  setState(() {
                    _chequeBookYes = val ?? false;
                    if (_chequeBookYes) _chequeBookNo = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('YES', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 20),
              Checkbox(
                value: _chequeBookNo,
                onChanged: (val) {
                  setState(() {
                    _chequeBookNo = val ?? false;
                    if (_chequeBookNo) _chequeBookYes = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('NO', style: TextStyle(fontSize: 14)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              '(Only for Regular SB/Current Accounts/Caps Gain(SB))\n(Not available for Regular BSBD/Small Accounts)',
              style: TextStyle(
                fontSize: 11,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 3. INTERNET BANKING REQUIRED
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '3. INTERNET BANKING REQUIRED:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Transaction rights required',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
          ),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: Text('1st Applicant', style: TextStyle(fontSize: 14)),
              ),
              Checkbox(
                value: _netBankingYes,
                onChanged: (val) {
                  setState(() {
                    _netBankingYes = val ?? false;
                    if (_netBankingYes) _netBankingNo = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('YES', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 20),
              Checkbox(
                value: _netBankingNo,
                onChanged: (val) {
                  setState(() {
                    _netBankingNo = val ?? false;
                    if (_netBankingNo) _netBankingYes = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('NO', style: TextStyle(fontSize: 14)),
            ],
          ),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: Text('2nd Applicant', style: TextStyle(fontSize: 14)),
              ),
              Checkbox(
                value: _netBankingYes,
                onChanged: (val) {
                  setState(() {
                    _netBankingYes = val ?? false;
                    if (_netBankingYes) _netBankingNo = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('YES', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 20),
              Checkbox(
                value: _netBankingNo,
                onChanged: (val) {
                  setState(() {
                    _netBankingNo = val ?? false;
                    if (_netBankingNo) _netBankingYes = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('NO', style: TextStyle(fontSize: 14)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              '(Available only for singly operated accounts and joint account operated by Either or Survivor mode. In case of accounts operated as Former or Survivor mode INB facility is available to 1st applicant only)',
              style: TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 4. SMS ALERTS
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '4. SMS ALERTS(Charges Applicable)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'SMS Alerts on Registered Mobile Number',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                value: _smsAlertYes,
                onChanged: (val) {
                  setState(() {
                    _smsAlertYes = val ?? false;
                    if (_smsAlertYes) _smsAlertNo = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('YES', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 20),
              Checkbox(
                value: _smsAlertNo,
                onChanged: (val) {
                  setState(() {
                    _smsAlertNo = val ?? false;
                    if (_smsAlertNo) _smsAlertYes = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('NO', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),

          // 5. PHONE BANKING SERVICES
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '5. PHONE BANKING SERVICES:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                value: _mobileBankingYes,
                onChanged: (val) {
                  setState(() {
                    _mobileBankingYes = val ?? false;
                    if (_mobileBankingYes) _mobileBankingNo = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('YES', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 20),
              Checkbox(
                value: _mobileBankingNo,
                onChanged: (val) {
                  setState(() {
                    _mobileBankingNo = val ?? false;
                    if (_mobileBankingNo) _mobileBankingYes = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('NO', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),

          // 6. MOBILE BANKING
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '6. MOBILE BANKING:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                value: _mobileBankingYes,
                onChanged: (val) {
                  setState(() {
                    _mobileBankingYes = val ?? false;
                    if (_mobileBankingYes) _mobileBankingNo = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('YES', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 20),
              Checkbox(
                value: _mobileBankingNo,
                onChanged: (val) {
                  setState(() {
                    _mobileBankingNo = val ?? false;
                    if (_mobileBankingNo) _mobileBankingYes = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('NO', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),

          // 7. PASSBOOK REQUIRED
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '7. PASSBOOK REQUIRED:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '(For Savings Bank Account)',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                value: _chequeBookYes,
                onChanged: (val) {
                  setState(() {
                    _chequeBookYes = val ?? false;
                    if (_chequeBookYes) _chequeBookNo = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('YES', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 20),
              Checkbox(
                value: _chequeBookNo,
                onChanged: (val) {
                  setState(() {
                    _chequeBookNo = val ?? false;
                    if (_chequeBookNo) _chequeBookYes = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('NO', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),

          // 8. e-Statement
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              '8. e-Statement(at monthly intervals), in lieu of paper copy:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                value: _emailStatementYes,
                onChanged: (val) {
                  setState(() {
                    _emailStatementYes = val ?? false;
                    if (_emailStatementYes) _emailStatementNo = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('Required', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 20),
              Checkbox(
                value: _emailStatementNo,
                onChanged: (val) {
                  setState(() {
                    _emailStatementNo = val ?? false;
                    if (_emailStatementNo) _emailStatementYes = false;
                    _notifyChange();
                  });
                },
              ),
              const Text('Not Required', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 24),

          // 4. Fixed Deposit Section
          FormHelper.buildSectionTitle(
            '4. Fixed Deposit: For the following products/facilities, please furnish options/details:',
          ),

          // Product checkboxes
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _modRecurringDeposit,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _modRecurringDeposit = true;
                          _modDoubleBenefit = false;
                          _modMICQIC = false;
                          _modShortFixedDeposit = false;
                          _modTaxSaving = false;
                          _modCapitalGain = false;
                        } else {
                          _modRecurringDeposit = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text(
                    'Recurring Deposit',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _modDoubleBenefit,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _modDoubleBenefit = true;
                          _modRecurringDeposit = false;
                          _modMICQIC = false;
                          _modShortFixedDeposit = false;
                          _modTaxSaving = false;
                          _modCapitalGain = false;
                        } else {
                          _modDoubleBenefit = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text(
                    'Double Benefit Deposit',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _modMICQIC,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _modMICQIC = true;
                          _modRecurringDeposit = false;
                          _modDoubleBenefit = false;
                          _modShortFixedDeposit = false;
                          _modTaxSaving = false;
                          _modCapitalGain = false;
                        } else {
                          _modMICQIC = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text('MIC/QIC', style: TextStyle(fontSize: 14)),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _modShortFixedDeposit,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _modShortFixedDeposit = true;
                          _modRecurringDeposit = false;
                          _modDoubleBenefit = false;
                          _modMICQIC = false;
                          _modTaxSaving = false;
                          _modCapitalGain = false;
                        } else {
                          _modShortFixedDeposit = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text(
                    'Short / Fixed Deposit',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _modTaxSaving,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _modTaxSaving = true;
                          _modRecurringDeposit = false;
                          _modDoubleBenefit = false;
                          _modMICQIC = false;
                          _modShortFixedDeposit = false;
                          _modCapitalGain = false;
                        } else {
                          _modTaxSaving = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text(
                    'Tax Saving Scheme',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _modCapitalGain,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _modCapitalGain = true;
                          _modRecurringDeposit = false;
                          _modDoubleBenefit = false;
                          _modMICQIC = false;
                          _modShortFixedDeposit = false;
                          _modTaxSaving = false;
                        } else {
                          _modCapitalGain = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text(
                    'Capital Gain(TDR)',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Amount section
          FormHelper.buildTextField(
            'Amount: Rs.',
            _fdAmountController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),

          FormHelper.buildTextField('Rs. (in words)', _fdAmountWordsController),
          const SizedBox(height: 12),

          // Period section
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'Period (years)',
                  _fdPeriodYearsController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'Period (months)',
                  _fdPeriodMonthsController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'Period (days)',
                  _fdPeriodDaysController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Cash Officer authentication box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name of Depositor(s), Amount and Period of Deposit authenticated by Cash Officer in case of Illiterate Depositor',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  maxLines: 2,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Initials of Cash Officer',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Interest payable frequency
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'In case of Term Deposit, interest payable#:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _rdMonthly,
                    onChanged: (val) {
                      setState(() {
                        _rdMonthly = val ?? false;
                        _notifyChange();
                      });
                    },
                  ),
                  const Text('Monthly', style: TextStyle(fontSize: 14)),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _rdQuarterly,
                    onChanged: (val) {
                      setState(() {
                        _rdQuarterly = val ?? false;
                        _notifyChange();
                      });
                    },
                  ),
                  const Text('Quarterly', style: TextStyle(fontSize: 14)),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _rdCalenderQuarter,
                    onChanged: (val) {
                      setState(() {
                        _rdCalenderQuarter = val ?? false;
                        _notifyChange();
                      });
                    },
                  ),
                  const Text(
                    'Calender Quarter',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _rdHalfYearly,
                    onChanged: (val) {
                      setState(() {
                        _rdHalfYearly = val ?? false;
                        _notifyChange();
                      });
                    },
                  ),
                  const Text('Half Yearly', style: TextStyle(fontSize: 14)),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _rdYearly,
                    onChanged: (val) {
                      setState(() {
                        _rdYearly = val ?? false;
                        _notifyChange();
                      });
                    },
                  ),
                  const Text('Yearly', style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Maturity instruction
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Maturity instruction@',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _fdAutoRenewPrincipalPaybackInterest,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _fdAutoRenewPrincipalPaybackInterest = true;
                          _fdAutoRenewBoth = false;
                          _fdPayPrincipalAndInterest = false;
                          _fdAutoRenewPartAmount = false;
                        } else {
                          _fdAutoRenewPrincipalPaybackInterest = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text(
                    'Auto renew* principal & payback interest',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _fdAutoRenewBoth,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _fdAutoRenewBoth = true;
                          _fdAutoRenewPrincipalPaybackInterest = false;
                          _fdPayPrincipalAndInterest = false;
                          _fdAutoRenewPartAmount = false;
                        } else {
                          _fdAutoRenewBoth = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text(
                    'Auto renew* principal & interest',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _fdPayPrincipalAndInterest,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _fdPayPrincipalAndInterest = true;
                          _fdAutoRenewPrincipalPaybackInterest = false;
                          _fdAutoRenewBoth = false;
                          _fdAutoRenewPartAmount = false;
                        } else {
                          _fdPayPrincipalAndInterest = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text(
                    'Pay principal & interest',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _fdAutoRenewPartAmount,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _fdAutoRenewPartAmount = true;
                          _fdAutoRenewPrincipalPaybackInterest = false;
                          _fdAutoRenewBoth = false;
                          _fdPayPrincipalAndInterest = false;
                        } else {
                          _fdAutoRenewPartAmount = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text(
                    'Auto Renew* with part amount for Rs...........',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              '* (Auto Renewal will be done for the similar term at the prevailing interest rate on the date of renewal.)',
              style: TextStyle(
                fontSize: 11,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              '@# (All Interest payable and Maturity instructions options will not be offered by all Banks. Contact respective Banks for the options avaialble.)',
              style: TextStyle(
                fontSize: 11,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Payment instruction
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Payment instruction (Maturity Proceeds/Residual amount):',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (val) {}),
              const Text(
                'By credit to my Bank Account No.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 5. MULTI-OPTION DEPOSIT SCHEME / AUTO SWEEP
          FormHelper.buildSectionTitle(
            '5. MULTI-OPTION DEPOSIT SCHEME / AUTO SWEEP',
          ),

          // Type of Deposit
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Type of Deposit',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: _modTermDeposit,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _modTermDeposit = true;
                      _modTermDepositReinvestment = false;
                    } else {
                      _modTermDeposit = false;
                    }
                    _notifyChange();
                  });
                },
              ),
              const Text('Term Deposit', style: TextStyle(fontSize: 14)),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _modTermDepositReinvestment,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _modTermDepositReinvestment = true;
                      _modTermDeposit = false;
                    } else {
                      _modTermDepositReinvestment = false;
                    }
                    _notifyChange();
                  });
                },
              ),
              const Text(
                'Term Deposit (Reinvestment)',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),

          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Period of Deposit',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'Year(s)',
                  _modPeriodYearsController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'Months',
                  _modPeriodMonthsController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'I/We hereby give consent for debiting my/our account for recovering service charges as normally applicable to Savings Bank and Current Account.',
              style: TextStyle(fontSize: 12),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              'I/We hereby give consent for debiting my/ our Savings Bank/ Current Account for creating MODS/AUTO SWEEP as per the Terms and Conditions.',
              style: TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 12),

          FormHelper.buildTextField(
            'Linked Saving Bank/Current Account No.',
            _modLinkedAccountController,
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Checkbox(
                value: _modReverseSweepLastInFirstOut,
                onChanged: (val) {
                  setState(() {
                    _modReverseSweepLastInFirstOut = val ?? false;
                    _notifyChange();
                  });
                },
              ),
              const Expanded(
                child: Text(
                  'Under reverse sweep facility for breaking the MOD, the MOD to be broken by: Last in first out',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 6. RECURRING DEPOSIT / FLEXI DEPOSIT
          FormHelper.buildSectionTitle('6. RECURRING DEPOSIT / FLEXI DEPOSIT'),

          Row(
            children: [
              Checkbox(
                value: _rdMonthlyCore,
                onChanged: (val) {
                  setState(() {
                    _rdMonthlyCore = val ?? false;
                    _notifyChange();
                  });
                },
              ),
              const Text(
                'Monthly / Core Monthly installment:',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),

          FormHelper.buildTextField(
            'Rs.',
            _rdAmountController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),

          FormHelper.buildTextField('Rs. (In words)', _rdAmountWordsController),
          const SizedBox(height: 12),

          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Period',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'Years',
                  _rdPeriodYearsController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'Month(s)',
                  _rdPeriodMonthsController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Checkbox(
                value: _rdStandingInstruction,
                onChanged: (val) {
                  setState(() {
                    _rdStandingInstruction = val ?? false;
                    _notifyChange();
                  });
                },
              ),
              const Expanded(
                child: Text(
                  'Standing instruction (if any)',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          FormHelper.buildTextField(
            'Debit Account No.',
            _rdDebitAccountController,
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Checkbox(
                value: _rdMaturityCredit,
                onChanged: (val) {
                  setState(() {
                    _rdMaturityCredit = val ?? false;
                    _notifyChange();
                  });
                },
              ),
              const Expanded(
                child: Text(
                  'On Maturity, credit proceeds to Account No.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          FormHelper.buildTextField(
            'Account No.',
            _rdMaturityAccountController,
          ),
          const SizedBox(height: 12),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'For the above Term Deposit Account, please deduct applicable TDS from (SB/CA Account No.)',
              style: TextStyle(fontSize: 13),
            ),
          ),
          FormHelper.buildTextField(
            'SB/CA Account No.',
            _modTdsAccountController,
          ),
        ],
      ),
    );
  }
}
