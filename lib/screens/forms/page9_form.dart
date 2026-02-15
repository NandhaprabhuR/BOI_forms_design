// lib/screens/forms/page9_form.dart

import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  // Customer and Account Info
  late TextEditingController _customerIdController;
  late TextEditingController _ckycNoController;
  late TextEditingController _accountNoController;
  late TextEditingController _nameFirstController;
  late TextEditingController _nameMiddleController;
  late TextEditingController _nameLastController;
  
  // KYC and Related Person Info
  late TextEditingController _kycOfRelatedPersonController;
  late TextEditingController _relatedPersonPrefixController;
  late TextEditingController _relatedPersonFirstNameController;
  late TextEditingController _relatedPersonMiddleNameController;
  late TextEditingController _relatedPersonLastNameController;

  // Document Details
  late TextEditingController _documentNoController;
  late TextEditingController _issueDateController;
  late TextEditingController _expiryDateController;
  late TextEditingController _remarksController;

  // FATCA Declaration Form
  late TextEditingController _fatcaCustomerIdController;
  late TextEditingController _fatcaCkycNoController;
  late TextEditingController _fatcaAccountNoController;
  late TextEditingController _fatcaPrefixController;
  late TextEditingController _fatcaFirstNameController;
  late TextEditingController _fatcaMiddleNameController;
  late TextEditingController _fatcaLastNameController;
  late TextEditingController _countryNameController;
  late TextEditingController _placeOfBirthController;
  late TextEditingController _countryOfBirthController;
  late TextEditingController _fatcaAddressController;
  late TextEditingController _fatcaCityController;
  late TextEditingController _fatcaDistrictController;
  late TextEditingController _fatcaStateController;
  late TextEditingController _fatcaPinController;

  // Tax Residency Table Controllers (3 rows)
  late TextEditingController _taxCountry1Controller;
  late TextEditingController _taxId1Controller;
  late TextEditingController _taxIdType1Controller;
  late TextEditingController _taxCountry2Controller;
  late TextEditingController _taxId2Controller;
  late TextEditingController _taxIdType2Controller;
  late TextEditingController _taxCountry3Controller;
  late TextEditingController _taxId3Controller;
  late TextEditingController _taxIdType3Controller;

  // Address outside India for tax purposes
  late TextEditingController _outsideIndiaAddressController;
  late TextEditingController _outsideIndiaCityController;
  late TextEditingController _outsideIndiaDistrictController;
  late TextEditingController _outsideIndiaSubDistrictController;
  late TextEditingController _outsideIndiaStateController;
  late TextEditingController _outsideIndiaCountryController;
  late TextEditingController _outsideIndiaZipController;
  late TextEditingController _outsideIndiaPlaceController;
  late TextEditingController _outsideIndiaDateController;

  // Checkboxes
  bool _additionOfRelatedPerson = false;
  bool _deletionOfRelatedPerson = false;
  bool _guardianOfMinor = false;
  bool _assignee = false;
  bool _authorisedRepresentative = false;
  
  // POI Checkboxes
  bool _poiPassport = false;
  bool _poiVoterId = false;
  bool _poiDrivingLicence = false;
  bool _poiAadhaar = false;
  bool _poiNregaJobCard = false;
  bool _poiNprLetter = false;
  bool _poiOthers = false;

  // Citizenship checkboxes
  bool _citizenshipIndia = false;
  bool _citizenshipOthers = false;

  // Signature path for outside India section
  String? _outsideIndiaSignaturePath = null;

  @override
  void initState() {
    super.initState();
    _customerIdController = TextEditingController(
      text: widget.initialData.customerId,
    );
    _ckycNoController = TextEditingController(
      text: widget.initialData.ckycNo,
    );
    _accountNoController = TextEditingController(
      text: widget.initialData.accountNo,
    );
    _nameFirstController = TextEditingController(
      text: widget.initialData.customerFirstName,
    );
    _nameMiddleController = TextEditingController(
      text: widget.initialData.customerMiddleName,
    );
    _nameLastController = TextEditingController(
      text: widget.initialData.customerLastName,
    );
    _kycOfRelatedPersonController = TextEditingController(); // Not in model?
    _relatedPersonPrefixController = TextEditingController(
      text: widget.initialData.relatedPersonPrefix,
    );
    _relatedPersonFirstNameController = TextEditingController(
      text: widget.initialData.relatedPersonFirstName,
    );
    _relatedPersonMiddleNameController = TextEditingController();
    _relatedPersonLastNameController = TextEditingController();

    // Document Details controllers
    _documentNoController = TextEditingController(
      text: widget.initialData.documentNo,
    );
    _issueDateController = TextEditingController(
      text: widget.initialData.issueDate,
    );
    _expiryDateController = TextEditingController(
      text: widget.initialData.expiryDate,
    );
    _remarksController = TextEditingController();

    // FATCA Declaration controllers
    _fatcaCustomerIdController = TextEditingController(
      text: widget.initialData.customerId,
    );
    _fatcaCkycNoController = TextEditingController(
      text: widget.initialData.ckycNo,
    );
    _fatcaAccountNoController = TextEditingController(
      text: widget.initialData.accountNo,
    );
    _fatcaPrefixController = TextEditingController(
      text: widget.initialData.customerPrefix,
    );
    _fatcaFirstNameController = TextEditingController(
      text: widget.initialData.customerFirstName,
    );
    _fatcaMiddleNameController = TextEditingController(
      text: widget.initialData.customerMiddleName,
    );
    _fatcaLastNameController = TextEditingController(
      text: widget.initialData.customerLastName,
    );
    _countryNameController = TextEditingController(
      text: widget.initialData.countryName,
    );
    _placeOfBirthController = TextEditingController(
      text: widget.initialData.placeCityOfBirth,
    );
    _countryOfBirthController = TextEditingController(
      text: widget.initialData.countryCodeOfBirth,
    );
    _fatcaAddressController = TextEditingController(
      text: widget.initialData.currentAddress,
    );
    _fatcaCityController = TextEditingController(
      text: widget.initialData.currentCity,
    );
    _fatcaDistrictController = TextEditingController(
      text: widget.initialData.currentDistrict,
    );
    _fatcaStateController = TextEditingController(
      text: widget.initialData.currentState,
    );
    _fatcaPinController = TextEditingController(
      text: widget.initialData.currentPin,
    );

    // Tax Residency Table controllers
    _taxCountry1Controller = TextEditingController();
    _taxId1Controller = TextEditingController();
    _taxIdType1Controller = TextEditingController();
    _taxCountry2Controller = TextEditingController();
    _taxId2Controller = TextEditingController();
    _taxIdType2Controller = TextEditingController();
    _taxCountry3Controller = TextEditingController();
    _taxId3Controller = TextEditingController();
    _taxIdType3Controller = TextEditingController();

    // Outside India address controllers
    _outsideIndiaAddressController = TextEditingController();
    _outsideIndiaCityController = TextEditingController();
    _outsideIndiaDistrictController = TextEditingController();
    _outsideIndiaSubDistrictController = TextEditingController();
    _outsideIndiaStateController = TextEditingController();
    _outsideIndiaCountryController = TextEditingController();
    _outsideIndiaZipController = TextEditingController();
    _outsideIndiaPlaceController = TextEditingController();
    _outsideIndiaDateController = TextEditingController();

    // Initialize signature
    _outsideIndiaSignaturePath = widget.initialData.fatcaDeclarantSignature.isNotEmpty
        ? widget.initialData.fatcaDeclarantSignature
        : null;

    // Initialize POI from model
    _poiPassport = widget.initialData.poiPassport;
    _poiVoterId = widget.initialData.poiVoterId;
    _poiDrivingLicence = widget.initialData.poiDrivingLicence;
    _poiAadhaar = widget.initialData.poiAadhaar;
    _poiNregaJobCard = widget.initialData.poiNregaJobCard;
    _poiNprLetter = widget.initialData.poiNprLetter;
    _poiOthers = widget.initialData.poiOthers;

    FormHelper.addListeners([
      _customerIdController,
      _ckycNoController,
      _accountNoController,
      _nameFirstController,
      _nameMiddleController,
      _nameLastController,
      _kycOfRelatedPersonController,
      _relatedPersonPrefixController,
      _relatedPersonFirstNameController,
      _relatedPersonMiddleNameController,
      _relatedPersonLastNameController,
      _documentNoController,
      _issueDateController,
      _expiryDateController,
      _remarksController,
      _fatcaCustomerIdController,
      _fatcaCkycNoController,
      _fatcaAccountNoController,
      _fatcaPrefixController,
      _fatcaFirstNameController,
      _fatcaMiddleNameController,
      _fatcaLastNameController,
      _countryNameController,
      _placeOfBirthController,
      _countryOfBirthController,
      _fatcaAddressController,
      _fatcaCityController,
      _fatcaDistrictController,
      _fatcaStateController,
      _fatcaPinController,
      _taxCountry1Controller,
      _taxId1Controller,
      _taxIdType1Controller,
      _taxCountry2Controller,
      _taxId2Controller,
      _taxIdType2Controller,
      _taxCountry3Controller,
      _taxId3Controller,
      _taxIdType3Controller,
      _outsideIndiaAddressController,
      _outsideIndiaCityController,
      _outsideIndiaDistrictController,
      _outsideIndiaSubDistrictController,
      _outsideIndiaStateController,
      _outsideIndiaCountryController,
      _outsideIndiaZipController,
      _outsideIndiaPlaceController,
      _outsideIndiaDateController,
    ], _notifyChange);
  }

  void _notifyChange() {
    // Update model directly
    widget.initialData.customerId = _customerIdController.text;
    widget.initialData.ckycNo = _ckycNoController.text;
    widget.initialData.accountNo = _accountNoController.text;
    widget.initialData.customerFirstName = _nameFirstController.text;
    widget.initialData.customerMiddleName = _nameMiddleController.text;
    widget.initialData.customerLastName = _nameLastController.text;
    widget.initialData.relatedPersonPrefix = _relatedPersonPrefixController.text;
    widget.initialData.relatedPersonFirstName = _relatedPersonFirstNameController.text;
    widget.initialData.documentNo = _documentNoController.text;
    widget.initialData.issueDate = _issueDateController.text;
    widget.initialData.expiryDate = _expiryDateController.text;
    
    // FATCA fields
    widget.initialData.countryName = _countryNameController.text;
    widget.initialData.placeCityOfBirth = _placeOfBirthController.text;
    widget.initialData.countryCodeOfBirth = _countryOfBirthController.text;
    widget.initialData.currentAddress = _fatcaAddressController.text;
    widget.initialData.currentCity = _fatcaCityController.text;
    widget.initialData.currentDistrict = _fatcaDistrictController.text;
    widget.initialData.currentState = _fatcaStateController.text;
    widget.initialData.currentPin = _fatcaPinController.text;
    
    // Checkboxes (Example: Citizenship)
    widget.initialData.fatcaNonIndianCitizen = _citizenshipOthers;
    widget.initialData.fatcaIndianCitizen = _citizenshipIndia;

    // POI Options
    widget.initialData.poiPassport = _poiPassport;
    widget.initialData.poiVoterId = _poiVoterId;
    widget.initialData.poiDrivingLicence = _poiDrivingLicence;
    widget.initialData.poiAadhaar = _poiAadhaar;
    widget.initialData.poiNregaJobCard = _poiNregaJobCard;
    widget.initialData.poiNprLetter = _poiNprLetter;
    widget.initialData.poiOthers = _poiOthers;

    // Signature
    widget.initialData.fatcaDeclarantSignature = _outsideIndiaSignaturePath ?? '';

    widget.onDataChanged(widget.initialData);
  }

  // Helper to check if string is Base64
  bool _isBase64(String path) {
    return path.startsWith('data:image') || path.length > 500; // simplistic check
  }

  Widget _buildSignatureBox() {
    return GestureDetector(
      onTap: _pickSignatureImage,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(4),
        ),
        child: _outsideIndiaSignaturePath != null
            ? Stack(
                children: [
                  Center(
                    child: _isBase64(_outsideIndiaSignaturePath!)
                        ? (kIsWeb 
                            ? Image.network(_outsideIndiaSignaturePath!, fit: BoxFit.contain)
                            : Image.memory(
                                base64Decode(_outsideIndiaSignaturePath!.split(',').last),
                                fit: BoxFit.contain,
                              ))
                        : (kIsWeb
                            ? Image.network(
                                _outsideIndiaSignaturePath!,
                                fit: BoxFit.contain,
                              )
                            : Image.file(
                                File(_outsideIndiaSignaturePath!),
                                fit: BoxFit.contain,
                              )),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _outsideIndiaSignaturePath = null;
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
                          size: 14,
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
                  Icon(Icons.draw, size: 24, color: Colors.grey.shade400),
                  const SizedBox(height: 4),
                  Text(
                    'Tap to add signature',
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _pickSignatureImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      // Store as Base64 string
      final base64String = 'data:image/png;base64,${base64Encode(bytes)}';
      setState(() {
        _outsideIndiaSignaturePath = base64String;
        _notifyChange();
      });
    }
  }

  @override
  void dispose() {
    FormHelper.disposeControllers([
      _customerIdController,
      _ckycNoController,
      _accountNoController,
      _nameFirstController,
      _nameMiddleController,
      _nameLastController,
      _kycOfRelatedPersonController,
      _relatedPersonPrefixController,
      _relatedPersonFirstNameController,
      _relatedPersonMiddleNameController,
      _relatedPersonLastNameController,
      _documentNoController,
      _issueDateController,
      _expiryDateController,
      _remarksController,
      _fatcaCustomerIdController,
      _fatcaCkycNoController,
      _fatcaAccountNoController,
      _fatcaPrefixController,
      _fatcaFirstNameController,
      _fatcaMiddleNameController,
      _fatcaLastNameController,
      _countryNameController,
      _placeOfBirthController,
      _countryOfBirthController,
      _fatcaAddressController,
      _fatcaCityController,
      _fatcaDistrictController,
      _fatcaStateController,
      _fatcaPinController,
      _taxCountry1Controller,
      _taxId1Controller,
      _taxIdType1Controller,
      _taxCountry2Controller,
      _taxId2Controller,
      _taxIdType2Controller,
      _taxCountry3Controller,
      _taxId3Controller,
      _taxIdType3Controller,
      _outsideIndiaAddressController,
      _outsideIndiaCityController,
      _outsideIndiaDistrictController,
      _outsideIndiaSubDistrictController,
      _outsideIndiaStateController,
      _outsideIndiaCountryController,
      _outsideIndiaZipController,
      _outsideIndiaPlaceController,
      _outsideIndiaDateController,
    ]);
    super.dispose();
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: (val) {
              onChanged(val);
              _notifyChange();
            },
          ),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(label, style: const TextStyle(fontSize: 12)),
        ),
      ],
    );
  }

  Widget _buildPOICheckbox(String label, bool value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: (val) {
                onChanged(val);
                _notifyChange();
              },
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(label, style: const TextStyle(fontSize: 12)),
          ),
        ],
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
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Annexure-2',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'Details of Related Person (To be filled for minor)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          // Customer ID and CKYC No.
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'Customer ID',
                  _customerIdController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'CKYC No.',
                  _ckycNoController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Account No.
          FormHelper.buildTextField(
            'Account No.',
            _accountNoController,
            maxLines: 1,
          ),
          const SizedBox(height: 12),

          // Name
          FormHelper.buildSectionTitle('Name*'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'First Name',
                  _nameFirstController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormHelper.buildTextField(
                  'Middle Name',
                  _nameMiddleController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormHelper.buildTextField(
                  'Last Name',
                  _nameLastController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Addition/Deletion checkboxes
          Row(
            children: [
              Expanded(
                child: _buildCheckbox('Addition of Related Person', _additionOfRelatedPerson, (val) {
                  setState(() {
                    if (val == true) {
                      _additionOfRelatedPerson = true;
                      _deletionOfRelatedPerson = false;
                    } else {
                      _additionOfRelatedPerson = false;
                    }
                  });
                }),
              ),
              Expanded(
                child: _buildCheckbox('Deletion of Related Person', _deletionOfRelatedPerson, (val) {
                  setState(() {
                    if (val == true) {
                      _deletionOfRelatedPerson = true;
                      _additionOfRelatedPerson = false;
                    } else {
                      _deletionOfRelatedPerson = false;
                    }
                  });
                }),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // KYC of Related Person
          FormHelper.buildTextField(
            'KYC of Related Person (If Available)*',
            _kycOfRelatedPersonController,
            maxLines: 1,
          ),
          const SizedBox(height: 16),

          // Related Person Type
          FormHelper.buildSectionTitle('Related Person type*'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _buildCheckbox('Guardian of Minor', _guardianOfMinor, (val) {
                setState(() {
                  if (val == true) {
                    _guardianOfMinor = true;
                    _assignee = false;
                    _authorisedRepresentative = false;
                  } else {
                    _guardianOfMinor = false;
                  }
                });
              }),
              _buildCheckbox('Assignee', _assignee, (val) {
                setState(() {
                  if (val == true) {
                    _assignee = true;
                    _guardianOfMinor = false;
                    _authorisedRepresentative = false;
                  } else {
                    _assignee = false;
                  }
                });
              }),
              _buildCheckbox('Authorised Representative', _authorisedRepresentative, (val) {
                setState(() {
                  if (val == true) {
                    _authorisedRepresentative = true;
                    _guardianOfMinor = false;
                    _assignee = false;
                  } else {
                    _authorisedRepresentative = false;
                  }
                });
              }),
            ],
          ),
          const SizedBox(height: 16),

          // Related Person Name
          FormHelper.buildSectionTitle('Related Person Name*'),
          const SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: 80,
                child: FormHelper.buildTextField(
                  'Prefix',
                  _relatedPersonPrefixController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormHelper.buildTextField(
                  'First Name',
                  _relatedPersonFirstNameController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormHelper.buildTextField(
                  'Middle Name',
                  _relatedPersonMiddleNameController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormHelper.buildTextField(
                  'Last Name',
                  _relatedPersonLastNameController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Note
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              '(If KYC Number and name are provided, below details are optional)',
              style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 20),

          // Proof of Identity (POI) section
          FormHelper.buildSectionTitle('PROOF OF IDENTITY (POI) OF RELATED PERSON*'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPOICheckbox('A-PASSPORT', _poiPassport, (val) {
                  setState(() {
                    if (val == true) {
                      _poiPassport = true;
                      _poiVoterId = false;
                      _poiDrivingLicence = false;
                      _poiAadhaar = false;
                      _poiNregaJobCard = false;
                      _poiNprLetter = false;
                      _poiOthers = false;
                    } else {
                      _poiPassport = false;
                    }
                  });
                }),
                _buildPOICheckbox('B-VOTER\'S IDENTITY CARD', _poiVoterId, (val) {
                  setState(() {
                    if (val == true) {
                      _poiVoterId = true;
                      _poiPassport = false;
                      _poiDrivingLicence = false;
                      _poiAadhaar = false;
                      _poiNregaJobCard = false;
                      _poiNprLetter = false;
                      _poiOthers = false;
                    } else {
                      _poiVoterId = false;
                    }
                  });
                }),
                _buildPOICheckbox('C-DRIVING LICENCE', _poiDrivingLicence, (val) {
                  setState(() {
                    if (val == true) {
                      _poiDrivingLicence = true;
                      _poiPassport = false;
                      _poiVoterId = false;
                      _poiAadhaar = false;
                      _poiNregaJobCard = false;
                      _poiNprLetter = false;
                      _poiOthers = false;
                    } else {
                      _poiDrivingLicence = false;
                    }
                  });
                }),
                _buildPOICheckbox('D-PROOF OF POSSESSION OF AADHAAR', _poiAadhaar, (val) {
                  setState(() {
                    if (val == true) {
                      _poiAadhaar = true;
                      _poiPassport = false;
                      _poiVoterId = false;
                      _poiDrivingLicence = false;
                      _poiNregaJobCard = false;
                      _poiNprLetter = false;
                      _poiOthers = false;
                    } else {
                      _poiAadhaar = false;
                    }
                  });
                }),
                _buildPOICheckbox('E-NREGA JOB CARD', _poiNregaJobCard, (val) {
                  setState(() {
                    if (val == true) {
                      _poiNregaJobCard = true;
                      _poiPassport = false;
                      _poiVoterId = false;
                      _poiDrivingLicence = false;
                      _poiAadhaar = false;
                      _poiNprLetter = false;
                      _poiOthers = false;
                    } else {
                      _poiNregaJobCard = false;
                    }
                  });
                }),
                _buildPOICheckbox('F-LETTER ISSUED BY NATIONAL POPULATION REGISTER CONTAINING DETAILS OF NAME & ADDRESS', _poiNprLetter, (val) {
                  setState(() {
                    if (val == true) {
                      _poiNprLetter = true;
                      _poiPassport = false;
                      _poiVoterId = false;
                      _poiDrivingLicence = false;
                      _poiAadhaar = false;
                      _poiNregaJobCard = false;
                      _poiOthers = false;
                    } else {
                      _poiNprLetter = false;
                    }
                  });
                }),
                _buildPOICheckbox('G-OTHERS', _poiOthers, (val) {
                  setState(() {
                    if (val == true) {
                      _poiOthers = true;
                      _poiPassport = false;
                      _poiVoterId = false;
                      _poiDrivingLicence = false;
                      _poiAadhaar = false;
                      _poiNregaJobCard = false;
                      _poiNprLetter = false;
                    } else {
                      _poiOthers = false;
                    }
                  });
                }),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Document Details Section
          FormHelper.buildSectionTitle('Document No/Identification Number*'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Document No/Identification Number',
            _documentNoController,
            maxLines: 1,
            validator: (val) => val!.isEmpty ? 'Required' : null,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildDatePickerField(
                  context,
                  'Issue date* (dd/mm/yyyy)',
                  _issueDateController,
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildDatePickerField(
                  context,
                  'Expiry Date (If Applicable)',
                  _expiryDateController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FormHelper.buildTextField(
            'Remarks',
            _remarksController,
            maxLines: 2,
          ),
          const SizedBox(height: 30),

          // FATCA Declaration Form Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'FATCA Declaration Form',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),

          // Customer ID and CKYC No.
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'Customer ID',
                  _fatcaCustomerIdController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'CKYC No.',
                  _fatcaCkycNoController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Account No.
          FormHelper.buildTextField(
            'Account No.',
            _fatcaAccountNoController,
            maxLines: 1,
          ),
          const SizedBox(height: 12),

          // Name with Prefix
          FormHelper.buildSectionTitle('Name*'),
          const SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: 80,
                child: FormHelper.buildTextField(
                  'Prefix',
                  _fatcaPrefixController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormHelper.buildTextField(
                  'First Name',
                  _fatcaFirstNameController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormHelper.buildTextField(
                  'Middle Name',
                  _fatcaMiddleNameController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormHelper.buildTextField(
                  'Last Name',
                  _fatcaLastNameController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Citizenship
          FormHelper.buildSectionTitle('Citizenship*'),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildCheckbox('IN-India', _citizenshipIndia, (val) {
                setState(() {
                  _citizenshipIndia = val ?? false;
                  if (_citizenshipIndia) _citizenshipOthers = false;
                });
              }),
              const SizedBox(width: 16),
              _buildCheckbox('Others', _citizenshipOthers, (val) {
                setState(() {
                  _citizenshipOthers = val ?? false;
                  if (_citizenshipOthers) _citizenshipIndia = false;
                });
              }),
              const SizedBox(width: 16),
              Expanded(
                child: FormHelper.buildTextField(
                  'Country Name',
                  _countryNameController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Place/City of Birth and Country of Birth
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'Place/City of Birth*',
                  _placeOfBirthController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'Country of Birth*',
                  _countryOfBirthController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Address
          FormHelper.buildTextField(
            'Address*',
            _fatcaAddressController,
            maxLines: 2,
          ),
          const SizedBox(height: 12),

          // City/Village and District
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'City/Village*',
                  _fatcaCityController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'District*',
                  _fatcaDistrictController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // State and Pin
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'State*',
                  _fatcaStateController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'Pin*',
                  _fatcaPinController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Multiple Tax Residency Section
          const Text(
            'Multiple Tax Residency: Details of Country of Tax Residence in India, and/or in USA@ And /or In any other Country or Territory Outside India as Under:',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          _buildTaxResidencyTable(),
          const SizedBox(height: 16),

          // Notes
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '@   * A citizen of US including individual born in US but resident in another country (who has not given up US citizenship',
                  style: TextStyle(fontSize: 10, height: 1.4),
                ),
                SizedBox(height: 4),
                Text(
                  '     * A person residing in US including US green card holder',
                  style: TextStyle(fontSize: 10, height: 1.4),
                ),
                SizedBox(height: 4),
                Text(
                  '     * Certain persons who spend more than 180 days in US each year',
                  style: TextStyle(fontSize: 10, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Address outside India section
          _buildAddressOutsideIndiaSection(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTaxResidencyTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          // Header row
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
              ),
            ),
            child: Row(
              children: [
                _buildTableHeaderCell('Country of Tax Residence#', flex: 2),
                _buildTableHeaderCell('Tax Identification number or equivalent if issued by jurisdiction', flex: 3),
                _buildTableHeaderCell('Identification type (TIN or Other, please specify)', flex: 3),
              ],
            ),
          ),
          // Data rows with text fields
          _buildTableInputRow(_taxCountry1Controller, _taxId1Controller, _taxIdType1Controller),
          _buildTableInputRow(_taxCountry2Controller, _taxId2Controller, _taxIdType2Controller),
          _buildTableInputRow(_taxCountry3Controller, _taxId3Controller, _taxIdType3Controller),
        ],
      ),
    );
  }

  Widget _buildTableHeaderCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTableInputRow(
    TextEditingController countryController,
    TextEditingController taxIdController,
    TextEditingController typeController,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade400),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              child: TextField(
                controller: countryController,
                style: const TextStyle(fontSize: 11),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  border: InputBorder.none,
                  hintText: 'Country',
                  hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              child: TextField(
                controller: taxIdController,
                style: const TextStyle(fontSize: 11),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  border: InputBorder.none,
                  hintText: 'Tax ID Number',
                  hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: TextField(
                controller: typeController,
                style: const TextStyle(fontSize: 11),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  border: InputBorder.none,
                  hintText: 'TIN / Other',
                  hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressOutsideIndiaSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Address in the Jurisdiction/Country - where the Applicant is Resident outside India for Tax Purposes',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          FormHelper.buildTextField(
            'Address*',
            _outsideIndiaAddressController,
            maxLines: 2,
            validator: (val) => (_citizenshipOthers && val!.isEmpty) ? 'Required if Resident outside India' : null,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'City/Village*',
                  _outsideIndiaCityController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'District*',
                  _outsideIndiaDistrictController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'Sub-District',
                  _outsideIndiaSubDistrictController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'State*',
                  _outsideIndiaStateController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildTextField(
                  'Country Name*',
                  _outsideIndiaCountryController,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildTextField(
                  'ZIP/Post Code*',
                  _outsideIndiaZipController,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormHelper.buildTextField(
                      'Place:',
                      _outsideIndiaPlaceController,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 12),
                    FormHelper.buildDatePickerField(
                      context,
                      'Date:',
                      _outsideIndiaDateController,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Signature/thumb impression of the Applicant/Applicants',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    _buildSignatureBox(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}
