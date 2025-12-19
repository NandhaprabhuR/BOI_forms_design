// lib/screens/forms/page3_form.dart

import 'package:flutter/material.dart';
import '../model/form_data_model.dart';

class Page3Form extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page3Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page3Form> createState() => _Page3FormState();
}

class _Page3FormState extends State<Page3Form> {
  late TextEditingController _firstApplicantCustomerIdController;
  late TextEditingController _secondApplicantCustomerIdController;
  late TextEditingController _atmCardNameController;
  late TextEditingController _fdAmountController;
  late TextEditingController _rdInstallmentController;
  late TextEditingController _debitAccountNoController;
  late TextEditingController _modeOfOperationOtherController;
  late TextEditingController _nominationRegistrationNoController;
  late TextEditingController _depositTypeController;
  late TextEditingController _nominationAccountNoController;

  // New Part-II fields
  late TextEditingController _page3DateController;
  late TextEditingController _page3AccountNoController;
  late TextEditingController _modeOfOperationOtherTextController;

  // Account Type checkboxes
  bool _accountTypeSavingsBank = false;
  bool _accountTypeBSBDA = false;
  bool _accountTypeSmallAccount = false;
  bool _accountTypeCurrent = false;
  bool _accountTypeFixedDeposit = false;
  bool _accountTypeCapsGain = false;

  // Mode of Operation checkboxes
  bool _modeOfOperationSelf = false;
  bool _modeOfOperationEitherOrSurvivor = false;
  bool _modeOfOperationFormerOrSurvivor = false;
  bool _modeOfOperationAnyoneOrSurvivor = false;
  bool _modeOfOperationJointly = false;
  bool _modeOfOperationOther = false;

  // Section 3: Services Required
  bool _atmCard1stApplicant = false;
  bool _atmCard2ndApplicant = false;
  late TextEditingController _atmCardName1stApplicantController;
  late TextEditingController _atmCardName2ndApplicantController;
  bool _chequeBookYes = false;
  bool _chequeBookNo = false;
  bool _internetBanking1stApplicantYes = false;
  bool _internetBanking1stApplicantNo = false;
  bool _internetBanking2ndApplicantYes = false;
  bool _internetBanking2ndApplicantNo = false;
  bool _smsAlertYes = false;
  bool _smsAlertNo = false;
  bool _phoneBankingYes = false;
  bool _phoneBankingNo = false;
  bool _mobileBankingYes = false;
  bool _mobileBankingNo = false;
  bool _passbookYes = false;
  bool _passbookNo = false;
  bool _eStatementRequired = false;
  bool _eStatementNotRequired = false;

  @override
  void initState() {
    super.initState();
    _firstApplicantCustomerIdController = TextEditingController(
      text: widget.initialData.firstApplicantCustomerId,
    );
    _secondApplicantCustomerIdController = TextEditingController(
      text: widget.initialData.secondApplicantCustomerId,
    );
    _atmCardNameController = TextEditingController(
      text: widget.initialData.atmCardName,
    );
    _fdAmountController = TextEditingController(
      text: widget.initialData.fdAmount,
    );
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

    // Initialize new Part-II fields
    _page3DateController = TextEditingController(
      text: widget.initialData.page3Date,
    );
    _page3AccountNoController = TextEditingController(
      text: widget.initialData.page3AccountNo,
    );
    _modeOfOperationOtherTextController = TextEditingController(
      text: widget.initialData.modeOfOperationOtherText,
    );

    // Initialize account type checkboxes
    _accountTypeSavingsBank = widget.initialData.accountTypeSavingsBank;
    _accountTypeBSBDA = widget.initialData.accountTypeBSBDA;
    _accountTypeSmallAccount = widget.initialData.accountTypeSmallAccount;
    _accountTypeCurrent = widget.initialData.accountTypeCurrent;
    _accountTypeFixedDeposit = widget.initialData.accountTypeFixedDeposit;
    _accountTypeCapsGain = widget.initialData.accountTypeCapsGain;

    // Initialize mode of operation checkboxes
    _modeOfOperationSelf = widget.initialData.modeOfOperationSelf;
    _modeOfOperationEitherOrSurvivor =
        widget.initialData.modeOfOperationEitherOrSurvivor;
    _modeOfOperationFormerOrSurvivor =
        widget.initialData.modeOfOperationFormerOrSurvivor;
    _modeOfOperationAnyoneOrSurvivor =
        widget.initialData.modeOfOperationAnyoneOrSurvivor;
    _modeOfOperationJointly = widget.initialData.modeOfOperationJointly;
    _modeOfOperationOther = widget.initialData.modeOfOperationOtherCheckbox;

    // Initialize service controllers and checkboxes
    _atmCardName1stApplicantController = TextEditingController(
      text: widget.initialData.atmCardName1stApplicant,
    );
    _atmCardName2ndApplicantController = TextEditingController(
      text: widget.initialData.atmCardName2ndApplicant,
    );
    _atmCard1stApplicant = widget.initialData.atmCard1stApplicant;
    _atmCard2ndApplicant = widget.initialData.atmCard2ndApplicant;
    _chequeBookYes = widget.initialData.chequeBookYes;
    _chequeBookNo = widget.initialData.chequeBookNo;
    _internetBanking1stApplicantYes =
        widget.initialData.internetBanking1stApplicantYes;
    _internetBanking1stApplicantNo =
        widget.initialData.internetBanking1stApplicantNo;
    _internetBanking2ndApplicantYes =
        widget.initialData.internetBanking2ndApplicantYes;
    _internetBanking2ndApplicantNo =
        widget.initialData.internetBanking2ndApplicantNo;
    _smsAlertYes = widget.initialData.smsAlertYes;
    _smsAlertNo = widget.initialData.smsAlertNo;
    _phoneBankingYes = widget.initialData.phoneBankingYes;
    _phoneBankingNo = widget.initialData.phoneBankingNo;
    _mobileBankingYes = widget.initialData.mobileBankingYes;
    _mobileBankingNo = widget.initialData.mobileBankingNo;
    _passbookYes = widget.initialData.passbookYes;
    _passbookNo = widget.initialData.passbookNo;
    _eStatementRequired = widget.initialData.eStatementRequired;
    _eStatementNotRequired = widget.initialData.eStatementNotRequired;

    _addListeners();
  }

  void _addListeners() {
    _firstApplicantCustomerIdController.addListener(_notifyChange);
    _secondApplicantCustomerIdController.addListener(_notifyChange);
    _atmCardNameController.addListener(_notifyChange);
    _fdAmountController.addListener(_notifyChange);
    _rdInstallmentController.addListener(_notifyChange);
    _debitAccountNoController.addListener(_notifyChange);
    _modeOfOperationOtherController.addListener(_notifyChange);
    _nominationRegistrationNoController.addListener(_notifyChange);
    _depositTypeController.addListener(_notifyChange);
    _nominationAccountNoController.addListener(_notifyChange);

    // Add listeners for new Part-II fields
    _page3DateController.addListener(_notifyChange);
    _page3AccountNoController.addListener(_notifyChange);
    _modeOfOperationOtherTextController.addListener(_notifyChange);

    // Add listeners for service fields
    _atmCardName1stApplicantController.addListener(_notifyChange);
    _atmCardName2ndApplicantController.addListener(_notifyChange);
  }

  void _notifyChange() {
    widget.onDataChanged(_buildUpdatedData());
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
      atmCardName: _atmCardNameController.text,
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
      form60Surname: widget.initialData.form60Surname,
      form60FatherName: widget.initialData.form60FatherName,
      form60VerifiedDay: widget.initialData.form60VerifiedDay,
      form60VerifiedMonth: widget.initialData.form60VerifiedMonth,
      form60VerifiedYear: widget.initialData.form60VerifiedYear,
      form60VerificationPlace: widget.initialData.form60VerificationPlace,
      form60FlatNo: widget.initialData.form60FlatNo,
      form60PremisesName: widget.initialData.form60PremisesName,
      form60Road: widget.initialData.form60Road,
      form60AreaLocality: widget.initialData.form60AreaLocality,
      form60TownDistrictState: widget.initialData.form60TownDistrictState,
      form60StdCode: widget.initialData.form60StdCode,
      form60TelephoneNo: widget.initialData.form60TelephoneNo,
      form60TransactionAmount: widget.initialData.form60TransactionAmount,
      form60TransactionDate: widget.initialData.form60TransactionDate,
      form60NoOfPersons: widget.initialData.form60NoOfPersons,
      form60PanApplicationDate: widget.initialData.form60PanApplicationDate,
      form60PanAckNo: widget.initialData.form60PanAckNo,
      form60AgriculturalIncome: widget.initialData.form60AgriculturalIncome,
      form60OtherIncome: widget.initialData.form60OtherIncome,
      form60IdentityDocCode: widget.initialData.form60IdentityDocCode,
      form60IdentityDocNo: widget.initialData.form60IdentityDocNo,
      form60IdentityIssuingAuthority:
          widget.initialData.form60IdentityIssuingAuthority,
      form60AddressDocCode: widget.initialData.form60AddressDocCode,
      form60AddressDocNo: widget.initialData.form60AddressDocNo,
      form60AddressIssuingAuthority:
          widget.initialData.form60AddressIssuingAuthority,
      relatedPersonFirstName: widget.initialData.relatedPersonFirstName,
      relatedPersonPrefix: widget.initialData.relatedPersonPrefix,
      relatedPersonDocNo: widget.initialData.relatedPersonDocNo,
      signature1Text: widget.initialData.signature1Text,
      signature2Text: widget.initialData.signature2Text,

      // Add new Part-II fields
      page3Date: _page3DateController.text,
      page3AccountNo: _page3AccountNoController.text,
      accountTypeSavingsBank: _accountTypeSavingsBank,
      accountTypeBSBDA: _accountTypeBSBDA,
      accountTypeSmallAccount: _accountTypeSmallAccount,
      accountTypeCurrent: _accountTypeCurrent,
      accountTypeFixedDeposit: _accountTypeFixedDeposit,
      accountTypeCapsGain: _accountTypeCapsGain,
      modeOfOperationSelf: _modeOfOperationSelf,
      modeOfOperationEitherOrSurvivor: _modeOfOperationEitherOrSurvivor,
      modeOfOperationFormerOrSurvivor: _modeOfOperationFormerOrSurvivor,
      modeOfOperationAnyoneOrSurvivor: _modeOfOperationAnyoneOrSurvivor,
      modeOfOperationJointly: _modeOfOperationJointly,
      modeOfOperationOtherCheckbox: _modeOfOperationOther,
      modeOfOperationOtherText: _modeOfOperationOtherTextController.text,

      // Add service fields
      atmCard1stApplicant: _atmCard1stApplicant,
      atmCard2ndApplicant: _atmCard2ndApplicant,
      atmCardName1stApplicant: _atmCardName1stApplicantController.text,
      atmCardName2ndApplicant: _atmCardName2ndApplicantController.text,
      chequeBookYes: _chequeBookYes,
      chequeBookNo: _chequeBookNo,
      internetBanking1stApplicantYes: _internetBanking1stApplicantYes,
      internetBanking1stApplicantNo: _internetBanking1stApplicantNo,
      internetBanking2ndApplicantYes: _internetBanking2ndApplicantYes,
      internetBanking2ndApplicantNo: _internetBanking2ndApplicantNo,
      smsAlertYes: _smsAlertYes,
      smsAlertNo: _smsAlertNo,
      phoneBankingYes: _phoneBankingYes,
      phoneBankingNo: _phoneBankingNo,
      mobileBankingYes: _mobileBankingYes,
      mobileBankingNo: _mobileBankingNo,
      passbookYes: _passbookYes,
      passbookNo: _passbookNo,
      eStatementRequired: _eStatementRequired,
      eStatementNotRequired: _eStatementNotRequired,
    );
  }

  @override
  void dispose() {
    _firstApplicantCustomerIdController.dispose();
    _secondApplicantCustomerIdController.dispose();
    _atmCardNameController.dispose();
    _fdAmountController.dispose();
    _rdInstallmentController.dispose();
    _debitAccountNoController.dispose();
    _modeOfOperationOtherController.dispose();
    _nominationRegistrationNoController.dispose();
    _depositTypeController.dispose();
    _nominationAccountNoController.dispose();

    // Dispose new Part-II controllers
    _page3DateController.dispose();
    _page3AccountNoController.dispose();
    _modeOfOperationOtherTextController.dispose();

    // Dispose service controllers
    _atmCardName1stApplicantController.dispose();
    _atmCardName2ndApplicantController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Center(
            child: Column(
              children: [
                Text(
                  'ACCOUNT OPENING FORM FOR INDIVIDUAL (PART - II)',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  '(SAVING BANK, CURRENT ACCOUNT AND TERM DEPOSITS)',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Instruction text
          const Text(
            'Fields marked asterix (*) are mandatory. Please fill up in BLOCK letters only and use black ink for signature',
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20),

          // Date and Stamp section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Date: '),
                        Expanded(
                          child: _buildTextField(
                            '',
                            _page3DateController,
                            maxLength: 10,
                            hint: 'DD/MM/YYYY',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Center(
                    child: Text(
                      'Bank/Branch to affix rubber stamp of\nname and code no.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // For office use only section
          const Text(
            '(For office use only)',
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 12),
          _buildTextField(
            'First Applicant Customer ID',
            _firstApplicantCustomerIdController,
          ),
          _buildTextField(
            'Second Applicant Customer ID',
            _secondApplicantCustomerIdController,
          ),
          _buildTextField('Account No.', _page3AccountNoController),
          const SizedBox(height: 30),

          // Request text
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border.all(color: Colors.blue.shade200),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'I/We request you to open my/our deposit account with your branch/bank as under: (Tick (✓) relevant type of account)',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),

          // Section 1: Type of Account
          _buildSectionTitle('1. Type of Account'),
          _buildCheckbox('SAVINGS BANK ACCOUNT', _accountTypeSavingsBank, (
            value,
          ) {
            setState(() {
              _accountTypeSavingsBank = value ?? false;
              _notifyChange();
            });
          }),
          _buildCheckbox('BSBDA', _accountTypeBSBDA, (value) {
            setState(() {
              _accountTypeBSBDA = value ?? false;
              _notifyChange();
            });
          }),
          _buildCheckbox('SMALL ACCOUNT', _accountTypeSmallAccount, (value) {
            setState(() {
              _accountTypeSmallAccount = value ?? false;
              _notifyChange();
            });
          }),
          _buildCheckbox('CURRENT ACCOUNT', _accountTypeCurrent, (value) {
            setState(() {
              _accountTypeCurrent = value ?? false;
              _notifyChange();
            });
          }),
          _buildCheckbox('FIXED DEPOSIT/FLEXI/RD', _accountTypeFixedDeposit, (
            value,
          ) {
            setState(() {
              _accountTypeFixedDeposit = value ?? false;
              _notifyChange();
            });
          }),
          _buildCheckbox('CAPS GAIN(SB)', _accountTypeCapsGain, (value) {
            setState(() {
              _accountTypeCapsGain = value ?? false;
              _notifyChange();
            });
          }),
          const SizedBox(height: 30),

          // Section 2: Mode of Operation
          _buildSectionTitle('2. Mode of Operation'),
          _buildCheckbox('Self', _modeOfOperationSelf, (value) {
            setState(() {
              _modeOfOperationSelf = value ?? false;
              _notifyChange();
            });
          }),
          _buildCheckbox(
            'Either or Survivor',
            _modeOfOperationEitherOrSurvivor,
            (value) {
              setState(() {
                _modeOfOperationEitherOrSurvivor = value ?? false;
                _notifyChange();
              });
            },
          ),
          _buildCheckbox(
            'Former or Survivor',
            _modeOfOperationFormerOrSurvivor,
            (value) {
              setState(() {
                _modeOfOperationFormerOrSurvivor = value ?? false;
                _notifyChange();
              });
            },
          ),
          _buildCheckbox(
            'Any one or Survivor',
            _modeOfOperationAnyoneOrSurvivor,
            (value) {
              setState(() {
                _modeOfOperationAnyoneOrSurvivor = value ?? false;
                _notifyChange();
              });
            },
          ),
          _buildCheckbox('Jointly Operated', _modeOfOperationJointly, (value) {
            setState(() {
              _modeOfOperationJointly = value ?? false;
              _notifyChange();
            });
          }),
          Row(
            children: [
              Checkbox(
                value: _modeOfOperationOther,
                onChanged: (value) {
                  setState(() {
                    _modeOfOperationOther = value ?? false;
                    _notifyChange();
                  });
                },
              ),
              const Text('Other'),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField(
                  '',
                  _modeOfOperationOtherTextController,
                  hint: 'Specify',
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Section 3: Services Required
          _buildSectionTitle('Services Required'),
          const SizedBox(height: 16),

          // ATM-cum-Debit Card
          const Text(
            'ATM-cum-Debit Card:',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text('1st Applicant'),
                  value: _atmCard1stApplicant,
                  onChanged: (value) {
                    setState(() {
                      _atmCard1stApplicant = value ?? false;
                      _notifyChange();
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: const Text('2nd Applicant'),
                  value: _atmCard2ndApplicant,
                  onChanged: (value) {
                    setState(() {
                      _atmCard2ndApplicant = value ?? false;
                      _notifyChange();
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildTextField(
            'Name on Card',
            _atmCardName1stApplicantController,
            hint: 'Enter name as it should appear on card',
          ),
          const SizedBox(height: 24),

          // Net Banking
          const Text(
            'Net Banking:',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('Yes'),
                  value: true,
                  groupValue: _internetBanking1stApplicantYes
                      ? true
                      : (_internetBanking1stApplicantNo ? false : null),
                  onChanged: (value) {
                    setState(() {
                      _internetBanking1stApplicantYes = true;
                      _internetBanking1stApplicantNo = false;
                      _notifyChange();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('No'),
                  value: false,
                  groupValue: _internetBanking1stApplicantYes
                      ? true
                      : (_internetBanking1stApplicantNo ? false : null),
                  onChanged: (value) {
                    setState(() {
                      _internetBanking1stApplicantYes = false;
                      _internetBanking1stApplicantNo = true;
                      _notifyChange();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Mobile Banking
          const Text(
            'Mobile Banking:',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('Yes'),
                  value: true,
                  groupValue: _mobileBankingYes
                      ? true
                      : (_mobileBankingNo ? false : null),
                  onChanged: (value) {
                    setState(() {
                      _mobileBankingYes = true;
                      _mobileBankingNo = false;
                      _notifyChange();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('No'),
                  value: false,
                  groupValue: _mobileBankingYes
                      ? true
                      : (_mobileBankingNo ? false : null),
                  onChanged: (value) {
                    setState(() {
                      _mobileBankingYes = false;
                      _mobileBankingNo = true;
                      _notifyChange();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // SMS Alert
          const Text(
            'SMS Alert:',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('Yes'),
                  value: true,
                  groupValue: _smsAlertYes
                      ? true
                      : (_smsAlertNo ? false : null),
                  onChanged: (value) {
                    setState(() {
                      _smsAlertYes = true;
                      _smsAlertNo = false;
                      _notifyChange();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('No'),
                  value: false,
                  groupValue: _smsAlertYes
                      ? true
                      : (_smsAlertNo ? false : null),
                  onChanged: (value) {
                    setState(() {
                      _smsAlertYes = false;
                      _smsAlertNo = true;
                      _notifyChange();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Email Statement
          const Text(
            'Email Statement:',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('Yes'),
                  value: true,
                  groupValue: _eStatementRequired
                      ? true
                      : (_eStatementNotRequired ? false : null),
                  onChanged: (value) {
                    setState(() {
                      _eStatementRequired = true;
                      _eStatementNotRequired = false;
                      _notifyChange();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('No'),
                  value: false,
                  groupValue: _eStatementRequired
                      ? true
                      : (_eStatementNotRequired ? false : null),
                  onChanged: (value) {
                    setState(() {
                      _eStatementRequired = false;
                      _eStatementNotRequired = true;
                      _notifyChange();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Cheque Book
          const Text(
            'Cheque Book:',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('Yes'),
                  value: true,
                  groupValue: _chequeBookYes
                      ? true
                      : (_chequeBookNo ? false : null),
                  onChanged: (value) {
                    setState(() {
                      _chequeBookYes = true;
                      _chequeBookNo = false;
                      _notifyChange();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('No'),
                  value: false,
                  groupValue: _chequeBookYes
                      ? true
                      : (_chequeBookNo ? false : null),
                  onChanged: (value) {
                    setState(() {
                      _chequeBookYes = false;
                      _chequeBookNo = true;
                      _notifyChange();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Nomination Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nomination',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Do you wish to nominate?',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<bool>(
                        title: const Text('Yes'),
                        value: true,
                        groupValue: widget.initialData.nominationYes
                            ? true
                            : (widget.initialData.nominationNo ? false : null),
                        onChanged: (value) {
                          setState(() {
                            _notifyChange();
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<bool>(
                        title: const Text('No'),
                        value: false,
                        groupValue: widget.initialData.nominationYes
                            ? true
                            : (widget.initialData.nominationNo ? false : null),
                        onChanged: (value) {
                          setState(() {
                            _notifyChange();
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Existing fields (keep for backward compatibility)
          _buildSectionTitle('Fixed Deposit'),
          _buildTextField(
            'FD Amount',
            _fdAmountController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          _buildSectionTitle('Recurring Deposit'),
          _buildTextField(
            'RD Installment',
            _rdInstallmentController,
            keyboardType: TextInputType.number,
          ),
          _buildTextField('Debit Account No', _debitAccountNoController),
          const SizedBox(height: 20),
          _buildSectionTitle('Mode of Operation (Old)'),
          _buildTextField(
            'Mode of Operation (Other)',
            _modeOfOperationOtherController,
          ),
          const SizedBox(height: 20),
          _buildSectionTitle('Nomination Details'),
          _buildTextField(
            'Nomination Registration No',
            _nominationRegistrationNoController,
          ),
          _buildTextField('Deposit Type', _depositTypeController),
          _buildTextField(
            'Nomination Account No',
            _nominationAccountNoController,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    String? hint,
    TextInputType? keyboardType,
    int maxLines = 1,
    int? maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label.isNotEmpty ? label : null,
          hintText: hint,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
      ),
    );
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(label),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}
