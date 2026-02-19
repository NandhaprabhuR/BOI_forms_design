// lib/screens/forms/page2_form.dart

import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/form_data_model.dart';
import 'form_helper.dart';

class Page2Form extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page2Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page2Form> createState() => _Page2FormState();
}

class _Page2FormState extends State<Page2Form> {
  // Section 5: Address type checkboxes
  bool _addressTypeResidentialBusiness = false;
  bool _addressTypeResidential = false;
  bool _addressTypeBusiness = false;
  bool _addressTypeRegisteredOffice = false;
  bool _addressTypeUnspecified = false;

  // Section 5: Address details controllers
  late TextEditingController _correspondenceAddressController;
  late TextEditingController _correspondenceAddressLine2Controller;
  late TextEditingController _correspondenceCityController;
  late TextEditingController _correspondenceDistrictController;
  late TextEditingController _correspondenceStateController;
  late TextEditingController _correspondencePinController;

  late TextEditingController _localAddressController;
  late TextEditingController _localAddressLine2Controller;
  late TextEditingController _localCityController;
  late TextEditingController _localDistrictController;
  late TextEditingController _localStateController;
  late TextEditingController _localPinController;

  late TextEditingController _sameAsAddressController;
  late TextEditingController _sameAsAddressLine2Controller;
  late TextEditingController _sameAsCityController;
  late TextEditingController _sameAsDistrictController;
  late TextEditingController _sameAsStateController;
  late TextEditingController _sameAsPinController;

  // Section 6: Self Declaration
  bool _selfDeclarationAadhaarMismatch = false;

  // Section 7: Alternative address proof
  bool _altProofUtilityBill = false;
  bool _altProofPPOFPPO = false;
  bool _altProofPropertyTaxReceipt = false;
  bool _altProofLetterOfAllotment = false;
  late TextEditingController _altProofDocumentNoController;
  late TextEditingController _altProofDateController;

  // Section 8: Declaration cum Undertaking
  bool _declarationTermsAccepted = false;
  bool _declarationAadhaarSubmitted = false;
  bool _biometricConsentYes = false;
  bool _biometricConsentNo = false;
  String? _applicantPhotoPath;
  String? _applicantSignaturePath;

  // Section 9: Official signature image
  String? _officialSignaturePath;

  late TextEditingController _ovdDocumentNoController;
  late TextEditingController _ovdDocumentDateController;
  late TextEditingController _applicantSignatureNameController;
  late TextEditingController _declarationPlaceController;
  late TextEditingController _declarationDateController;

  // Section 9: Office Use/Attestation
  bool _officeVerificationYes = false;
  bool _officeVerificationNo = false;
  bool _depositorIlliterate = false;
  bool _depositorBlind = false;
  late TextEditingController _depositorStaffController;
  bool _riskCategoryHigh = false;
  bool _riskCategoryMedium = false;
  bool _riskCategoryLow = false;
  late TextEditingController _officeIdentificationMarksController;
  late TextEditingController _officialNameController;
  late TextEditingController _pfNoController;
  late TextEditingController _designationController;
  late TextEditingController _ssNoController;
  late TextEditingController _officeUseDateController;
  late TextEditingController _officialSignatureController;

  @override
  void initState() {
    super.initState();
    // Section 5: Address type initialization
    _addressTypeResidentialBusiness =
        widget.initialData.addressTypeResidentialBusiness;
    _addressTypeResidential = widget.initialData.addressTypeResidential;
    _addressTypeBusiness = widget.initialData.addressTypeBusiness;
    _addressTypeRegisteredOffice =
        widget.initialData.addressTypeRegisteredOffice;
    _addressTypeUnspecified = widget.initialData.addressTypeUnspecified;

    // Section 5: Address details initialization
    _correspondenceAddressController = TextEditingController(
      text: widget.initialData.correspondenceAddress,
    );
    _correspondenceAddressLine2Controller = TextEditingController(
      text: widget.initialData.correspondenceAddressLine2,
    );
    _correspondenceCityController = TextEditingController(
      text: widget.initialData.correspondenceCity,
    );
    _correspondenceDistrictController = TextEditingController(
      text: widget.initialData.correspondenceDistrict,
    );
    _correspondenceStateController = TextEditingController(
      text: widget.initialData.correspondenceState,
    );
    _correspondencePinController = TextEditingController(
      text: widget.initialData.correspondencePin,
    );

    _localAddressController = TextEditingController(
      text: widget.initialData.localAddress,
    );
    _localAddressLine2Controller = TextEditingController(
      text: widget.initialData.localAddressLine2,
    );
    _localCityController = TextEditingController(
      text: widget.initialData.localCity,
    );
    _localDistrictController = TextEditingController(
      text: widget.initialData.localDistrict,
    );
    _localStateController = TextEditingController(
      text: widget.initialData.localState,
    );
    _localPinController = TextEditingController(
      text: widget.initialData.localPin,
    );

    _sameAsAddressController = TextEditingController(
      text: widget.initialData.sameAsAddress,
    );
    _sameAsAddressLine2Controller = TextEditingController(
      text: widget.initialData.sameAsAddressLine2,
    );
    _sameAsCityController = TextEditingController(
      text: widget.initialData.sameAsCity,
    );
    _sameAsDistrictController = TextEditingController(
      text: widget.initialData.sameAsDistrict,
    );
    _sameAsStateController = TextEditingController(
      text: widget.initialData.sameAsState,
    );
    _sameAsPinController = TextEditingController(
      text: widget.initialData.sameAsPin,
    );

    // Section 6: Self Declaration
    _selfDeclarationAadhaarMismatch =
        widget.initialData.selfDeclarationAadhaarMismatch;

    // Section 7: Alternative address proof initialization
    _altProofUtilityBill = widget.initialData.altProofUtilityBill;
    _altProofPPOFPPO = widget.initialData.altProofPPOFPPO;
    _altProofPropertyTaxReceipt = widget.initialData.altProofPropertyTaxReceipt;
    _altProofLetterOfAllotment = widget.initialData.altProofLetterOfAllotment;
    _altProofDocumentNoController = TextEditingController(
      text: widget.initialData.altProofDocumentNo,
    );
    _altProofDateController = TextEditingController(
      text: widget.initialData.altProofDate,
    );

    // Section 8: Declaration initialization
    _declarationTermsAccepted = widget.initialData.declarationTermsAccepted;
    _declarationAadhaarSubmitted =
        widget.initialData.declarationAadhaarSubmitted;
    _biometricConsentYes = widget.initialData.biometricConsentYes;
    _biometricConsentNo = widget.initialData.biometricConsentNo;
    _applicantPhotoPath = widget.initialData.applicantPhoto.isEmpty
        ? null
        : widget.initialData.applicantPhoto;
    _applicantSignaturePath = widget.initialData.applicantSignatureImage.isEmpty
        ? null
        : widget.initialData.applicantSignatureImage;
    _declarationPlaceController = TextEditingController(
      text: widget.initialData.declarationPlace,
    );
    _declarationDateController = TextEditingController(
      text: widget.initialData.declarationDate,
    );

    _ovdDocumentNoController = TextEditingController(
      text: widget.initialData.ovdDocumentNo,
    );
    _ovdDocumentDateController = TextEditingController(
      text: widget.initialData.ovdDocumentDate,
    );
    _applicantSignatureNameController = TextEditingController(
      text: widget.initialData.applicantSignatureName,
    );
    _declarationPlaceController = TextEditingController(
      text: widget.initialData.declarationPlace,
    );
    _declarationDateController = TextEditingController(
      text: widget.initialData.declarationDate,
    );
    _officialNameController = TextEditingController(
      text: widget.initialData.officialName,
    );
    _pfNoController = TextEditingController(text: widget.initialData.pfNo);
    _designationController = TextEditingController(
      text: widget.initialData.designation,
    );
    _ssNoController = TextEditingController(text: widget.initialData.ssNo);
    _officeUseDateController = TextEditingController(
      text: widget.initialData.officeUseDate,
    );

    // Section 9: Office Use/Attestation initialization
    _officeVerificationYes = widget.initialData.officeVerificationYes;
    _officeVerificationNo = widget.initialData.officeVerificationNo;
    _depositorIlliterate = widget.initialData.depositorIlliterate;
    _depositorBlind = widget.initialData.depositorBlind;
    _depositorStaffController = TextEditingController(
      text: widget.initialData.depositorStaff,
    );
    _riskCategoryHigh = widget.initialData.riskCategoryHigh;
    _riskCategoryMedium = widget.initialData.riskCategoryMedium;
    _riskCategoryLow = widget.initialData.riskCategoryLow;
    _officeIdentificationMarksController = TextEditingController(
      text: widget.initialData.officeIdentificationMarks,
    );
    _officialSignatureController = TextEditingController(
      text: widget.initialData.officialSignature,
    );
    _officialSignaturePath = widget.initialData.officialSignature.isEmpty
        ? null
        : widget.initialData.officialSignature;

    _addListeners();
  }

  void _addListeners() {
    _correspondenceAddressController.addListener(_notifyChange);
    _correspondenceAddressLine2Controller.addListener(_notifyChange);
    _correspondenceCityController.addListener(_notifyChange);
    _correspondenceDistrictController.addListener(_notifyChange);
    _correspondenceStateController.addListener(_notifyChange);
    _correspondencePinController.addListener(_notifyChange);
    _localAddressController.addListener(_notifyChange);
    _localAddressLine2Controller.addListener(_notifyChange);
    _localCityController.addListener(_notifyChange);
    _localDistrictController.addListener(_notifyChange);
    _localStateController.addListener(_notifyChange);
    _localPinController.addListener(_notifyChange);
    _sameAsAddressController.addListener(_notifyChange);
    _sameAsAddressLine2Controller.addListener(_notifyChange);
    _sameAsCityController.addListener(_notifyChange);
    _sameAsDistrictController.addListener(_notifyChange);
    _sameAsStateController.addListener(_notifyChange);
    _sameAsPinController.addListener(_notifyChange);
    _altProofDocumentNoController.addListener(_notifyChange);
    _altProofDateController.addListener(_notifyChange);
    _declarationPlaceController.addListener(_notifyChange);
    _declarationDateController.addListener(_notifyChange);
    _ovdDocumentNoController.addListener(_notifyChange);
    _ovdDocumentDateController.addListener(_notifyChange);
    _applicantSignatureNameController.addListener(_notifyChange);
    _declarationPlaceController.addListener(_notifyChange);
    _declarationDateController.addListener(_notifyChange);
    _officialNameController.addListener(_notifyChange);
    _pfNoController.addListener(_notifyChange);
    _designationController.addListener(_notifyChange);
    _ssNoController.addListener(_notifyChange);
    _officeUseDateController.addListener(_notifyChange);
    _depositorStaffController.addListener(_notifyChange);
    _officeIdentificationMarksController.addListener(_notifyChange);
    _officialSignatureController.addListener(_notifyChange);
  }

  void _notifyChange() {
    // Page 2 fields - Address type
    widget.initialData.addressTypeResidentialBusiness = _addressTypeResidentialBusiness;
    widget.initialData.addressTypeResidential = _addressTypeResidential;
    widget.initialData.addressTypeBusiness = _addressTypeBusiness;
    widget.initialData.addressTypeRegisteredOffice = _addressTypeRegisteredOffice;
    widget.initialData.addressTypeUnspecified = _addressTypeUnspecified;

    // Page 2 fields - updated from controllers
    widget.initialData.correspondenceAddress = _correspondenceAddressController.text;
    widget.initialData.correspondenceAddressLine2 = _correspondenceAddressLine2Controller.text;
    widget.initialData.correspondenceCity = _correspondenceCityController.text;
    widget.initialData.correspondenceDistrict = _correspondenceDistrictController.text;
    widget.initialData.correspondenceState = _correspondenceStateController.text;
    widget.initialData.correspondencePin = _correspondencePinController.text;
    widget.initialData.localAddress = _localAddressController.text;
    widget.initialData.localAddressLine2 = _localAddressLine2Controller.text;
    widget.initialData.localCity = _localCityController.text;
    widget.initialData.localDistrict = _localDistrictController.text;
    widget.initialData.localState = _localStateController.text;
    widget.initialData.localPin = _localPinController.text;
    widget.initialData.sameAsAddress = _sameAsAddressController.text;
    widget.initialData.sameAsAddressLine2 = _sameAsAddressLine2Controller.text;
    widget.initialData.sameAsCity = _sameAsCityController.text;
    widget.initialData.sameAsDistrict = _sameAsDistrictController.text;
    widget.initialData.sameAsState = _sameAsStateController.text;
    widget.initialData.sameAsPin = _sameAsPinController.text;
    widget.initialData.selfDeclarationAadhaarMismatch = _selfDeclarationAadhaarMismatch;
    widget.initialData.altProofUtilityBill = _altProofUtilityBill;
    widget.initialData.altProofPPOFPPO = _altProofPPOFPPO;
    widget.initialData.altProofPropertyTaxReceipt = _altProofPropertyTaxReceipt;
    widget.initialData.altProofLetterOfAllotment = _altProofLetterOfAllotment;
    widget.initialData.altProofDocumentNo = _altProofDocumentNoController.text;
    widget.initialData.altProofDate = _altProofDateController.text;
    widget.initialData.declarationTermsAccepted = _declarationTermsAccepted;
    widget.initialData.declarationAadhaarSubmitted = _declarationAadhaarSubmitted;
    widget.initialData.biometricConsentYes = _biometricConsentYes;
    widget.initialData.biometricConsentNo = _biometricConsentNo;
    widget.initialData.applicantPhoto = _applicantPhotoPath ?? '';
    widget.initialData.applicantSignatureImage = _applicantSignaturePath ?? '';
    widget.initialData.declarationPlace = _declarationPlaceController.text;
    widget.initialData.declarationDate = _declarationDateController.text;
    widget.initialData.ovdDocumentNo = _ovdDocumentNoController.text;
    widget.initialData.ovdDocumentDate = _ovdDocumentDateController.text;
    widget.initialData.applicantSignatureName = _applicantSignatureNameController.text;
    widget.initialData.officeVerificationYes = _officeVerificationYes;
    widget.initialData.officeVerificationNo = _officeVerificationNo;
    widget.initialData.depositorIlliterate = _depositorIlliterate;
    widget.initialData.depositorBlind = _depositorBlind;
    widget.initialData.depositorStaff = _depositorStaffController.text;
    widget.initialData.riskCategoryHigh = _riskCategoryHigh;
    widget.initialData.riskCategoryMedium = _riskCategoryMedium;
    widget.initialData.riskCategoryLow = _riskCategoryLow;
    widget.initialData.officeIdentificationMarks = _officeIdentificationMarksController.text;
    widget.initialData.officialName = _officialNameController.text;
    widget.initialData.pfNo = _pfNoController.text;
    widget.initialData.designation = _designationController.text;
    widget.initialData.ssNo = _ssNoController.text;
    widget.initialData.officeUseDate = _officeUseDateController.text;
    widget.initialData.officialSignature = _officialSignaturePath ?? '';

    widget.onDataChanged(widget.initialData);
  }

  @override
  void dispose() {
    _correspondenceAddressController.dispose();
    _correspondenceAddressLine2Controller.dispose();
    _correspondenceCityController.dispose();
    _correspondenceDistrictController.dispose();
    _correspondenceStateController.dispose();
    _correspondencePinController.dispose();
    _localAddressController.dispose();
    _localAddressLine2Controller.dispose();
    _localCityController.dispose();
    _localDistrictController.dispose();
    _localStateController.dispose();
    _localPinController.dispose();
    _sameAsAddressController.dispose();
    _sameAsAddressLine2Controller.dispose();
    _sameAsCityController.dispose();
    _sameAsDistrictController.dispose();
    _sameAsStateController.dispose();
    _sameAsPinController.dispose();
    _altProofDocumentNoController.dispose();
    _altProofDateController.dispose();
    _declarationPlaceController.dispose();
    _declarationDateController.dispose();
    _ovdDocumentNoController.dispose();
    _ovdDocumentDateController.dispose();
    _applicantSignatureNameController.dispose();
    _officialNameController.dispose();
    _pfNoController.dispose();
    _designationController.dispose();
    _ssNoController.dispose();
    _officeUseDateController.dispose();
    _depositorStaffController.dispose();
    _officeIdentificationMarksController.dispose();
    _officialSignatureController.dispose();
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
            'Part-I Continuation',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Section 5: Address details
          _buildSectionTitle('Address details'),
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Correspondence',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'Local',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'Same as Current/Permanent Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Address Type checkboxes
          const Text(
            'Address type*',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _addressTypeResidentialBusiness,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _addressTypeResidentialBusiness = true;
                          _addressTypeResidential = false;
                          _addressTypeBusiness = false;
                          _addressTypeRegisteredOffice = false;
                          _addressTypeUnspecified = false;
                        } else {
                          _addressTypeResidentialBusiness = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text('Residential/Business'),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _addressTypeResidential,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _addressTypeResidential = true;
                          _addressTypeResidentialBusiness = false;
                          _addressTypeBusiness = false;
                          _addressTypeRegisteredOffice = false;
                          _addressTypeUnspecified = false;
                        } else {
                          _addressTypeResidential = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text('Residential'),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _addressTypeBusiness,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _addressTypeBusiness = true;
                          _addressTypeResidentialBusiness = false;
                          _addressTypeResidential = false;
                          _addressTypeRegisteredOffice = false;
                          _addressTypeUnspecified = false;
                        } else {
                          _addressTypeBusiness = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text('Business'),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _addressTypeRegisteredOffice,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _addressTypeRegisteredOffice = true;
                          _addressTypeResidentialBusiness = false;
                          _addressTypeResidential = false;
                          _addressTypeBusiness = false;
                          _addressTypeUnspecified = false;
                        } else {
                          _addressTypeRegisteredOffice = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text('Registered Office'),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _addressTypeUnspecified,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _addressTypeUnspecified = true;
                          _addressTypeResidentialBusiness = false;
                          _addressTypeResidential = false;
                          _addressTypeBusiness = false;
                          _addressTypeRegisteredOffice = false;
                        } else {
                          _addressTypeUnspecified = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  const Text('Unspecified'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Correspondence Address
          const Text(
            'Correspondence Address:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 8),
          _buildTextField(
            'Address* Line 1',
            _correspondenceAddressController,
            maxLength: 80,
          ),
          _buildTextField(
            'Address* Line 2',
            _correspondenceAddressLine2Controller,
            maxLength: 80,
          ),
          _buildTextField(
            'City/Village*',
            _correspondenceCityController,
            maxLength: 40,
          ),
          _buildTextField(
            'District*',
            _correspondenceDistrictController,
            maxLength: 60,
          ),
          _buildTextField(
            'State*',
            _correspondenceStateController,
            maxLength: 40,
          ),
          _buildTextField(
            'Pin*',
            _correspondencePinController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            validator: FormHelper.validatePinField,
          ),
          const SizedBox(height: 15),

          // Local Address
          const Text(
            'Local Address:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 8),
          _buildTextField(
            'Address Line 1',
            _localAddressController,
            maxLength: 80,
          ),
          _buildTextField(
            'Address Line 2',
            _localAddressLine2Controller,
            maxLength: 80,
          ),
          _buildTextField('City/Village', _localCityController, maxLength: 40),
          _buildTextField('District', _localDistrictController, maxLength: 60),
          _buildTextField('State', _localStateController, maxLength: 40),
          _buildTextField(
            'Pin',
            _localPinController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            validator: FormHelper.validatePinField,
          ),
          const SizedBox(height: 15),

          // Same as Current/Permanent Address
          const Text(
            'Same as Current/Permanent Address:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 8),
          _buildTextField(
            'Address Line 1',
            _sameAsAddressController,
            maxLength: 80,
          ),
          _buildTextField(
            'Address Line 2',
            _sameAsAddressLine2Controller,
            maxLength: 80,
          ),
          _buildTextField('City/Village', _sameAsCityController, maxLength: 40),
          _buildTextField('District', _sameAsDistrictController, maxLength: 60),
          _buildTextField('State', _sameAsStateController, maxLength: 40),
          _buildTextField(
            'Pin',
            _sameAsPinController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            validator: FormHelper.validatePinField,
          ),
          const SizedBox(height: 20),

          // Section 6: Self Declaration
          _buildSectionTitle(
            'If the Proof of Address as per Aadhaar (OVD) provided does not contain current address.',
          ),
          const Text(
            'If the Proof of Address as per Aadhaar provided does not contain current address, a SELF DECLARATION of current address is required as a proof of current address.',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 10),
          CheckboxListTile(
            title: const Text(
              'I declare that my Aadhaar does not contain my current address',
              style: TextStyle(fontSize: 13),
            ),
            value: _selfDeclarationAadhaarMismatch,
            onChanged: (val) {
              setState(() {
                _selfDeclarationAadhaarMismatch = val ?? false;
                _notifyChange();
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 20),

          // Section 7: Alternative address proof documents
          _buildSectionTitle(
            'If the Proof of Address(OVD other than Aadhaar) provided does not contain current address-please provide any of the documents below.',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxListTile(
                title: const Text(
                  'Utility Bill',
                  style: TextStyle(fontSize: 13),
                ),
                value: _altProofUtilityBill,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _altProofUtilityBill = true;
                      _altProofPPOFPPO = false;
                      _altProofPropertyTaxReceipt = false;
                      _altProofLetterOfAllotment = false;
                    } else {
                      _altProofUtilityBill = false;
                    }
                    _notifyChange();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                title: const Text('PPO/FPPO', style: TextStyle(fontSize: 13)),
                value: _altProofPPOFPPO,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _altProofPPOFPPO = true;
                      _altProofUtilityBill = false;
                      _altProofPropertyTaxReceipt = false;
                      _altProofLetterOfAllotment = false;
                    } else {
                      _altProofPPOFPPO = false;
                    }
                    _notifyChange();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                title: const Text(
                  'Property or Municipal tax receipt',
                  style: TextStyle(fontSize: 13),
                ),
                value: _altProofPropertyTaxReceipt,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _altProofPropertyTaxReceipt = true;
                      _altProofUtilityBill = false;
                      _altProofPPOFPPO = false;
                      _altProofLetterOfAllotment = false;
                    } else {
                      _altProofPropertyTaxReceipt = false;
                    }
                    _notifyChange();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                title: const Text(
                  'Letter of allotment of accommodation issued by employer/ issued by State or Central Government departments, statutory or regulatory bodies, Public sector undertaking, scheduled commercial banks, financial institutions and listed companies. Similarly, leave and license agreements with such employers allotting official accommodation.',
                  style: TextStyle(fontSize: 12),
                ),
                value: _altProofLetterOfAllotment,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _altProofLetterOfAllotment = true;
                      _altProofUtilityBill = false;
                      _altProofPPOFPPO = false;
                      _altProofPropertyTaxReceipt = false;
                    } else {
                      _altProofLetterOfAllotment = false;
                    }
                    _notifyChange();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTextField(
            'Document No',
            _altProofDocumentNoController,
            maxLength: 15,
          ),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildDatePickerField(
                  context,
                  'Date',
                  _altProofDateController,
                  validator: FormHelper.validateDateField,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'I hereby undertake that OVD with current address will be submitted within a period of three months from the date of opening of accountm failing which bank may stop / restrict operations in the account.',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 30),

          // Section 8: Declaration cum Undertaking cum Self-Certification
          _buildSectionTitle(
            'DECLARATION CUM UNDERTAKING CUM SELF-CERTIFICATION',
          ),
          const SizedBox(height: 15),
          const Text(
            'I have read the copy of Terms and Conditions of the Account Opening given to me. The Terms and Conditions have been explained to me/us and having understood, I accept the same.',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 15),
          CheckboxListTile(
            title: const Text(
              '1. I hereby declare that I have submitted the Aadhaar Card issued by UIDAI voluntarily for identification and /or address proof towards the compliance of KYC norms under the PMLA, 2002',
              style: TextStyle(fontSize: 12),
            ),
            value: _declarationAadhaarSubmitted,
            onChanged: (value) {
              setState(() {
                _declarationAadhaarSubmitted = value ?? false;
                _notifyChange();
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 10),
          const Text(
            '2. I hereby consent that the Bank may verify the same with the UIDAI and authorise the UIDAI expressly to release the identity and address through biometric authentication to the Bank',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: _biometricConsentYes,
                      onChanged: (value) {
                        setState(() {
                          _biometricConsentYes = value ?? false;
                          if (_biometricConsentYes) {
                            _biometricConsentNo = false;
                          }
                          _notifyChange();
                        });
                      },
                    ),
                    const Text('YES', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: _biometricConsentNo,
                      onChanged: (value) {
                        setState(() {
                          _biometricConsentNo = value ?? false;
                          if (_biometricConsentNo) {
                            _biometricConsentYes = false;
                          }
                          _notifyChange();
                        });
                      },
                    ),
                    const Text('NO', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Photo Section
          _buildImagePicker(
            title: 'PHOTO*',
            subtitle: 'Please Paste Recent passport Size (Do not Staple)',
            imagePath: _applicantPhotoPath,
            onImageSelected: (path) {
              setState(() {
                _applicantPhotoPath = path;
                _notifyChange();
              });
            },
          ),
          const SizedBox(height: 20),

          // Signature Section
          _buildImagePicker(
            title: 'Signature/Thumb impression of the Applicant',
            subtitle: 'Please sign in black ink only',
            imagePath: _applicantSignaturePath,
            onImageSelected: (path) {
              setState(() {
                _applicantSignaturePath = path;
                _notifyChange();
              });
            },
          ),
          const SizedBox(height: 20),

          // Place and Date
          Row(
            children: [
              Expanded(
                child: _buildTextField('Place:', _declarationPlaceController),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: FormHelper.buildDatePickerField(
                  context,
                  'Date:',
                  _declarationDateController,
                  validator: FormHelper.validateDateField,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Section 9: FOR OFFICE USE/ATTESTATION
          _buildSectionTitle('FOR OFFICE USE/ATTESTATION'),
          const SizedBox(height: 10),

          // Verification checkboxes
          const Text(
            'Whether self-certification & documents received as part of account opening process have been verified and found correct YES/NO\n(Branch to proceed with opening only when certification is (YES))',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: _officeVerificationYes,
                      onChanged: (value) {
                        setState(() {
                          _officeVerificationYes = value ?? false;
                          if (_officeVerificationYes) {
                            _officeVerificationNo = false;
                          }
                          _notifyChange();
                        });
                      },
                    ),
                    const Text('YES'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: _officeVerificationNo,
                      onChanged: (value) {
                        setState(() {
                          _officeVerificationNo = value ?? false;
                          if (_officeVerificationNo) {
                            _officeVerificationYes = false;
                          }
                          _notifyChange();
                        });
                      },
                    ),
                    const Text('NO'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          const Text(
            'Certified that the implications and conditions for the operation of the account have been explained to the depositor (only in case of illiterate applicant)',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 10),

          // Depositor type checkboxes
          Row(
            children: [
              const Text('Depositor is'),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: _depositorIlliterate,
                      onChanged: (value) {
                        setState(() {
                          _depositorIlliterate = value ?? false;
                          _notifyChange();
                        });
                      },
                    ),
                    const Text('Illiterate'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: _depositorBlind,
                      onChanged: (value) {
                        setState(() {
                          _depositorBlind = value ?? false;
                          _notifyChange();
                        });
                      },
                    ),
                    const Text('Blind'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTextField('Staff', _depositorStaffController, maxLength: 10),
          const SizedBox(height: 15),

          // Risk Category
          const Text(
            'Risk Category:*',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: _riskCategoryHigh,
                      onChanged: (value) {
                        setState(() {
                          _riskCategoryHigh = value ?? false;
                          if (_riskCategoryHigh) {
                            _riskCategoryMedium = false;
                            _riskCategoryLow = false;
                          }
                          _notifyChange();
                        });
                      },
                    ),
                    const Text('High'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: _riskCategoryMedium,
                      onChanged: (value) {
                        setState(() {
                          _riskCategoryMedium = value ?? false;
                          if (_riskCategoryMedium) {
                            _riskCategoryHigh = false;
                            _riskCategoryLow = false;
                          }
                          _notifyChange();
                        });
                      },
                    ),
                    const Text('Medium'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: _riskCategoryLow,
                      onChanged: (value) {
                        setState(() {
                          _riskCategoryLow = value ?? false;
                          if (_riskCategoryLow) {
                            _riskCategoryHigh = false;
                            _riskCategoryMedium = false;
                          }
                          _notifyChange();
                        });
                      },
                    ),
                    const Text('Low'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Identification marks
          _buildTextField(
            'Details of one or two identification marks, if any, such as a mole or scar (mandatory for illiterate applicant)',
            _officeIdentificationMarksController,
            maxLines: 2,
          ),
          const SizedBox(height: 15),

          const Text(
            'In person verification carried out and Signature/LTI of the applicant verified by:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          // Official details
          _buildTextField('Official Name:', _officialNameController),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  'PF No:',
                  _pfNoController,
                  maxLength: 10,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildTextField('Designation', _designationController),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  'Date:',
                  _officeUseDateController,
                  hint: 'DDMMYYYY',
                  maxLength: 8,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(child: _buildTextField('PF No', _pfNoController)),
            ],
          ),
          const SizedBox(height: 15),

          // Official Signature Image Picker
          _buildImagePicker(
            title: 'Signature',
            subtitle: 'Official signature for verification',
            imagePath: _officialSignaturePath,
            onImageSelected: (path) {
              setState(() {
                _officialSignaturePath = path;
                _notifyChange();
              });
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(Function(String) onImageSelected) async {
    final ImagePicker picker = ImagePicker();

    // Show dialog to choose between camera and gallery
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );

    if (source != null) {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        // Convert to Base64
        final bytes = await image.readAsBytes();
        final base64String = 'data:image/png;base64,${base64Encode(bytes)}';
        onImageSelected(base64String);
      }
    }
  }

  Widget _buildImagePicker({
    required String title,
    required String subtitle,
    required String? imagePath,
    required Function(String) onImageSelected,
  }) {
    bool isBase64 = imagePath != null && imagePath.startsWith('data:image');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          if (imagePath != null && imagePath.isNotEmpty)
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: isBase64
                      ? Image.memory(
                          base64Decode(imagePath.split(',')[1]),
                          fit: BoxFit.contain,
                        )
                      : (kIsWeb
                          ? Image.network(imagePath, fit: BoxFit.contain)
                          : Image.file(File(imagePath), fit: BoxFit.contain))),
            ),
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () => _pickImage(onImageSelected),
                icon: const Icon(Icons.add_photo_alternate, size: 18),
                label: Text(
                  imagePath == null ? 'Select Image' : 'Change Image',
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
              if (imagePath != null && imagePath.isNotEmpty) ...[
                const SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {
                    onImageSelected('');
                  },
                  icon: const Icon(Icons.delete, size: 18, color: Colors.red),
                  label: const Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ],
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
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          counterText: maxLength != null ? '' : null,
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
      ),
    );
  }
}
