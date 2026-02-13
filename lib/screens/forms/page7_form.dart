// lib/screens/forms/page7_form.dart

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/form_data_model.dart';
import 'form_helper.dart';

class Page7Form extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page7Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page7Form> createState() => _Page7FormState();
}

class _Page7FormState extends State<Page7Form> {
  // Controllers for Form No.60 fields (Rows 1-16)
  late TextEditingController _firstNameController;
  late TextEditingController _middleNameController;
  late TextEditingController _surnameController;
  late TextEditingController _dobController;
  late TextEditingController _fatherNameController;
  late TextEditingController _flatNoController;
  late TextEditingController _premisesNameController;
  late TextEditingController _roadStreetController;
  late TextEditingController _areaLocalityController;
  late TextEditingController _townDistrictStateController;
  late TextEditingController _pinCodeController;
  late TextEditingController _telephoneSTDController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _transactionAmountController;
  late TextEditingController _transactionDateController;
  late TextEditingController _jointPersonsCountController;
  late TextEditingController _aadhaarNumberController;

  // Row 17: PAN application details
  late TextEditingController _panApplicationDateController;
  late TextEditingController _panAckNoController;

  // Row 18: Income details
  late TextEditingController _agriculturalIncomeController;
  late TextEditingController _otherIncomeController;

  // Verification section controllers
  late TextEditingController _verifiedDayController;
  late TextEditingController _verifiedMonthController;
  late TextEditingController _verifiedYearController;
  late TextEditingController _verificationPlaceController;

  // Signature image path
  String? _declarantSignaturePath;

  // Mode of transaction checkboxes
  bool _modeCash = false;
  bool _modeCheque = false;
  bool _modeCard = false;
  bool _modeDraft = false;
  bool _modeOnlineTransfer = false;
  bool _modeOther = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with data from FormDataModel
    _firstNameController = TextEditingController(
      text: widget.initialData.form60FirstName,
    );
    _middleNameController = TextEditingController(
      text: widget.initialData.form60MiddleName,
    );
    _surnameController = TextEditingController(
      text: widget.initialData.form60Surname,
    );
    _dobController = TextEditingController(
      text: widget.initialData.form60DateOfBirth,
    );
    _fatherNameController = TextEditingController(
      text: widget.initialData.form60FatherName,
    );
    _flatNoController = TextEditingController(
      text: widget.initialData.form60FlatNo,
    );
    _premisesNameController = TextEditingController(
      text: widget.initialData.form60PremisesName,
    );
    _roadStreetController = TextEditingController(
      text: widget.initialData.form60RoadStreet,
    );
    _areaLocalityController = TextEditingController(
      text: widget.initialData.form60AreaLocality,
    );
    _townDistrictStateController = TextEditingController(
      text: widget.initialData.form60TownDistrictState,
    );
    _pinCodeController = TextEditingController(
      text: widget.initialData.form60PinCode,
    );
    _telephoneSTDController = TextEditingController(
      text: widget.initialData.form60TelephoneSTD,
    );
    _mobileNumberController = TextEditingController(
      text: widget.initialData.form60MobileNumber,
    );
    _transactionAmountController = TextEditingController(
      text: widget.initialData.form60TransactionAmount,
    );
    _transactionDateController = TextEditingController(
      text: widget.initialData.form60TransactionDate,
    );
    _jointPersonsCountController = TextEditingController(
      text: widget.initialData.form60JointPersonsCount,
    );
    _aadhaarNumberController = TextEditingController(
      text: widget.initialData.form60AadhaarNumber,
    );

    // Row 17: PAN application details
    _panApplicationDateController = TextEditingController(
      text: widget.initialData.form60PanApplicationDate,
    );
    _panAckNoController = TextEditingController(
      text: widget.initialData.form60PanAckNo,
    );

    // Row 18: Income details
    _agriculturalIncomeController = TextEditingController(
      text: widget.initialData.form60AgriculturalIncome,
    );
    _otherIncomeController = TextEditingController(
      text: widget.initialData.form60OtherIncome,
    );

    // Verification section controllers
    _verifiedDayController = TextEditingController(
      text: widget.initialData.form60VerifiedDay,
    );
    _verifiedMonthController = TextEditingController(
      text: widget.initialData.form60VerifiedMonth,
    );
    _verifiedYearController = TextEditingController(
      text: widget.initialData.form60VerifiedYear,
    );
    _verificationPlaceController = TextEditingController(
      text: widget.initialData.form60VerificationPlace,
    );

    // Initialize signature path
    _declarantSignaturePath = widget.initialData.form60DeclarantSignature.isNotEmpty
        ? widget.initialData.form60DeclarantSignature
        : null;

    // Initialize checkboxes from model
    _modeCash = widget.initialData.form60ModeCash;
    _modeCheque = widget.initialData.form60ModeCheque;
    _modeCard = widget.initialData.form60ModeCard;
    _modeDraft = widget.initialData.form60ModeDraft;
    _modeOnlineTransfer = widget.initialData.form60ModeOnlineTransfer;
    _modeOther = widget.initialData.form60ModeOther;

    FormHelper.addListeners([
      _firstNameController,
      _middleNameController,
      _surnameController,
      _dobController,
      _fatherNameController,
      _flatNoController,
      _premisesNameController,
      _roadStreetController,
      _areaLocalityController,
      _townDistrictStateController,
      _pinCodeController,
      _telephoneSTDController,
      _mobileNumberController,
      _transactionAmountController,
      _transactionDateController,
      _jointPersonsCountController,
      _aadhaarNumberController,
      _panApplicationDateController,
      _panAckNoController,
      _agriculturalIncomeController,
      _otherIncomeController,
      _verifiedDayController,
      _verifiedMonthController,
      _verifiedYearController,
      _verificationPlaceController,
    ], _notifyChange);
  }

  void _notifyChange() {
    widget.onDataChanged(_buildUpdatedData());
  }

  Future<void> _pickSignatureImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _declarantSignaturePath = image.path;
        _notifyChange();
      });
    }
  }

  FormDataModel _buildUpdatedData() {
    return FormDataModel(
      // Carry forward all existing data from initialData
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
      relatedPersonFirstName: widget.initialData.relatedPersonFirstName,
      relatedPersonPrefix: widget.initialData.relatedPersonPrefix,
      relatedPersonDocNo: widget.initialData.relatedPersonDocNo,
      signature1Text: widget.initialData.signature1Text,
      signature2Text: widget.initialData.signature2Text,
      // Form 60 fields - UPDATED FROM CONTROLLERS
      form60FirstName: _firstNameController.text,
      form60MiddleName: _middleNameController.text,
      form60Surname: _surnameController.text,
      form60DateOfBirth: _dobController.text,
      form60FatherName: _fatherNameController.text,
      form60FlatNo: _flatNoController.text,
      form60PremisesName: _premisesNameController.text,
      form60RoadStreet: _roadStreetController.text,
      form60AreaLocality: _areaLocalityController.text,
      form60TownDistrictState: _townDistrictStateController.text,
      form60PinCode: _pinCodeController.text,
      form60TelephoneSTD: _telephoneSTDController.text,
      form60MobileNumber: _mobileNumberController.text,
      form60TransactionAmount: _transactionAmountController.text,
      form60TransactionDate: _transactionDateController.text,
      form60JointPersonsCount: _jointPersonsCountController.text,
      form60ModeCash: _modeCash,
      form60ModeCheque: _modeCheque,
      form60ModeCard: _modeCard,
      form60ModeDraft: _modeDraft,
      form60ModeOnlineTransfer: _modeOnlineTransfer,
      form60ModeOther: _modeOther,
      form60AadhaarNumber: _aadhaarNumberController.text,
      // Row 17: PAN application details
      form60PanApplicationDate: _panApplicationDateController.text,
      form60PanAckNo: _panAckNoController.text,
      // Row 18: Income details
      form60AgriculturalIncome: _agriculturalIncomeController.text,
      form60OtherIncome: _otherIncomeController.text,
      // Verification section fields
      form60VerifiedDay: _verifiedDayController.text,
      form60VerifiedMonth: _verifiedMonthController.text,
      form60VerifiedYear: _verifiedYearController.text,
      form60VerificationPlace: _verificationPlaceController.text,
      form60DeclarantSignature: _declarantSignaturePath ?? '',
    );
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (val) {
            onChanged(val);
            _notifyChange();
          },
        ),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 12))),
      ],
    );
  }

  Widget _buildSignatureBox() {
    return GestureDetector(
      onTap: _pickSignatureImage,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.shade50,
        ),
        child: _declarantSignaturePath != null
            ? Stack(
                children: [
                  Center(
                    child: kIsWeb
                        ? Image.network(
                            _declarantSignaturePath!,
                            fit: BoxFit.contain,
                          )
                        : Image.file(
                            File(_declarantSignaturePath!),
                            fit: BoxFit.contain,
                          ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _declarantSignaturePath = null;
                          _notifyChange();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.red.shade700,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.draw,
                    size: 40,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Signature of declarant',
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
  void dispose() {
    FormHelper.disposeControllers([
      _firstNameController,
      _middleNameController,
      _surnameController,
      _dobController,
      _fatherNameController,
      _flatNoController,
      _premisesNameController,
      _roadStreetController,
      _areaLocalityController,
      _townDistrictStateController,
      _pinCodeController,
      _telephoneSTDController,
      _mobileNumberController,
      _transactionAmountController,
      _transactionDateController,
      _jointPersonsCountController,
      _aadhaarNumberController,
      _panApplicationDateController,
      _panAckNoController,
      _agriculturalIncomeController,
      _otherIncomeController,
      _verifiedDayController,
      _verifiedMonthController,
      _verifiedYearController,
      _verificationPlaceController,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              border: Border.all(color: Colors.orange.shade700, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                const Text(
                  'Annexure-1',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Income-tax Rules, 1962',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Text(
                  'FORM NO.60',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Text(
                  '[See second proviso to rule 114B]',
                  style: TextStyle(
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Description
          const Text(
            'Form for declaration to be filed by an individual or a person (not being a company or firm) who does not have a permanent account number and who enters into any transaction specified in rule 114B',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),

          // 1. Name
          FormHelper.buildSectionTitle('1. Name'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'First Name',
                  _firstNameController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormHelper.buildTextField(
                  'Middle Name',
                  _middleNameController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormHelper.buildTextField(
                  'Surname',
                  _surnameController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 2. Date of Birth / Incorporation of declarant
          FormHelper.buildSectionTitle(
            '2. Date of Birth / Incorporation of declarant',
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Date of Birth (DD/MM/YYYY)',
            _dobController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 3. Father's Name
          FormHelper.buildSectionTitle(
            '3. Father\'s Name (in case of individual)',
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Father\'s Name',
            _fatherNameController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 4. Flat No./Floor No.
          FormHelper.buildSectionTitle('4. Flat No./Floor No.'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Flat No./Floor No.',
            _flatNoController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 5. Name of premises / Block Name & No.
          FormHelper.buildSectionTitle(
            '5. Name of premises / Block Name & No.',
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Name of premises / Block Name & No.',
            _premisesNameController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 6. Road / Street / Lane
          FormHelper.buildSectionTitle('6. Road / Street / Lane'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Road / Street / Lane',
            _roadStreetController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 7. Area / Locality
          FormHelper.buildSectionTitle('7. Area / Locality'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Area / Locality',
            _areaLocalityController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 8. Town/District/State
          FormHelper.buildSectionTitle('8. Town/District/State'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Town/District/State',
            _townDistrictStateController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 9. Pin code
          FormHelper.buildSectionTitle('9. Pin code'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Pin code',
            _pinCodeController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 10. Telephone Number (with STD code)
          FormHelper.buildSectionTitle('10. Telephone Number (with STD code)'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Telephone Number (with STD code)',
            _telephoneSTDController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 11. Mobile Number
          FormHelper.buildSectionTitle('11. Mobile Number'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Mobile Number',
            _mobileNumberController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 12. Amount of Transaction (Rs.)
          FormHelper.buildSectionTitle('12. Amount of Transaction (Rs.)'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Amount of Transaction (Rs.)',
            _transactionAmountController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 13. Date of transaction
          FormHelper.buildSectionTitle('13. Date of transaction'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Date of transaction (DD/MM/YYYY)',
            _transactionDateController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 14. In case of transaction in joint names
          FormHelper.buildSectionTitle(
            '14. In case of transaction in joint names, number of persons involved in the transaction',
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Number of persons involved',
            _jointPersonsCountController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 15. Mode of transaction
          FormHelper.buildSectionTitle('15. Mode of transaction'),
          const SizedBox(height: 8),
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
                    Expanded(
                      child: _buildCheckbox('Cash', _modeCash, (val) {
                        setState(() {
                          if (val == true) {
                            _modeCash = true;
                            _modeCheque = false;
                            _modeCard = false;
                            _modeDraft = false;
                            _modeOnlineTransfer = false;
                            _modeOther = false;
                          } else {
                            _modeCash = false;
                          }
                        });
                      }),
                    ),
                    Expanded(
                      child: _buildCheckbox('Cheque', _modeCheque, (val) {
                        setState(() {
                          if (val == true) {
                            _modeCheque = true;
                            _modeCash = false;
                            _modeCard = false;
                            _modeDraft = false;
                            _modeOnlineTransfer = false;
                            _modeOther = false;
                          } else {
                            _modeCheque = false;
                          }
                        });
                      }),
                    ),
                    Expanded(
                      child: _buildCheckbox('Card', _modeCard, (val) {
                        setState(() {
                          if (val == true) {
                            _modeCard = true;
                            _modeCash = false;
                            _modeCheque = false;
                            _modeDraft = false;
                            _modeOnlineTransfer = false;
                            _modeOther = false;
                          } else {
                            _modeCard = false;
                          }
                        });
                      }),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildCheckbox('Draft/Banker\'s Cheque', _modeDraft, (val) {
                        setState(() {
                          if (val == true) {
                            _modeDraft = true;
                            _modeCash = false;
                            _modeCheque = false;
                            _modeCard = false;
                            _modeOnlineTransfer = false;
                            _modeOther = false;
                          } else {
                            _modeDraft = false;
                          }
                        });
                      }),
                    ),
                    Expanded(
                      child: _buildCheckbox('Online transfer', _modeOnlineTransfer, (val) {
                        setState(() {
                          if (val == true) {
                            _modeOnlineTransfer = true;
                            _modeCash = false;
                            _modeCheque = false;
                            _modeCard = false;
                            _modeDraft = false;
                            _modeOther = false;
                          } else {
                            _modeOnlineTransfer = false;
                          }
                        });
                      }),
                    ),
                    Expanded(
                      child: _buildCheckbox('Other', _modeOther, (val) {
                        setState(() {
                          if (val == true) {
                            _modeOther = true;
                            _modeCash = false;
                            _modeCheque = false;
                            _modeCard = false;
                            _modeDraft = false;
                            _modeOnlineTransfer = false;
                          } else {
                            _modeOther = false;
                          }
                        });
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 16. Aadhaar Number
          FormHelper.buildSectionTitle(
            '16. Aadhaar Number issued by UIDAI (if available)',
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Aadhaar Number',
            _aadhaarNumberController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 17. If applied for PAN
          FormHelper.buildSectionTitle(
            '17. If applied for PAN and it is not yet generated enter date of application and acknowledgement number',
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'Date of Application',
                  _panApplicationDateController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'Acknowledgement Number',
                  _panAckNoController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 18. If PAN not applied - Income details
          FormHelper.buildSectionTitle(
            '18. If PAN not applied, fill estimated total income (as per section 64 of Income-tax Act, 1961)',
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  '(a) Agricultural Income (Rs.)',
                  _agriculturalIncomeController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  '(b) Other than Agr Income (Rs.)',
                  _otherIncomeController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 19. Details of document for identity (informational only)
          FormHelper.buildSectionTitle(
            '19. Details of document being produced in support of identity in Column 1 (Refer Instruction overleaf)',
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'This section is for bank use only. Document details will be verified and filled by the bank official.',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),

          // 20. Details of document for address (informational only)
          FormHelper.buildSectionTitle(
            '20. Details of document being produced in support of address in Column 4 to 13 (Refer Instruction overleaf)',
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'This section is for bank use only. Document details will be verified and filled by the bank official.',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 30),

          // ===== VERIFICATION SECTION =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border.all(color: Colors.blue.shade300, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Verification',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Declaration text
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: const TextStyle(fontSize: 12, color: Colors.black, height: 1.5),
                    children: [
                      const TextSpan(text: 'I, '),
                      TextSpan(
                        text: '${_firstNameController.text} ${_middleNameController.text} ${_surnameController.text}'.trim().isEmpty 
                          ? '___________________________' 
                          : '${_firstNameController.text} ${_middleNameController.text} ${_surnameController.text}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text: ' do hereby declare that what is stated above is true to the best of my knowledge and belief. I further declare that I do not have a Permanent Account Number and my / our estimated total income (including income of spouse, minor child etc., as per section 64 of Income Tax Act, 1961) computed in accordance with the provisions of Income tax Act, 1961 for the financial year in which the above transaction is held will be less than maximum amount not chargeable to tax.',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                
                // Verified date
                const Text(
                  'Verified today the:',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                FormHelper.buildTextField(
                  'Day',
                  _verifiedDayController,
                  maxLines: 1,
                ),
                const SizedBox(height: 12),
                FormHelper.buildTextField(
                  'Month',
                  _verifiedMonthController,
                  maxLines: 1,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('20', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: FormHelper.buildTextField(
                        'Year (e.g. 24, 25)',
                        _verifiedYearController,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Place and Signature
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Place:',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          FormHelper.buildTextField(
                            'Place',
                            _verificationPlaceController,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Signature of declarant:',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          _buildSignatureBox(),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Note section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    border: Border.all(color: Colors.orange.shade300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Note:',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Before signing the declaration, the declarant should satisfy himself that the information furnished in this form is true, correct and complete in all respects. Any person making a false statement in the declaration shall be liable to prosecution under section 277 of the Income-Tax Act, 1961 and on conviction be punishable,',
                        style: TextStyle(fontSize: 10, height: 1.4),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '(i) in a case where tax sought to be evaded exceeds twenty-five lakh rupees, with rigorous imprisonment which shall not be less than six months but which may extend to seven years and with fine;',
                        style: TextStyle(fontSize: 10, height: 1.4),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '(ii) in any other case, with rigorous imprisonment which shall not be less than three months but which may extend to two years and with fine.',
                        style: TextStyle(fontSize: 10, height: 1.4),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
