// lib/screens/forms/page9_form.dart

import 'package:flutter/material.dart';
import '../model/form_data_model.dart';
import 'form_helper.dart';

class Page9Form extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page9Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page9Form> createState() => _Page9FormState();
}

class _Page9FormState extends State<Page9Form> {
  late TextEditingController _relatedPersonPrefixController;
  late TextEditingController _relatedPersonFirstNameController;
  late TextEditingController _relatedPersonDocNoController;

  @override
  void initState() {
    super.initState();
    _relatedPersonPrefixController = TextEditingController(
      text: widget.initialData.relatedPersonPrefix,
    );
    _relatedPersonFirstNameController = TextEditingController(
      text: widget.initialData.relatedPersonFirstName,
    );
    _relatedPersonDocNoController = TextEditingController(
      text: widget.initialData.relatedPersonDocNo,
    );

    FormHelper.addListeners([
      _relatedPersonPrefixController,
      _relatedPersonFirstNameController,
      _relatedPersonDocNoController,
    ], _notifyChange);
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
      relatedPersonPrefix: _relatedPersonPrefixController.text,
      relatedPersonFirstName: _relatedPersonFirstNameController.text,
      relatedPersonDocNo: _relatedPersonDocNoController.text,
      signature1Text: widget.initialData.signature1Text,
      signature2Text: widget.initialData.signature2Text,
    );
  }

  @override
  void dispose() {
    FormHelper.disposeControllers([
      _relatedPersonPrefixController,
      _relatedPersonFirstNameController,
      _relatedPersonDocNoController,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Annexure-2: Politically Exposed Person',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          FormHelper.buildSectionTitle('Related Person Details'),
          FormHelper.buildTextField(
            'Prefix',
            _relatedPersonPrefixController,
            hint: 'Mr/Mrs/Ms',
          ),
          FormHelper.buildTextField(
            'First Name',
            _relatedPersonFirstNameController,
          ),
          FormHelper.buildTextField(
            'Document No',
            _relatedPersonDocNoController,
          ),
        ],
      ),
    );
  }
}
