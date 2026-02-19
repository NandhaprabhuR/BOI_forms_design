// lib/screens/forms/page1_form.dart

import 'package:flutter/material.dart';
import '../model/form_data_model.dart';
import 'form_helper.dart';

class Page1Form extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page1Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page1Form> createState() => _Page1FormState();
}

class _Page1FormState extends State<Page1Form> {
  late TextEditingController _branchNameController;
  late TextEditingController _branchCodeController;
  late TextEditingController _dateController;
  late TextEditingController _customerIdController;
  late TextEditingController _accountNoController;
  late TextEditingController _ckycNoController;
  late TextEditingController _existingCustomerIdController;

  // Checkbox states for application type and account type
  bool _applicationTypeNew = false;
  bool _applicationTypeUpdate = false;
  bool _accountTypeNormal = false;
  bool _accountTypeSmallRisk = false;
  late TextEditingController _customerFirstNameController;
  late TextEditingController _customerMiddleNameController;
  late TextEditingController _customerLastNameController;
  late TextEditingController _customerPrefixController;
  late TextEditingController _maidenNameController;
  late TextEditingController _maidenNamePrefixController;
  late TextEditingController _fatherNameController;
  late TextEditingController _fatherPrefixController;
  late TextEditingController _motherNameController;
  late TextEditingController _motherPrefixController;
  late TextEditingController _spouseNameController;
  late TextEditingController _spousePrefixController;

  // Gender and Marital Status checkboxes
  bool _genderMale = false;
  bool _genderFemale = false;
  bool _genderTransgender = false;
  bool _maritalStatusMarried = false;
  bool _maritalStatusUnmarried = false;
  bool _maritalStatusOthers = false;

  // No. of Dependents, Illiterate, Nationality, Resident Status
  bool _illiterateYes = false;
  bool _illiterateNo = false;
  late TextEditingController _identificationMarksController;
  bool _nationalityInIndian = false;
  bool _nationalityOthers = false;
  late TextEditingController _countryNameController;
  bool _residentIndividual = false;
  bool _nonResidentIndian = false;
  bool _foreignNational = false;
  bool _pio = false;

  // Occupation Type checkboxes
  bool _occupationSService = false;
  bool _occupationPrivateSector = false;
  bool _occupationPublicSector = false;
  bool _occupationGovernmentSector = false;
  bool _occupationOOthers = false;
  bool _occupationProfessional = false;
  bool _occupationSelfEmployed = false;
  bool _occupationRetired = false;
  bool _occupationHouseWife = false;
  bool _occupationStudent = false;
  bool _occupationBBusiness = false;
  bool _occupationAgriculture = false;
  bool _occupationXNotCategorised = false;

  // Religion checkboxes
  bool _religionHindu = false;
  bool _religionMuslim = false;
  bool _religionChristian = false;
  bool _religionSikh = false;
  bool _religionOthers = false;

  // Category checkboxes
  bool _categoryGeneral = false;
  bool _categoryOBC = false;
  bool _categorySC = false;
  bool _categoryST = false;
  bool _categoryMinority = false;

  // Customer Type checkboxes
  bool _customerTypeGeneral = false;
  bool _customerTypeSrCitizen = false;
  bool _customerTypePensioner = false;
  bool _customerTypeMinor = false;
  bool _customerTypeStaffExStaff = false;
  late TextEditingController _customerTypePfNoController;
  bool _customerTypeOthers = false;
  late TextEditingController _customerTypeOthersSpecifyController;

  // Disability checkboxes
  bool _disabilityYes = false;
  bool _disabilityNo = false;
  bool _disabilityVisuallyImpaired = false;
  bool _disabilityDifferentlyAbled = false;

  // Education checkboxes
  bool _educationBelowSSC = false;
  bool _educationSSC = false;
  bool _educationHSC = false;
  bool _educationGraduate = false;
  bool _educationPostGraduate = false;
  bool _educationProfessional = false;
  bool _educationOthers = false;

  // Organization and Business controllers
  late TextEditingController _organizationNameController;
  late TextEditingController _designationProfessionController;
  late TextEditingController _natureOfBusinessController;

  // Politically Exposed Person checkboxes
  bool _politicallyExposedPerson = false;
  bool _relatedToPoliticallyExposedPerson = false;
  bool _politicallyExposedNone = false;

  // ISO and Tax Residence controllers
  late TextEditingController _isoCountryCodeJurisdictionController;
  late TextEditingController _isoCountryCodeOfBirthController;
  bool _taxResidenceIndiaYes = false;
  bool _taxResidenceIndiaNo = false;

  // Document Type checkboxes (Proof of Identity/Address)
  bool _docTypePassport = false;
  bool _docTypeVoterIdCard = false;
  bool _docTypeDrivingLicence = false;
  bool _docTypeAadhaar = false;
  bool _docTypeNregaJobCard = false;
  bool _docTypePopulationRegisterLetter = false;

  // Address Type checkboxes
  bool _addressTypeResidentialBusiness = false;
  bool _addressTypeResidential = false;
  bool _addressTypeBusiness = false;
  bool _addressTypeRegisteredOffice = false;
  bool _addressTypeUnspecified = false;

  late TextEditingController _mobileNoController;
  late TextEditingController _emailIdController;
  late TextEditingController _alternateMobileNoController;
  late TextEditingController _telOffController;
  late TextEditingController _telResController;
  late TextEditingController _aadharDocNoController;
  late TextEditingController _currentAddressController;
  late TextEditingController _currentAddressLine2Controller;
  late TextEditingController _currentCityController;
  late TextEditingController _currentDistrictController;
  late TextEditingController _currentStateController;
  late TextEditingController _currentPinController;

  // Permanent Address controllers
  late TextEditingController _permanentAddressController;
  late TextEditingController _permanentAddressLine2Controller;
  late TextEditingController _permanentCityController;
  late TextEditingController _permanentDistrictController;
  late TextEditingController _permanentStateController;
  late TextEditingController _permanentPinController;

  // Overseas Address controllers
  late TextEditingController _overseasAddressController;
  late TextEditingController _overseasAddressLine2Controller;
  late TextEditingController _overseasCityController;
  late TextEditingController _overseasDistrictController;
  late TextEditingController _overseasStateController;
  late TextEditingController _overseasPinController;

  late TextEditingController _dobController;
  late TextEditingController _occupationTypeController;
  late TextEditingController _monthlyIncomeController;
  late TextEditingController _netWorthController;
  late TextEditingController _estAnnualTurnoverController;
  late TextEditingController _noOfDependentsController;
  late TextEditingController _guardianPrefixController;
  late TextEditingController _guardianNameController;
  late TextEditingController _guardianMiddleNameController;
  late TextEditingController _guardianSurnameController;
  late TextEditingController _relationshipWithGuardianController;
  late TextEditingController _placeCityOfBirthController;
  late TextEditingController _countryCodeOfBirthController;
  late TextEditingController _citizenshipController;
  late TextEditingController _panTaxIdNumberController;
  late TextEditingController _alternateCountryController;
  late TextEditingController _stdCodeController;
  late TextEditingController _landlineNoController;
  late TextEditingController _alternateStdCodeController;
  late TextEditingController _alternateLandlineNoController;
  late TextEditingController _documentNoController;
  late TextEditingController _issueDateController;
  late TextEditingController _expiryDateController;

  @override
  void initState() {
    super.initState();
    _branchNameController = TextEditingController(
      text: widget.initialData.branchName,
    );
    _branchCodeController = TextEditingController(
      text: widget.initialData.branchCode,
    );
    _dateController = TextEditingController(text: widget.initialData.date);
    _customerIdController = TextEditingController(
      text: widget.initialData.customerId,
    );
    _accountNoController = TextEditingController(
      text: widget.initialData.accountNo,
    );
    _ckycNoController = TextEditingController(text: widget.initialData.ckycNo);
    _existingCustomerIdController = TextEditingController(
      text: widget.initialData.existingCustomerId,
    );
    _customerFirstNameController = TextEditingController(
      text: widget.initialData.customerFirstName,
    );
    _customerMiddleNameController = TextEditingController(
      text: widget.initialData.customerMiddleName,
    );
    _customerLastNameController = TextEditingController(
      text: widget.initialData.customerLastName,
    );
    _customerPrefixController = TextEditingController(
      text: widget.initialData.customerPrefix,
    );
    _maidenNameController = TextEditingController(
      text: widget.initialData.maidenName,
    );
    _maidenNamePrefixController = TextEditingController(
      text: widget.initialData.maidenNamePrefix,
    );
    _fatherNameController = TextEditingController(
      text: widget.initialData.fatherName,
    );
    _fatherPrefixController = TextEditingController(
      text: widget.initialData.fatherPrefix,
    );
    _motherNameController = TextEditingController(
      text: widget.initialData.motherName,
    );
    _motherPrefixController = TextEditingController(
      text: widget.initialData.motherPrefix,
    );
    _spouseNameController = TextEditingController(
      text: widget.initialData.spouseName,
    );
    _spousePrefixController = TextEditingController(
      text: widget.initialData.spousePrefix,
    );

    // Initialize gender and marital status checkboxes
    _genderMale = widget.initialData.genderMale;
    _genderFemale = widget.initialData.genderFemale;
    _genderTransgender = widget.initialData.genderTransgender;
    _maritalStatusMarried = widget.initialData.maritalStatusMarried;
    _maritalStatusUnmarried = widget.initialData.maritalStatusUnmarried;
    _maritalStatusOthers = widget.initialData.maritalStatusOthers;

    // Initialize Illiterate, Nationality, Resident Status
    _illiterateYes = widget.initialData.illiterateYes;
    _illiterateNo = widget.initialData.illiterateNo;
    _identificationMarksController = TextEditingController(
      text: widget.initialData.identificationMarks,
    );
    _nationalityInIndian = widget.initialData.nationalityInIndian;
    _nationalityOthers = widget.initialData.nationalityOthers;
    _countryNameController = TextEditingController(
      text: widget.initialData.countryName,
    );
    _residentIndividual = widget.initialData.residentIndividual;
    _nonResidentIndian = widget.initialData.nonResidentIndian;
    _foreignNational = widget.initialData.foreignNational;
    _pio = widget.initialData.pio;

    // Initialize Occupation Type checkboxes
    _occupationSService = widget.initialData.occupationSService;
    _occupationPrivateSector = widget.initialData.occupationPrivateSector;
    _occupationPublicSector = widget.initialData.occupationPublicSector;
    _occupationGovernmentSector = widget.initialData.occupationGovernmentSector;
    _occupationOOthers = widget.initialData.occupationOOthers;
    _occupationProfessional = widget.initialData.occupationProfessional;
    _occupationSelfEmployed = widget.initialData.occupationSelfEmployed;
    _occupationRetired = widget.initialData.occupationRetired;
    _occupationHouseWife = widget.initialData.occupationHouseWife;
    _occupationStudent = widget.initialData.occupationStudent;
    _occupationBBusiness = widget.initialData.occupationBBusiness;
    _occupationAgriculture = widget.initialData.occupationAgriculture;
    _occupationXNotCategorised = widget.initialData.occupationXNotCategorised;

    // Initialize Religion checkboxes
    _religionHindu = widget.initialData.religionHindu;
    _religionMuslim = widget.initialData.religionMuslim;
    _religionChristian = widget.initialData.religionChristian;
    _religionSikh = widget.initialData.religionSikh;
    _religionOthers = widget.initialData.religionOthers;

    // Initialize Category checkboxes
    _categoryGeneral = widget.initialData.categoryGeneral;
    _categoryOBC = widget.initialData.categoryOBC;
    _categorySC = widget.initialData.categorySC;
    _categoryST = widget.initialData.categoryST;
    _categoryMinority = widget.initialData.categoryMinority;

    // Initialize Customer Type checkboxes and controllers
    _customerTypeGeneral = widget.initialData.customerTypeGeneral;
    _customerTypeSrCitizen = widget.initialData.customerTypeSrCitizen;
    _customerTypePensioner = widget.initialData.customerTypePensioner;
    _customerTypeMinor = widget.initialData.customerTypeMinor;
    _customerTypeStaffExStaff = widget.initialData.customerTypeStaffExStaff;
    _customerTypePfNoController = TextEditingController(
      text: widget.initialData.customerTypePfNo,
    );
    _customerTypeOthers = widget.initialData.customerTypeOthers;
    _customerTypeOthersSpecifyController = TextEditingController(
      text: widget.initialData.customerTypeOthersSpecify,
    );

    // Initialize Disability checkboxes
    _disabilityYes = widget.initialData.disabilityYes;
    _disabilityNo = widget.initialData.disabilityNo;
    _disabilityVisuallyImpaired = widget.initialData.disabilityVisuallyImpaired;
    _disabilityDifferentlyAbled = widget.initialData.disabilityDifferentlyAbled;

    // Initialize Education checkboxes
    _educationBelowSSC = widget.initialData.educationBelowSSC;
    _educationSSC = widget.initialData.educationSSC;
    _educationHSC = widget.initialData.educationHSC;
    _educationGraduate = widget.initialData.educationGraduate;
    _educationPostGraduate = widget.initialData.educationPostGraduate;
    _educationProfessional = widget.initialData.educationProfessional;
    _educationOthers = widget.initialData.educationOthers;

    // Initialize Organization and Business controllers
    _organizationNameController = TextEditingController(
      text: widget.initialData.organizationName,
    );
    _designationProfessionController = TextEditingController(
      text: widget.initialData.designationProfession,
    );
    _natureOfBusinessController = TextEditingController(
      text: widget.initialData.natureOfBusiness,
    );

    // Initialize Politically Exposed Person checkboxes
    _politicallyExposedPerson = widget.initialData.politicallyExposedPerson;
    _relatedToPoliticallyExposedPerson =
        widget.initialData.relatedToPoliticallyExposedPerson;
    _politicallyExposedNone = widget.initialData.politicallyExposedNone;

    // Initialize ISO and Tax Residence controllers
    _isoCountryCodeJurisdictionController = TextEditingController(
      text: widget.initialData.isoCountryCodeJurisdiction,
    );
    _isoCountryCodeOfBirthController = TextEditingController(
      text: widget.initialData.isoCountryCodeOfBirth,
    );
    _taxResidenceIndiaYes = widget.initialData.taxResidenceIndiaYes;
    _taxResidenceIndiaNo = widget.initialData.taxResidenceIndiaNo;

    _panTaxIdNumberController = TextEditingController(
      text: widget.initialData.panTaxIdNumber,
    );

    // Document Type checkboxes initialization
    _docTypePassport = widget.initialData.docTypePassport;
    _docTypeVoterIdCard = widget.initialData.docTypeVoterIdCard;
    _docTypeDrivingLicence = widget.initialData.docTypeDrivingLicence;
    _docTypeAadhaar = widget.initialData.docTypeAadhaar;
    _docTypeNregaJobCard = widget.initialData.docTypeNregaJobCard;
    _docTypePopulationRegisterLetter =
        widget.initialData.docTypePopulationRegisterLetter;

    _documentNoController = TextEditingController(
      text: widget.initialData.documentNo,
    );
    _issueDateController = TextEditingController(
      text: widget.initialData.issueDate,
    );
    _expiryDateController = TextEditingController(
      text: widget.initialData.expiryDate,
    );

    // Address Type checkboxes initialization
    _addressTypeResidentialBusiness =
        widget.initialData.addressTypeResidentialBusiness;
    _addressTypeResidential = widget.initialData.addressTypeResidential;
    _addressTypeBusiness = widget.initialData.addressTypeBusiness;
    _addressTypeRegisteredOffice =
        widget.initialData.addressTypeRegisteredOffice;
    _addressTypeUnspecified = widget.initialData.addressTypeUnspecified;

    _mobileNoController = TextEditingController(
      text: widget.initialData.mobileNo,
    );
    _emailIdController = TextEditingController(
      text: widget.initialData.emailId,
    );
    _alternateMobileNoController = TextEditingController(
      text: widget.initialData.alternateMobileNo,
    );
    _telOffController = TextEditingController(text: widget.initialData.telOff);
    _telResController = TextEditingController(text: widget.initialData.telRes);
    _aadharDocNoController = TextEditingController(
      text: widget.initialData.aadharDocNo,
    );
    _currentAddressController = TextEditingController(
      text: widget.initialData.currentAddress,
    );
    _currentAddressLine2Controller = TextEditingController(
      text: widget.initialData.currentAddressLine2,
    );
    _currentCityController = TextEditingController(
      text: widget.initialData.currentCity,
    );
    _currentDistrictController = TextEditingController(
      text: widget.initialData.currentDistrict,
    );
    _currentStateController = TextEditingController(
      text: widget.initialData.currentState,
    );
    _currentPinController = TextEditingController(
      text: widget.initialData.currentPin,
    );

    // Permanent Address controllers initialization
    _permanentAddressController = TextEditingController(
      text: widget.initialData.permanentAddress,
    );
    _permanentAddressLine2Controller = TextEditingController(
      text: widget.initialData.permanentAddressLine2,
    );
    _permanentCityController = TextEditingController(
      text: widget.initialData.permanentCity,
    );
    _permanentDistrictController = TextEditingController(
      text: widget.initialData.permanentDistrict,
    );
    _permanentStateController = TextEditingController(
      text: widget.initialData.permanentState,
    );
    _permanentPinController = TextEditingController(
      text: widget.initialData.permanentPin,
    );

    // Overseas Address controllers initialization
    _overseasAddressController = TextEditingController(
      text: widget.initialData.overseasAddress,
    );
    _overseasAddressLine2Controller = TextEditingController(
      text: widget.initialData.overseasAddressLine2,
    );
    _overseasCityController = TextEditingController(
      text: widget.initialData.overseasCity,
    );
    _overseasDistrictController = TextEditingController(
      text: widget.initialData.overseasDistrict,
    );
    _overseasStateController = TextEditingController(
      text: widget.initialData.overseasState,
    );
    _overseasPinController = TextEditingController(
      text: widget.initialData.overseasPin,
    );

    _dobController = TextEditingController(text: widget.initialData.dob);
    _occupationTypeController = TextEditingController(
      text: widget.initialData.occupationType,
    );
    _monthlyIncomeController = TextEditingController(
      text: widget.initialData.monthlyIncome,
    );
    _netWorthController = TextEditingController(
      text: widget.initialData.netWorth,
    );
    _estAnnualTurnoverController = TextEditingController(
      text: widget.initialData.estAnnualTurnover,
    );
    _noOfDependentsController = TextEditingController(
      text: widget.initialData.noOfDependents,
    );
    _guardianPrefixController = TextEditingController(
      text: widget.initialData.guardianPrefix,
    );
    _guardianNameController = TextEditingController(
      text: widget.initialData.guardianName,
    );
    _guardianMiddleNameController = TextEditingController(
      text: widget.initialData.guardianMiddleName,
    );
    _guardianSurnameController = TextEditingController(
      text: widget.initialData.guardianSurname,
    );
    _relationshipWithGuardianController = TextEditingController(
      text: widget.initialData.relationshipWithGuardian,
    );
    _placeCityOfBirthController = TextEditingController(
      text: widget.initialData.placeCityOfBirth,
    );
    _countryCodeOfBirthController = TextEditingController(
      text: widget.initialData.countryCodeOfBirth,
    );
    _citizenshipController = TextEditingController(
      text: widget.initialData.citizenship,
    );
    _panTaxIdNumberController = TextEditingController(
      text: widget.initialData.panTaxIdNumber,
    );
    _alternateCountryController = TextEditingController(
      text: widget.initialData.alternateCountry,
    );
    _stdCodeController = TextEditingController(
      text: widget.initialData.stdCode,
    );
    _landlineNoController = TextEditingController(
      text: widget.initialData.landlineNo,
    );
    _alternateStdCodeController = TextEditingController(
      text: widget.initialData.alternateStdCode,
    );
    _alternateLandlineNoController = TextEditingController(
      text: widget.initialData.alternateLandlineNo,
    );
    _documentNoController = TextEditingController(
      text: widget.initialData.documentNo,
    );
    _issueDateController = TextEditingController(
      text: widget.initialData.issueDate,
    );
    _expiryDateController = TextEditingController(
      text: widget.initialData.expiryDate,
    );

    // Initialize checkbox states
    _applicationTypeNew = widget.initialData.applicationTypeNew;
    _applicationTypeUpdate = widget.initialData.applicationTypeUpdate;
    _accountTypeNormal = widget.initialData.accountTypeNormal;
    _accountTypeSmallRisk = widget.initialData.accountTypeSmallRisk;

    // Add listeners to notify parent of changes
    _addListeners();
  }

  void _addListeners() {
    _branchNameController.addListener(_notifyChange);
    _branchCodeController.addListener(_notifyChange);
    _dateController.addListener(_notifyChange);
    _customerIdController.addListener(_notifyChange);
    _accountNoController.addListener(_notifyChange);
    _ckycNoController.addListener(_notifyChange);
    _existingCustomerIdController.addListener(_notifyChange);
    _customerFirstNameController.addListener(_notifyChange);
    _customerMiddleNameController.addListener(_notifyChange);
    _customerLastNameController.addListener(_notifyChange);
    _customerPrefixController.addListener(_notifyChange);
    _maidenNameController.addListener(_notifyChange);
    _maidenNamePrefixController.addListener(_notifyChange);
    _fatherNameController.addListener(_notifyChange);
    _fatherPrefixController.addListener(_notifyChange);
    _motherNameController.addListener(_notifyChange);
    _motherPrefixController.addListener(_notifyChange);
    _spouseNameController.addListener(_notifyChange);
    _spousePrefixController.addListener(_notifyChange);
    _identificationMarksController.addListener(_notifyChange);
    _countryNameController.addListener(_notifyChange);
    _customerTypePfNoController.addListener(_notifyChange);
    _customerTypeOthersSpecifyController.addListener(_notifyChange);
    _organizationNameController.addListener(_notifyChange);
    _designationProfessionController.addListener(_notifyChange);
    _natureOfBusinessController.addListener(_notifyChange);
    _isoCountryCodeJurisdictionController.addListener(_notifyChange);
    _isoCountryCodeOfBirthController.addListener(_notifyChange);
    _mobileNoController.addListener(_notifyChange);
    _emailIdController.addListener(_notifyChange);
    _alternateMobileNoController.addListener(_notifyChange);
    _telOffController.addListener(_notifyChange);
    _telResController.addListener(_notifyChange);
    _aadharDocNoController.addListener(_notifyChange);
    _currentAddressController.addListener(_notifyChange);
    _currentCityController.addListener(_notifyChange);
    _currentDistrictController.addListener(_notifyChange);
    _currentStateController.addListener(_notifyChange);
    _currentPinController.addListener(_notifyChange);
    _dobController.addListener(_notifyChange);
    _occupationTypeController.addListener(_notifyChange);
    _monthlyIncomeController.addListener(_notifyChange);
    _netWorthController.addListener(_notifyChange);
    _estAnnualTurnoverController.addListener(_notifyChange);
    _noOfDependentsController.addListener(_notifyChange);
    _guardianPrefixController.addListener(_notifyChange);
    _guardianNameController.addListener(_notifyChange);
    _guardianMiddleNameController.addListener(_notifyChange);
    _guardianSurnameController.addListener(_notifyChange);
    _relationshipWithGuardianController.addListener(_notifyChange);
    _placeCityOfBirthController.addListener(_notifyChange);
    _countryCodeOfBirthController.addListener(_notifyChange);
    _citizenshipController.addListener(_notifyChange);
    _panTaxIdNumberController.addListener(_notifyChange);
    _alternateCountryController.addListener(_notifyChange);
    _stdCodeController.addListener(_notifyChange);
    _landlineNoController.addListener(_notifyChange);
    _alternateStdCodeController.addListener(_notifyChange);
    _alternateLandlineNoController.addListener(_notifyChange);
    _documentNoController.addListener(_notifyChange);
    _issueDateController.addListener(_notifyChange);
    _expiryDateController.addListener(_notifyChange);
    _currentAddressLine2Controller.addListener(_notifyChange);
    _permanentAddressController.addListener(_notifyChange);
    _permanentAddressLine2Controller.addListener(_notifyChange);
    _permanentCityController.addListener(_notifyChange);
    _permanentDistrictController.addListener(_notifyChange);
    _permanentStateController.addListener(_notifyChange);
    _permanentPinController.addListener(_notifyChange);
    _overseasAddressController.addListener(_notifyChange);
    _overseasAddressLine2Controller.addListener(_notifyChange);
    _overseasCityController.addListener(_notifyChange);
    _overseasDistrictController.addListener(_notifyChange);
    _overseasStateController.addListener(_notifyChange);
    _overseasPinController.addListener(_notifyChange);
    _issueDateController.addListener(_notifyChange);
    _expiryDateController.addListener(_notifyChange);
  }

  void _notifyChange() {
    // Update model directly to preserve other fields (like signatures from Page 6)
    widget.initialData.branchName = _branchNameController.text;
    widget.initialData.branchCode = _branchCodeController.text;
    widget.initialData.date = _dateController.text;
    widget.initialData.customerId = _customerIdController.text;
    widget.initialData.accountNo = _accountNoController.text;
    widget.initialData.ckycNo = _ckycNoController.text;
    widget.initialData.existingCustomerId = _existingCustomerIdController.text;
    
    widget.initialData.applicationTypeNew = _applicationTypeNew;
    widget.initialData.applicationTypeUpdate = _applicationTypeUpdate;
    widget.initialData.accountTypeNormal = _accountTypeNormal;
    widget.initialData.accountTypeSmallRisk = _accountTypeSmallRisk;
    
    widget.initialData.customerFirstName = _customerFirstNameController.text;
    widget.initialData.customerMiddleName = _customerMiddleNameController.text;
    widget.initialData.customerLastName = _customerLastNameController.text;
    widget.initialData.customerPrefix = _customerPrefixController.text;
    widget.initialData.maidenName = _maidenNameController.text;
    widget.initialData.maidenNamePrefix = _maidenNamePrefixController.text;
    widget.initialData.fatherName = _fatherNameController.text;
    widget.initialData.fatherPrefix = _fatherPrefixController.text;
    widget.initialData.motherName = _motherNameController.text;
    widget.initialData.motherPrefix = _motherPrefixController.text;
    widget.initialData.spouseName = _spouseNameController.text;
    widget.initialData.spousePrefix = _spousePrefixController.text;
    
    widget.initialData.genderMale = _genderMale;
    widget.initialData.genderFemale = _genderFemale;
    widget.initialData.genderTransgender = _genderTransgender;
    widget.initialData.maritalStatusMarried = _maritalStatusMarried;
    widget.initialData.maritalStatusUnmarried = _maritalStatusUnmarried;
    widget.initialData.maritalStatusOthers = _maritalStatusOthers;
    
    widget.initialData.illiterateYes = _illiterateYes;
    widget.initialData.illiterateNo = _illiterateNo;
    widget.initialData.identificationMarks = _identificationMarksController.text;
    
    widget.initialData.nationalityInIndian = _nationalityInIndian;
    widget.initialData.nationalityOthers = _nationalityOthers;
    widget.initialData.countryName = _countryNameController.text; // Fixed: was using text directly
    widget.initialData.residentIndividual = _residentIndividual;
    widget.initialData.nonResidentIndian = _nonResidentIndian;
    widget.initialData.foreignNational = _foreignNational;
    widget.initialData.pio = _pio;
    
    widget.initialData.occupationSService = _occupationSService;
    widget.initialData.occupationPrivateSector = _occupationPrivateSector;
    widget.initialData.occupationPublicSector = _occupationPublicSector;
    widget.initialData.occupationGovernmentSector = _occupationGovernmentSector;
    widget.initialData.occupationOOthers = _occupationOOthers;
    widget.initialData.occupationProfessional = _occupationProfessional;
    widget.initialData.occupationSelfEmployed = _occupationSelfEmployed;
    widget.initialData.occupationRetired = _occupationRetired;
    widget.initialData.occupationHouseWife = _occupationHouseWife;
    widget.initialData.occupationStudent = _occupationStudent;
    widget.initialData.occupationBBusiness = _occupationBBusiness;
    widget.initialData.occupationAgriculture = _occupationAgriculture;
    widget.initialData.occupationXNotCategorised = _occupationXNotCategorised;
    
    widget.initialData.religionHindu = _religionHindu;
    widget.initialData.religionMuslim = _religionMuslim;
    widget.initialData.religionChristian = _religionChristian;
    widget.initialData.religionSikh = _religionSikh;
    widget.initialData.religionOthers = _religionOthers;
    
    widget.initialData.categoryGeneral = _categoryGeneral;
    widget.initialData.categoryOBC = _categoryOBC;
    widget.initialData.categorySC = _categorySC;
    widget.initialData.categoryST = _categoryST;
    widget.initialData.categoryMinority = _categoryMinority;
    
    widget.initialData.customerTypeGeneral = _customerTypeGeneral;
    widget.initialData.customerTypeSrCitizen = _customerTypeSrCitizen;
    widget.initialData.customerTypePensioner = _customerTypePensioner;
    widget.initialData.customerTypeMinor = _customerTypeMinor;
    widget.initialData.customerTypeStaffExStaff = _customerTypeStaffExStaff;
    widget.initialData.customerTypePfNo = _customerTypePfNoController.text;
    widget.initialData.customerTypeOthers = _customerTypeOthers;
    widget.initialData.customerTypeOthersSpecify = _customerTypeOthersSpecifyController.text;
    
    widget.initialData.disabilityYes = _disabilityYes;
    widget.initialData.disabilityNo = _disabilityNo;
    widget.initialData.disabilityVisuallyImpaired = _disabilityVisuallyImpaired;
    widget.initialData.disabilityDifferentlyAbled = _disabilityDifferentlyAbled;
    
    widget.initialData.educationBelowSSC = _educationBelowSSC;
    widget.initialData.educationSSC = _educationSSC;
    widget.initialData.educationHSC = _educationHSC;
    widget.initialData.educationGraduate = _educationGraduate;
    widget.initialData.educationPostGraduate = _educationPostGraduate;
    widget.initialData.educationProfessional = _educationProfessional;
    widget.initialData.educationOthers = _educationOthers;
    
    widget.initialData.organizationName = _organizationNameController.text;
    widget.initialData.designationProfession = _designationProfessionController.text;
    widget.initialData.natureOfBusiness = _natureOfBusinessController.text;
    
    widget.initialData.politicallyExposedPerson = _politicallyExposedPerson;
    widget.initialData.relatedToPoliticallyExposedPerson = _relatedToPoliticallyExposedPerson;
    widget.initialData.politicallyExposedNone = _politicallyExposedNone;
    
    widget.initialData.isoCountryCodeJurisdiction = _isoCountryCodeJurisdictionController.text;
    widget.initialData.isoCountryCodeOfBirth = _isoCountryCodeOfBirthController.text;
    widget.initialData.taxResidenceIndiaYes = _taxResidenceIndiaYes;
    widget.initialData.taxResidenceIndiaNo = _taxResidenceIndiaNo;
    
    widget.initialData.mobileNo = _mobileNoController.text;
    widget.initialData.emailId = _emailIdController.text;
    widget.initialData.alternateMobileNo = _alternateMobileNoController.text;
    widget.initialData.telOff = _telOffController.text;
    widget.initialData.telRes = _telResController.text;
    widget.initialData.aadharDocNo = _aadharDocNoController.text;
    widget.initialData.currentAddress = _currentAddressController.text;
    widget.initialData.currentCity = _currentCityController.text;
    widget.initialData.currentDistrict = _currentDistrictController.text;
    widget.initialData.currentState = _currentStateController.text;
    widget.initialData.currentPin = _currentPinController.text;
    widget.initialData.dob = _dobController.text;
    widget.initialData.occupationType = _occupationTypeController.text;
    widget.initialData.monthlyIncome = _monthlyIncomeController.text;
    widget.initialData.netWorth = _netWorthController.text;
    widget.initialData.estAnnualTurnover = _estAnnualTurnoverController.text;
    widget.initialData.noOfDependents = _noOfDependentsController.text;
    widget.initialData.guardianPrefix = _guardianPrefixController.text;
    widget.initialData.guardianName = _guardianNameController.text;
    widget.initialData.guardianMiddleName = _guardianMiddleNameController.text;
    widget.initialData.guardianSurname = _guardianSurnameController.text;
    widget.initialData.relationshipWithGuardian = _relationshipWithGuardianController.text;
    widget.initialData.placeCityOfBirth = _placeCityOfBirthController.text;
    widget.initialData.countryCodeOfBirth = _countryCodeOfBirthController.text;
    widget.initialData.citizenship = _citizenshipController.text;
    widget.initialData.panTaxIdNumber = _panTaxIdNumberController.text;
    widget.initialData.alternateCountry = _alternateCountryController.text;
    widget.initialData.stdCode = _stdCodeController.text;
    widget.initialData.landlineNo = _landlineNoController.text;
    widget.initialData.alternateStdCode = _alternateStdCodeController.text;
    widget.initialData.alternateLandlineNo = _alternateLandlineNoController.text;
    
    // Document Type checkboxes
    widget.initialData.docTypePassport = _docTypePassport;
    widget.initialData.docTypeVoterIdCard = _docTypeVoterIdCard;
    widget.initialData.docTypeDrivingLicence = _docTypeDrivingLicence;
    widget.initialData.docTypeAadhaar = _docTypeAadhaar;
    widget.initialData.docTypeNregaJobCard = _docTypeNregaJobCard;
    widget.initialData.docTypePopulationRegisterLetter = _docTypePopulationRegisterLetter;
    
    widget.initialData.documentNo = _documentNoController.text;
    widget.initialData.issueDate = _issueDateController.text;
    widget.initialData.expiryDate = _expiryDateController.text;
    
    // Address Type checkboxes
    widget.initialData.addressTypeResidentialBusiness = _addressTypeResidentialBusiness;
    widget.initialData.addressTypeResidential = _addressTypeResidential;
    widget.initialData.addressTypeBusiness = _addressTypeBusiness;
    widget.initialData.addressTypeRegisteredOffice = _addressTypeRegisteredOffice;
    widget.initialData.addressTypeUnspecified = _addressTypeUnspecified;
    
    // Addresses
    widget.initialData.currentAddressLine2 = _currentAddressLine2Controller.text;
    widget.initialData.permanentAddress = _permanentAddressController.text;
    widget.initialData.permanentAddressLine2 = _permanentAddressLine2Controller.text;
    widget.initialData.permanentCity = _permanentCityController.text;
    widget.initialData.permanentDistrict = _permanentDistrictController.text;
    widget.initialData.permanentState = _permanentStateController.text;
    widget.initialData.permanentPin = _permanentPinController.text;
    
    widget.initialData.overseasAddress = _overseasAddressController.text;
    widget.initialData.overseasAddressLine2 = _overseasAddressLine2Controller.text;
    widget.initialData.overseasCity = _overseasCityController.text;
    widget.initialData.overseasDistrict = _overseasDistrictController.text;
    widget.initialData.overseasState = _overseasStateController.text;
    widget.initialData.overseasPin = _overseasPinController.text;

    widget.onDataChanged(widget.initialData);
  }

  @override
  void dispose() {
    _branchNameController.dispose();
    _branchCodeController.dispose();
    _dateController.dispose();
    _customerIdController.dispose();
    _accountNoController.dispose();
    _ckycNoController.dispose();
    _existingCustomerIdController.dispose();
    _customerFirstNameController.dispose();
    _customerMiddleNameController.dispose();
    _customerLastNameController.dispose();
    _customerPrefixController.dispose();
    _maidenNameController.dispose();
    _maidenNamePrefixController.dispose();
    _fatherNameController.dispose();
    _fatherPrefixController.dispose();
    _motherNameController.dispose();
    _motherPrefixController.dispose();
    _spouseNameController.dispose();
    _spousePrefixController.dispose();
    _identificationMarksController.dispose();
    _countryNameController.dispose();
    _customerTypePfNoController.dispose();
    _customerTypeOthersSpecifyController.dispose();
    _organizationNameController.dispose();
    _designationProfessionController.dispose();
    _natureOfBusinessController.dispose();
    _isoCountryCodeJurisdictionController.dispose();
    _isoCountryCodeOfBirthController.dispose();
    _mobileNoController.dispose();
    _emailIdController.dispose();
    _alternateMobileNoController.dispose();
    _telOffController.dispose();
    _telResController.dispose();
    _aadharDocNoController.dispose();
    _currentAddressController.dispose();
    _currentCityController.dispose();
    _currentDistrictController.dispose();
    _currentStateController.dispose();
    _currentPinController.dispose();
    _dobController.dispose();
    _occupationTypeController.dispose();
    _monthlyIncomeController.dispose();
    _netWorthController.dispose();
    _estAnnualTurnoverController.dispose();
    _noOfDependentsController.dispose();
    _guardianPrefixController.dispose();
    _guardianNameController.dispose();
    _guardianMiddleNameController.dispose();
    _guardianSurnameController.dispose();
    _relationshipWithGuardianController.dispose();
    _placeCityOfBirthController.dispose();
    _countryCodeOfBirthController.dispose();
    _citizenshipController.dispose();
    _panTaxIdNumberController.dispose();
    _alternateCountryController.dispose();
    _stdCodeController.dispose();
    _landlineNoController.dispose();
    _alternateStdCodeController.dispose();
    _alternateLandlineNoController.dispose();
    _documentNoController.dispose();
    _issueDateController.dispose();
    _expiryDateController.dispose();
    _currentAddressLine2Controller.dispose();
    _permanentAddressController.dispose();
    _permanentAddressLine2Controller.dispose();
    _permanentCityController.dispose();
    _permanentDistrictController.dispose();
    _permanentStateController.dispose();
    _permanentPinController.dispose();
    _overseasAddressController.dispose();
    _overseasAddressLine2Controller.dispose();
    _overseasCityController.dispose();
    _overseasDistrictController.dispose();
    _overseasStateController.dispose();
    _overseasPinController.dispose();
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
            'Part-I: CIF Data',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle('Branch Information'),
          _buildTextField('Branch Name', _branchNameController),
          _buildTextField('Branch Code', _branchCodeController),
          FormHelper.buildDatePickerField(context, 'Date', _dateController),
          const SizedBox(height: 20),
          _buildSectionTitle('Customer Information'),
          _buildTextField('Customer ID', _customerIdController),
          _buildTextField('Account No', _accountNoController),
          _buildTextField('CKYC No', _ckycNoController),
          _buildTextField(
            'Existing Customer ID',
            _existingCustomerIdController,
          ),
          const SizedBox(height: 20),

          // Application Type Checkboxes
          _buildSectionTitle('Application Type'),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text('New'),
                  value: _applicationTypeNew,
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _applicationTypeNew = true;
                        _applicationTypeUpdate = false;
                      } else {
                        _applicationTypeNew = false;
                      }
                      _notifyChange();
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: const Text('Update'),
                  value: _applicationTypeUpdate,
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _applicationTypeUpdate = true;
                        _applicationTypeNew = false;
                      } else {
                        _applicationTypeUpdate = false;
                      }
                      _notifyChange();
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Account Type Checkboxes
          _buildSectionTitle('Account Type (CIF Level)'),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text('Normal'),
                  value: _accountTypeNormal,
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _accountTypeNormal = true;
                        _accountTypeSmallRisk = false;
                      } else {
                        _accountTypeNormal = false;
                      }
                      _notifyChange();
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: const Text('Small (For low risk customers)'),
                  value: _accountTypeSmallRisk,
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _accountTypeSmallRisk = true;
                        _accountTypeNormal = false;
                      } else {
                        _accountTypeSmallRisk = false;
                      }
                      _notifyChange();
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          _buildSectionTitle('Personal Details'),

          // Existing Customer ID
          _buildTextField(
            'Existing Customer ID (If applicable)',
            _existingCustomerIdController,
            maxLength: 10,
          ),
          const SizedBox(height: 10),

          // Name with Prefix - FIRST/MIDDLE/LAST NAME boxes
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: _buildTextField(
                  'Prefix',
                  _customerPrefixController,
                  maxLength: 3,
                  hint: 'Mr',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField(
                  'First Name *',
                  _customerFirstNameController,
                  maxLength: 15,
                  isRequired: true,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  'Middle Name',
                  _customerMiddleNameController,
                  maxLength: 15,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField(
                  'Last Name *',
                  _customerLastNameController,
                  maxLength: 15,
                  isRequired: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Maiden Name with Prefix
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: _buildTextField(
                  'Prefix',
                  _maidenNamePrefixController,
                  maxLength: 3,
                  hint: 'Ms',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField(
                  'Maiden Name',
                  _maidenNameController,
                  maxLength: 45,
                  hint: 'FIRST NAME MIDDLE LAST NAME',
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Date of Birth, Gender, and Marital Status in one row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: FormHelper.buildDatePickerField(
                  context,
                  'Date of Birth *',
                  _dobController,
                  validator: FormHelper.validateDateField,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender *',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    CheckboxListTile(
                      dense: true,
                      title: const Text('Male', style: TextStyle(fontSize: 13)),
                      value: _genderMale,
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            _genderMale = true;
                            _genderFemale = false;
                            _genderTransgender = false;
                          } else {
                            _genderMale = false;
                          }
                          _notifyChange();
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    CheckboxListTile(
                      dense: true,
                      title: const Text(
                        'Female',
                        style: TextStyle(fontSize: 13),
                      ),
                      value: _genderFemale,
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            _genderFemale = true;
                            _genderMale = false;
                            _genderTransgender = false;
                          } else {
                            _genderFemale = false;
                          }
                          _notifyChange();
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    CheckboxListTile(
                      dense: true,
                      title: const Text(
                        'Transgender',
                        style: TextStyle(fontSize: 13),
                      ),
                      value: _genderTransgender,
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            _genderTransgender = true;
                            _genderMale = false;
                            _genderFemale = false;
                          } else {
                            _genderTransgender = false;
                          }
                          _notifyChange();
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Marital Status *',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    CheckboxListTile(
                      dense: true,
                      title: const Text(
                        'Married',
                        style: TextStyle(fontSize: 13),
                      ),
                      value: _maritalStatusMarried,
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            _maritalStatusMarried = true;
                            _maritalStatusUnmarried = false;
                            _maritalStatusOthers = false;
                          } else {
                            _maritalStatusMarried = false;
                          }
                          _notifyChange();
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    CheckboxListTile(
                      dense: true,
                      title: const Text(
                        'Unmarried',
                        style: TextStyle(fontSize: 13),
                      ),
                      value: _maritalStatusUnmarried,
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            _maritalStatusUnmarried = true;
                            _maritalStatusMarried = false;
                            _maritalStatusOthers = false;
                          } else {
                            _maritalStatusUnmarried = false;
                          }
                          _notifyChange();
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    CheckboxListTile(
                      dense: true,
                      title: const Text(
                        'Others',
                        style: TextStyle(fontSize: 13),
                      ),
                      value: _maritalStatusOthers,
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            _maritalStatusOthers = true;
                            _maritalStatusMarried = false;
                            _maritalStatusUnmarried = false;
                          } else {
                            _maritalStatusOthers = false;
                          }
                          _notifyChange();
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Name of Father with Prefix
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: _buildTextField(
                  'Prefix',
                  _fatherPrefixController,
                  maxLength: 3,
                  hint: 'Mr',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField(
                  'Name of Father *',
                  _fatherNameController,
                  maxLength: 45,
                  isRequired: true,
                  hint: 'FIRST NAME MIDDLE LAST NAME',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Name of Mother with Prefix
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: _buildTextField(
                  'Prefix',
                  _motherPrefixController,
                  maxLength: 3,
                  hint: 'Mrs',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField(
                  'Name of Mother *',
                  _motherNameController,
                  maxLength: 45,
                  isRequired: true,
                  hint: 'FIRST NAME MIDDLE LAST NAME',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Name of Spouse with Prefix and note
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: _buildTextField(
                  'Prefix',
                  _spousePrefixController,
                  maxLength: 3,
                  hint: 'Mr/Mrs',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                      'Name of Spouse *',
                      _spouseNameController,
                      maxLength: 45,
                      isRequired: true,
                      hint: 'FIRST NAME MIDDLE LAST NAME',
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "(Father's name is mandatory if PAN is not provided)",
                      style: TextStyle(
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // No. of Dependents
          _buildTextField(
            'No. of Dependents',
            _noOfDependentsController,
            maxLength: 2,
            hint: '0-99',
            keyboardType: TextInputType.number,
            validator: FormHelper.validateNumberField,
          ),
          const SizedBox(height: 15),

          // Illiterate YES/NO
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Illiterate',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 5),
              CheckboxListTile(
                dense: true,
                title: const Text('YES', style: TextStyle(fontSize: 14)),
                value: _illiterateYes,
                onChanged: (val) {
                  setState(() {
                    _illiterateYes = val ?? false;
                    if (_illiterateYes) _illiterateNo = false;
                    _notifyChange();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                dense: true,
                title: const Text('NO', style: TextStyle(fontSize: 14)),
                value: _illiterateNo,
                onChanged: (val) {
                  setState(() {
                    _illiterateNo = val ?? false;
                    if (_illiterateNo) _illiterateYes = false;
                    _notifyChange();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Identification Marks (conditional - only if illiterate)
          if (_illiterateYes)
            _buildTextField(
              'Identification Marks',
              _identificationMarksController,
              hint: 'Specify identification marks',
            ),
          if (_illiterateYes) const SizedBox(height: 15),

          // Name of Guardian
          const Text(
            'Name of Guardian (if minor)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: _buildTextField(
                  'Prefix',
                  _guardianPrefixController,
                  maxLength: 3,
                  hint: 'Mr/Mrs',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField(
                  'Guardian Full Name',
                  _guardianNameController,
                  maxLength: 45,
                  hint: 'FIRST NAME MIDDLE LAST NAME',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTextField(
            'Relationship with Guardian',
            _relationshipWithGuardianController,
            maxLength: 20,
            hint: 'Father/Mother/Others',
          ),
          const SizedBox(height: 15),

          // Nationality
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nationality',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 5),
              CheckboxListTile(
                dense: true,
                title: const Text('In-Indian', style: TextStyle(fontSize: 14)),
                value: _nationalityInIndian,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _nationalityInIndian = true;
                      _nationalityOthers = false;
                    } else {
                      _nationalityInIndian = false;
                    }
                    _notifyChange();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                dense: true,
                title: const Text('Others', style: TextStyle(fontSize: 14)),
                value: _nationalityOthers,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _nationalityOthers = true;
                      _nationalityInIndian = false;
                    } else {
                      _nationalityOthers = false;
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

          // Country Name (conditional - only if nationality is Others)
          if (_nationalityOthers)
            _buildTextField(
              'Country Name',
              _countryNameController,
              maxLength: 30,
              hint: 'Enter country name',
            ),
          if (_nationalityOthers) const SizedBox(height: 15),

          // Resident Status
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Resident Status',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 5),
              CheckboxListTile(
                dense: true,
                title: const Text(
                  'Resident Individual',
                  style: TextStyle(fontSize: 14),
                ),
                value: _residentIndividual,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _residentIndividual = true;
                      _nonResidentIndian = false;
                      _foreignNational = false;
                      _pio = false;
                    } else {
                      _residentIndividual = false;
                    }
                    _notifyChange();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                dense: true,
                title: const Text(
                  'Non-Resident Indian',
                  style: TextStyle(fontSize: 14),
                ),
                value: _nonResidentIndian,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _nonResidentIndian = true;
                      _residentIndividual = false;
                      _foreignNational = false;
                      _pio = false;
                    } else {
                      _nonResidentIndian = false;
                    }
                    _notifyChange();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                dense: true,
                title: const Text(
                  'Foreign national',
                  style: TextStyle(fontSize: 14),
                ),
                value: _foreignNational,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _foreignNational = true;
                      _residentIndividual = false;
                      _nonResidentIndian = false;
                      _pio = false;
                    } else {
                      _foreignNational = false;
                    }
                    _notifyChange();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                dense: true,
                title: const Text('PIO', style: TextStyle(fontSize: 14)),
                value: _pio,
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      _pio = true;
                      _residentIndividual = false;
                      _nonResidentIndian = false;
                      _foreignNational = false;
                    } else {
                      _pio = false;
                    }
                    _notifyChange();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Occupation Type section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Occupation Type *',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.red.shade700,
                ),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 10,
                runSpacing: 5,
                children: [
                  _buildCompactCheckbox('S-Service', _occupationSService, (
                    val,
                  ) {
                    setState(() {
                      if (val == true) {
                        _occupationSService = true;
                        _occupationPrivateSector = false;
                        _occupationPublicSector = false;
                        _occupationGovernmentSector = false;
                        _occupationOOthers = false;
                        _occupationProfessional = false;
                        _occupationSelfEmployed = false;
                        _occupationRetired = false;
                        _occupationHouseWife = false;
                        _occupationStudent = false;
                        _occupationBBusiness = false;
                        _occupationAgriculture = false;
                        _occupationXNotCategorised = false;
                      } else {
                        _occupationSService = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox(
                    'Private Sector',
                    _occupationPrivateSector,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _occupationPrivateSector = true;
                          _occupationSService = false;
                          _occupationPublicSector = false;
                          _occupationGovernmentSector = false;
                          _occupationOOthers = false;
                          _occupationProfessional = false;
                          _occupationSelfEmployed = false;
                          _occupationRetired = false;
                          _occupationHouseWife = false;
                          _occupationStudent = false;
                          _occupationBBusiness = false;
                          _occupationAgriculture = false;
                          _occupationXNotCategorised = false;
                        } else {
                          _occupationPrivateSector = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox(
                    'Public Sector',
                    _occupationPublicSector,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _occupationPublicSector = true;
                          _occupationSService = false;
                          _occupationPrivateSector = false;
                          _occupationGovernmentSector = false;
                          _occupationOOthers = false;
                          _occupationProfessional = false;
                          _occupationSelfEmployed = false;
                          _occupationRetired = false;
                          _occupationHouseWife = false;
                          _occupationStudent = false;
                          _occupationBBusiness = false;
                          _occupationAgriculture = false;
                          _occupationXNotCategorised = false;
                        } else {
                          _occupationPublicSector = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox(
                    'Government Sector',
                    _occupationGovernmentSector,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _occupationGovernmentSector = true;
                          _occupationSService = false;
                          _occupationPrivateSector = false;
                          _occupationPublicSector = false;
                          _occupationOOthers = false;
                          _occupationProfessional = false;
                          _occupationSelfEmployed = false;
                          _occupationRetired = false;
                          _occupationHouseWife = false;
                          _occupationStudent = false;
                          _occupationBBusiness = false;
                          _occupationAgriculture = false;
                          _occupationXNotCategorised = false;
                        } else {
                          _occupationGovernmentSector = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox('O-Others', _occupationOOthers, (val) {
                    setState(() {
                      if (val == true) {
                        _occupationOOthers = true;
                        _occupationSService = false;
                        _occupationPrivateSector = false;
                        _occupationPublicSector = false;
                        _occupationGovernmentSector = false;
                        _occupationProfessional = false;
                        _occupationSelfEmployed = false;
                        _occupationRetired = false;
                        _occupationHouseWife = false;
                        _occupationStudent = false;
                        _occupationBBusiness = false;
                        _occupationAgriculture = false;
                        _occupationXNotCategorised = false;
                      } else {
                        _occupationOOthers = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox(
                    'Professional',
                    _occupationProfessional,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _occupationProfessional = true;
                          _occupationSService = false;
                          _occupationPrivateSector = false;
                          _occupationPublicSector = false;
                          _occupationGovernmentSector = false;
                          _occupationOOthers = false;
                          _occupationSelfEmployed = false;
                          _occupationRetired = false;
                          _occupationHouseWife = false;
                          _occupationStudent = false;
                          _occupationBBusiness = false;
                          _occupationAgriculture = false;
                          _occupationXNotCategorised = false;
                        } else {
                          _occupationProfessional = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox(
                    'Self employed',
                    _occupationSelfEmployed,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _occupationSelfEmployed = true;
                          _occupationSService = false;
                          _occupationPrivateSector = false;
                          _occupationPublicSector = false;
                          _occupationGovernmentSector = false;
                          _occupationOOthers = false;
                          _occupationProfessional = false;
                          _occupationRetired = false;
                          _occupationHouseWife = false;
                          _occupationStudent = false;
                          _occupationBBusiness = false;
                          _occupationAgriculture = false;
                          _occupationXNotCategorised = false;
                        } else {
                          _occupationSelfEmployed = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox('Retired', _occupationRetired, (val) {
                    setState(() {
                      if (val == true) {
                        _occupationRetired = true;
                        _occupationSService = false;
                        _occupationPrivateSector = false;
                        _occupationPublicSector = false;
                        _occupationGovernmentSector = false;
                        _occupationOOthers = false;
                        _occupationProfessional = false;
                        _occupationSelfEmployed = false;
                        _occupationHouseWife = false;
                        _occupationStudent = false;
                        _occupationBBusiness = false;
                        _occupationAgriculture = false;
                        _occupationXNotCategorised = false;
                      } else {
                        _occupationRetired = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('House Wife', _occupationHouseWife, (
                    val,
                  ) {
                    setState(() {
                      if (val == true) {
                        _occupationHouseWife = true;
                        _occupationSService = false;
                        _occupationPrivateSector = false;
                        _occupationPublicSector = false;
                        _occupationGovernmentSector = false;
                        _occupationOOthers = false;
                        _occupationProfessional = false;
                        _occupationSelfEmployed = false;
                        _occupationRetired = false;
                        _occupationStudent = false;
                        _occupationBBusiness = false;
                        _occupationAgriculture = false;
                        _occupationXNotCategorised = false;
                      } else {
                        _occupationHouseWife = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Student', _occupationStudent, (val) {
                    setState(() {
                      if (val == true) {
                        _occupationStudent = true;
                        _occupationSService = false;
                        _occupationPrivateSector = false;
                        _occupationPublicSector = false;
                        _occupationGovernmentSector = false;
                        _occupationOOthers = false;
                        _occupationProfessional = false;
                        _occupationSelfEmployed = false;
                        _occupationRetired = false;
                        _occupationHouseWife = false;
                        _occupationBBusiness = false;
                        _occupationAgriculture = false;
                        _occupationXNotCategorised = false;
                      } else {
                        _occupationStudent = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('B-Business', _occupationBBusiness, (
                    val,
                  ) {
                    setState(() {
                      if (val == true) {
                        _occupationBBusiness = true;
                        _occupationSService = false;
                        _occupationPrivateSector = false;
                        _occupationPublicSector = false;
                        _occupationGovernmentSector = false;
                        _occupationOOthers = false;
                        _occupationProfessional = false;
                        _occupationSelfEmployed = false;
                        _occupationRetired = false;
                        _occupationHouseWife = false;
                        _occupationStudent = false;
                        _occupationAgriculture = false;
                        _occupationXNotCategorised = false;
                      } else {
                        _occupationBBusiness = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Agriculture', _occupationAgriculture, (
                    val,
                  ) {
                    setState(() {
                      if (val == true) {
                        _occupationAgriculture = true;
                        _occupationSService = false;
                        _occupationPrivateSector = false;
                        _occupationPublicSector = false;
                        _occupationGovernmentSector = false;
                        _occupationOOthers = false;
                        _occupationProfessional = false;
                        _occupationSelfEmployed = false;
                        _occupationRetired = false;
                        _occupationHouseWife = false;
                        _occupationStudent = false;
                        _occupationBBusiness = false;
                        _occupationXNotCategorised = false;
                      } else {
                        _occupationAgriculture = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox(
                    'X-Not categorised',
                    _occupationXNotCategorised,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _occupationXNotCategorised = true;
                          _occupationSService = false;
                          _occupationPrivateSector = false;
                          _occupationPublicSector = false;
                          _occupationGovernmentSector = false;
                          _occupationOOthers = false;
                          _occupationProfessional = false;
                          _occupationSelfEmployed = false;
                          _occupationRetired = false;
                          _occupationHouseWife = false;
                          _occupationStudent = false;
                          _occupationBBusiness = false;
                          _occupationAgriculture = false;
                        } else {
                          _occupationXNotCategorised = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Monthly Income, Net Worth, Est. Annual Turnover in one row
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  'Monthly Income * (Rs.)',
                  _monthlyIncomeController,
                  isRequired: true,
                  keyboardType: TextInputType.number,
                  validator: FormHelper.validateDecimalField,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField(
                  'Net Worth (approx) (Rs.)',
                  _netWorthController,
                  keyboardType: TextInputType.number,
                  validator: FormHelper.validateDecimalField,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField(
                  'Est. Annual Turnover (Rs.)',
                  _estAnnualTurnoverController,
                  keyboardType: TextInputType.number,
                  validator: FormHelper.validateDecimalField,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Religion
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Religion:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 10,
                runSpacing: 5,
                children: [
                  _buildCompactCheckbox('Hindu', _religionHindu, (val) {
                    setState(() {
                      if (val == true) {
                        _religionHindu = true;
                        _religionMuslim = false;
                        _religionChristian = false;
                        _religionSikh = false;
                        _religionOthers = false;
                      } else {
                        _religionHindu = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Muslim', _religionMuslim, (val) {
                    setState(() {
                      if (val == true) {
                        _religionMuslim = true;
                        _religionHindu = false;
                        _religionChristian = false;
                        _religionSikh = false;
                        _religionOthers = false;
                      } else {
                        _religionMuslim = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Christian', _religionChristian, (val) {
                    setState(() {
                      if (val == true) {
                        _religionChristian = true;
                        _religionHindu = false;
                        _religionMuslim = false;
                        _religionSikh = false;
                        _religionOthers = false;
                      } else {
                        _religionChristian = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Sikh', _religionSikh, (val) {
                    setState(() {
                      if (val == true) {
                        _religionSikh = true;
                        _religionHindu = false;
                        _religionMuslim = false;
                        _religionChristian = false;
                        _religionOthers = false;
                      } else {
                        _religionSikh = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Others', _religionOthers, (val) {
                    setState(() {
                      if (val == true) {
                        _religionOthers = true;
                        _religionHindu = false;
                        _religionMuslim = false;
                        _religionChristian = false;
                        _religionSikh = false;
                      } else {
                        _religionOthers = false;
                      }
                      _notifyChange();
                    });
                  }),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Category
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Category:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 10,
                runSpacing: 5,
                children: [
                  _buildCompactCheckbox('General', _categoryGeneral, (val) {
                    setState(() {
                      if (val == true) {
                        _categoryGeneral = true;
                        _categoryOBC = false;
                        _categorySC = false;
                        _categoryST = false;
                        _categoryMinority = false;
                      } else {
                        _categoryGeneral = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('OBC', _categoryOBC, (val) {
                    setState(() {
                      if (val == true) {
                        _categoryOBC = true;
                        _categoryGeneral = false;
                        _categorySC = false;
                        _categoryST = false;
                        _categoryMinority = false;
                      } else {
                        _categoryOBC = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('SC', _categorySC, (val) {
                    setState(() {
                      if (val == true) {
                        _categorySC = true;
                        _categoryGeneral = false;
                        _categoryOBC = false;
                        _categoryST = false;
                        _categoryMinority = false;
                      } else {
                        _categorySC = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('ST', _categoryST, (val) {
                    setState(() {
                      if (val == true) {
                        _categoryST = true;
                        _categoryGeneral = false;
                        _categoryOBC = false;
                        _categorySC = false;
                        _categoryMinority = false;
                      } else {
                        _categoryST = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Minority', _categoryMinority, (val) {
                    setState(() {
                      if (val == true) {
                        _categoryMinority = true;
                        _categoryGeneral = false;
                        _categoryOBC = false;
                        _categorySC = false;
                        _categoryST = false;
                      } else {
                        _categoryMinority = false;
                      }
                      _notifyChange();
                    });
                  }),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Customer Type
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Customer Type:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 10,
                runSpacing: 5,
                children: [
                  _buildCompactCheckbox('General', _customerTypeGeneral, (val) {
                    setState(() {
                      if (val == true) {
                        _customerTypeGeneral = true;
                        _customerTypeSrCitizen = false;
                        _customerTypePensioner = false;
                        _customerTypeMinor = false;
                        _customerTypeStaffExStaff = false;
                        _customerTypeOthers = false;
                      } else {
                        _customerTypeGeneral = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Sr. Citizen', _customerTypeSrCitizen, (
                    val,
                  ) {
                    setState(() {
                      if (val == true) {
                        _customerTypeSrCitizen = true;
                        _customerTypeGeneral = false;
                        _customerTypePensioner = false;
                        _customerTypeMinor = false;
                        _customerTypeStaffExStaff = false;
                        _customerTypeOthers = false;
                      } else {
                        _customerTypeSrCitizen = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Pensioner', _customerTypePensioner, (
                    val,
                  ) {
                    setState(() {
                      if (val == true) {
                        _customerTypePensioner = true;
                        _customerTypeGeneral = false;
                        _customerTypeSrCitizen = false;
                        _customerTypeMinor = false;
                        _customerTypeStaffExStaff = false;
                        _customerTypeOthers = false;
                      } else {
                        _customerTypePensioner = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Minor', _customerTypeMinor, (val) {
                    setState(() {
                      if (val == true) {
                        _customerTypeMinor = true;
                        _customerTypeGeneral = false;
                        _customerTypeSrCitizen = false;
                        _customerTypePensioner = false;
                        _customerTypeStaffExStaff = false;
                        _customerTypeOthers = false;
                      } else {
                        _customerTypeMinor = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox(
                    'Staff / Ex-Staff',
                    _customerTypeStaffExStaff,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _customerTypeStaffExStaff = true;
                          _customerTypeGeneral = false;
                          _customerTypeSrCitizen = false;
                          _customerTypePensioner = false;
                          _customerTypeMinor = false;
                          _customerTypeOthers = false;
                        } else {
                          _customerTypeStaffExStaff = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox(
                    'Others (Specify)',
                    _customerTypeOthers,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _customerTypeOthers = true;
                          _customerTypeGeneral = false;
                          _customerTypeSrCitizen = false;
                          _customerTypePensioner = false;
                          _customerTypeMinor = false;
                          _customerTypeStaffExStaff = false;
                        } else {
                          _customerTypeOthers = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                ],
              ),
              if (_customerTypeStaffExStaff) ...[
                const SizedBox(height: 10),
                _buildTextField(
                  'PF No.',
                  _customerTypePfNoController,
                  hint: 'Enter PF Number',
                ),
              ],
              if (_customerTypeOthers) ...[
                const SizedBox(height: 10),
                _buildTextField(
                  'Specify Others',
                  _customerTypeOthersSpecifyController,
                  hint: 'Specify customer type',
                ),
              ],
            ],
          ),
          const SizedBox(height: 15),

          // Person with disability
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Person with disability',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Checkbox(
                    value: _disabilityYes,
                    onChanged: (val) {
                      setState(() {
                        _disabilityYes = val ?? false;
                        if (_disabilityYes) _disabilityNo = false;
                        _notifyChange();
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  const Text('Yes', style: TextStyle(fontSize: 13)),
                  const SizedBox(width: 20),
                  Checkbox(
                    value: _disabilityNo,
                    onChanged: (val) {
                      setState(() {
                        _disabilityNo = val ?? false;
                        if (_disabilityNo) _disabilityYes = false;
                        _notifyChange();
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  const Text('No', style: TextStyle(fontSize: 13)),
                ],
              ),
              if (_disabilityYes) ...[
                const SizedBox(height: 5),
                const Text(
                  'If yes:',
                  style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 5,
                  children: [
                    _buildCompactCheckbox(
                      'i. Visually impaired',
                      _disabilityVisuallyImpaired,
                      (val) {
                        setState(() {
                          if (val == true) {
                            _disabilityVisuallyImpaired = true;
                            _disabilityDifferentlyAbled = false;
                          } else {
                            _disabilityVisuallyImpaired = false;
                          }
                          _notifyChange();
                        });
                      },
                    ),
                    _buildCompactCheckbox(
                      'ii. Differently abled',
                      _disabilityDifferentlyAbled,
                      (val) {
                        setState(() {
                          if (val == true) {
                            _disabilityDifferentlyAbled = true;
                            _disabilityVisuallyImpaired = false;
                          } else {
                            _disabilityDifferentlyAbled = false;
                          }
                          _notifyChange();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ],
          ),
          const SizedBox(height: 15),

          // Educational Qualification
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Educational Qualification:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 10,
                runSpacing: 5,
                children: [
                  _buildCompactCheckbox('Below SSC', _educationBelowSSC, (val) {
                    setState(() {
                      if (val == true) {
                        _educationBelowSSC = true;
                        _educationSSC = false;
                        _educationHSC = false;
                        _educationGraduate = false;
                        _educationPostGraduate = false;
                        _educationProfessional = false;
                        _educationOthers = false;
                      } else {
                        _educationBelowSSC = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('SSC', _educationSSC, (val) {
                    setState(() {
                      if (val == true) {
                        _educationSSC = true;
                        _educationBelowSSC = false;
                        _educationHSC = false;
                        _educationGraduate = false;
                        _educationPostGraduate = false;
                        _educationProfessional = false;
                        _educationOthers = false;
                      } else {
                        _educationSSC = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('HSC', _educationHSC, (val) {
                    setState(() {
                      if (val == true) {
                        _educationHSC = true;
                        _educationBelowSSC = false;
                        _educationSSC = false;
                        _educationGraduate = false;
                        _educationPostGraduate = false;
                        _educationProfessional = false;
                        _educationOthers = false;
                      } else {
                        _educationHSC = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Graduate', _educationGraduate, (val) {
                    setState(() {
                      if (val == true) {
                        _educationGraduate = true;
                        _educationBelowSSC = false;
                        _educationSSC = false;
                        _educationHSC = false;
                        _educationPostGraduate = false;
                        _educationProfessional = false;
                        _educationOthers = false;
                      } else {
                        _educationGraduate = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox(
                    'Post Graduate',
                    _educationPostGraduate,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _educationPostGraduate = true;
                          _educationBelowSSC = false;
                          _educationSSC = false;
                          _educationHSC = false;
                          _educationGraduate = false;
                          _educationProfessional = false;
                          _educationOthers = false;
                        } else {
                          _educationPostGraduate = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox(
                    'Professional',
                    _educationProfessional,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _educationProfessional = true;
                          _educationBelowSSC = false;
                          _educationSSC = false;
                          _educationHSC = false;
                          _educationGraduate = false;
                          _educationPostGraduate = false;
                          _educationOthers = false;
                        } else {
                          _educationProfessional = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox('Others', _educationOthers, (val) {
                    setState(() {
                      if (val == true) {
                        _educationOthers = true;
                        _educationBelowSSC = false;
                        _educationSSC = false;
                        _educationHSC = false;
                        _educationGraduate = false;
                        _educationPostGraduate = false;
                        _educationProfessional = false;
                      } else {
                        _educationOthers = false;
                      }
                      _notifyChange();
                    });
                  }),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Organization Name, Designation/Profession, Nature of Business
          _buildTextField(
            'Organization\'s Name:',
            _organizationNameController,
            hint: 'Enter organization name',
          ),
          const SizedBox(height: 10),
          _buildTextField(
            'Designation/Profession:',
            _designationProfessionController,
            hint: 'Enter designation/profession',
          ),
          const SizedBox(height: 10),
          _buildTextField(
            'Nature of Business:',
            _natureOfBusinessController,
            hint: 'Enter nature of business',
          ),
          const SizedBox(height: 15),

          // Politically Exposed Person
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please Tick the Applicable box*:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 10,
                runSpacing: 5,
                children: [
                  _buildCompactCheckbox(
                    'Politically exposed Person',
                    _politicallyExposedPerson,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _politicallyExposedPerson = true;
                          _relatedToPoliticallyExposedPerson = false;
                          _politicallyExposedNone = false;
                        } else {
                          _politicallyExposedPerson = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox(
                    'Related to politically Exposed Person',
                    _relatedToPoliticallyExposedPerson,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _relatedToPoliticallyExposedPerson = true;
                          _politicallyExposedPerson = false;
                          _politicallyExposedNone = false;
                        } else {
                          _relatedToPoliticallyExposedPerson = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox('None', _politicallyExposedNone, (val) {
                    setState(() {
                      if (val == true) {
                        _politicallyExposedNone = true;
                        _politicallyExposedPerson = false;
                        _relatedToPoliticallyExposedPerson = false;
                      } else {
                        _politicallyExposedNone = false;
                      }
                      _notifyChange();
                    });
                  }),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),

          // ISO codes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ISO 3166 Country Code of Jurisdiction of Residence*',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.red.shade700,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                '(Code for India is IN)',
                style: TextStyle(
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _isoCountryCodeJurisdictionController,
                maxLength: 2,
                decoration: const InputDecoration(
                  hintText: 'IN',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  counterText: '',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTextField(
            'Place/City of Birth*',
            _placeCityOfBirthController,
            isRequired: true,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  'ISO 3166 Country Code of Birth*',
                  _isoCountryCodeOfBirthController,
                  maxLength: 2,
                  hint: 'IN',
                  isRequired: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField('Citizenship', _citizenshipController),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Tax Residence in India
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Country of Tax Residence in India only and not in any other country or territory outside India*',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Checkbox(
                    value: _taxResidenceIndiaYes,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _taxResidenceIndiaYes = true;
                          _taxResidenceIndiaNo = false;
                        } else {
                          _taxResidenceIndiaYes = false;
                        }
                        _notifyChange();
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  const Text('Yes', style: TextStyle(fontSize: 13)),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _taxResidenceIndiaNo,
                    onChanged: (val) {
                      setState(() {
                        if (val == true) {
                          _taxResidenceIndiaNo = true;
                          _taxResidenceIndiaYes = false;
                        } else {
                          _taxResidenceIndiaNo = false;
                        }
                        _notifyChange();
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  const Flexible(
                    child: Text(
                      'No (If No, please fill the FATCA details form - Annexure II)',
                      style: TextStyle(fontSize: 13),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),

          // PAN/Tax Identification Number
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'PAN*/Tax Identification Number or equivalent',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 3),
              const Text(
                '(If issued by jurisdiction) (If PAN is not submitted, submit Form 60 - Annexure I)',
                style: TextStyle(
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _panTaxIdNumberController,
                decoration: const InputDecoration(
                  hintText: 'Enter PAN/Tax ID',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Proof of Identity/Address Section
          _buildSectionTitle('Proof of Identity/Address'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Document Type',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  _buildCompactCheckbox('Passport', _docTypePassport, (val) {
                    setState(() {
                      if (val == true) {
                        _docTypePassport = true;
                        _docTypeVoterIdCard = false;
                        _docTypeDrivingLicence = false;
                        _docTypeAadhaar = false;
                        _docTypeNregaJobCard = false;
                        _docTypePopulationRegisterLetter = false;
                      } else {
                        _docTypePassport = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox('Voter ID Card', _docTypeVoterIdCard, (
                    val,
                  ) {
                    setState(() {
                      if (val == true) {
                        _docTypeVoterIdCard = true;
                        _docTypePassport = false;
                        _docTypeDrivingLicence = false;
                        _docTypeAadhaar = false;
                        _docTypeNregaJobCard = false;
                        _docTypePopulationRegisterLetter = false;
                      } else {
                        _docTypeVoterIdCard = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox(
                    'Driving Licence',
                    _docTypeDrivingLicence,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _docTypeDrivingLicence = true;
                          _docTypePassport = false;
                          _docTypeVoterIdCard = false;
                          _docTypeAadhaar = false;
                          _docTypeNregaJobCard = false;
                          _docTypePopulationRegisterLetter = false;
                        } else {
                          _docTypeDrivingLicence = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox('AADHAAR', _docTypeAadhaar, (val) {
                    setState(() {
                      if (val == true) {
                        _docTypeAadhaar = true;
                        _docTypePassport = false;
                        _docTypeVoterIdCard = false;
                        _docTypeDrivingLicence = false;
                        _docTypeNregaJobCard = false;
                        _docTypePopulationRegisterLetter = false;
                      } else {
                        _docTypeAadhaar = false;
                      }
                      _notifyChange();
                    });
                  }),
                  _buildCompactCheckbox(
                    'NREGA Job Card',
                    _docTypeNregaJobCard,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _docTypeNregaJobCard = true;
                          _docTypePassport = false;
                          _docTypeVoterIdCard = false;
                          _docTypeDrivingLicence = false;
                          _docTypeAadhaar = false;
                          _docTypePopulationRegisterLetter = false;
                        } else {
                          _docTypeNregaJobCard = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                  _buildCompactCheckbox(
                    'Letter (Population Register)',
                    _docTypePopulationRegisterLetter,
                    (val) {
                      setState(() {
                        if (val == true) {
                          _docTypePopulationRegisterLetter = true;
                          _docTypePassport = false;
                          _docTypeVoterIdCard = false;
                          _docTypeDrivingLicence = false;
                          _docTypeAadhaar = false;
                          _docTypeNregaJobCard = false;
                        } else {
                          _docTypePopulationRegisterLetter = false;
                        }
                        _notifyChange();
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTextField(
            'Document No./Identification Number*',
            _documentNoController,
            maxLength: 40,
          ),
          Row(
            children: [
              Expanded(
                child: FormHelper.buildDatePickerField(
                  context,
                  'Issue Date*',
                  _issueDateController,
                  validator: FormHelper.validateDateField,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FormHelper.buildDatePickerField(
                  context,
                  'Expiry Date (If applicable)*',
                  _expiryDateController,
                  validator: FormHelper.validateDateField,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Contact Information Section
          _buildSectionTitle('Contact Details'),
          const Text(
            '(All communications will be sent on provided Mobile No./Email-ID)',
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: _buildTextField(
                  'Mobile No. *',
                  _mobileNoController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  hint: '10 digits',
                  validator: FormHelper.validatePhoneField,
                ),
              ),
            ],
          ),
          _buildTextField(
            'Email ID',
            _emailIdController,
            keyboardType: TextInputType.emailAddress,
            maxLength: 50,
            validator: FormHelper.validateEmailField,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: _buildTextField(
                  'Alternate Mob. No.',
                  _alternateMobileNoController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  hint: '10 digits',
                  validator: FormHelper.validatePhoneField,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: _buildTextField(
                  'STD',
                  _stdCodeController,
                  keyboardType: TextInputType.phone,
                  maxLength: 3,
                  validator: FormHelper.validateNumberField,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: _buildTextField(
                  'Tel.(Off)',
                  _telOffController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  validator: FormHelper.validateNumberField,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: _buildTextField(
                  'STD',
                  _alternateStdCodeController,
                  keyboardType: TextInputType.phone,
                  maxLength: 3,
                  validator: FormHelper.validateNumberField,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: _buildTextField(
                  'Tel.(Res)',
                  _telResController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  validator: FormHelper.validateNumberField,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Address Details Section
          _buildSectionTitle('Address details'),
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Current',
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
                  'Permanent',
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
                  'Overseas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Address type*',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  _buildCompactCheckbox(
                    'Residential/Business',
                    _addressTypeResidentialBusiness,
                    (val) {
                      setState(() {
                        if (val == true) {
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
                  _buildCompactCheckbox(
                    'Residential',
                    _addressTypeResidential,
                    (val) {
                      setState(() {
                        if (val == true) {
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
                  _buildCompactCheckbox('Business', _addressTypeBusiness, (
                    val,
                  ) {
                    setState(() {
                      if (val == true) {
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
                  }),
                  _buildCompactCheckbox(
                    'Registered Office',
                    _addressTypeRegisteredOffice,
                    (val) {
                      setState(() {
                        if (val == true) {
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
                  _buildCompactCheckbox(
                    'Unspecified',
                    _addressTypeUnspecified,
                    (val) {
                      setState(() {
                        if (val == true) {
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
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Address* (Note: Fill in appropriate column - Current/Permanent/Overseas)',
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),

          // Current Address
          const Text(
            'Current Address:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 8),
          _buildTextField(
            'Address Line 1 *',
            _currentAddressController,
            maxLength: 80,
          ),
          _buildTextField(
            'Address Line 2',
            _currentAddressLine2Controller,
            maxLength: 80,
          ),
          _buildTextField(
            'City/Village*',
            _currentCityController,
            maxLength: 40,
          ),
          _buildTextField(
            'District*',
            _currentDistrictController,
            maxLength: 60,
          ),
          _buildTextField('State*', _currentStateController, maxLength: 40),
          _buildTextField(
            'Pin*',
            _currentPinController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            validator: FormHelper.validatePinField,
          ),
          const SizedBox(height: 15),

          // Permanent Address
          const Text(
            'Permanent Address:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 8),
          _buildTextField(
            'Address Line 1',
            _permanentAddressController,
            maxLength: 80,
          ),
          _buildTextField(
            'Address Line 2',
            _permanentAddressLine2Controller,
            maxLength: 80,
          ),
          _buildTextField(
            'City/Village',
            _permanentCityController,
            maxLength: 40,
          ),
          _buildTextField(
            'District',
            _permanentDistrictController,
            maxLength: 60,
          ),
          _buildTextField('State', _permanentStateController, maxLength: 40),
          _buildTextField(
            'Pin',
            _permanentPinController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            validator: FormHelper.validatePinField,
          ),
          const SizedBox(height: 15),

          // Overseas Address
          const Text(
            'Overseas Address:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 8),
          _buildTextField(
            'Address Line 1',
            _overseasAddressController,
            maxLength: 80,
          ),
          _buildTextField(
            'Address Line 2',
            _overseasAddressLine2Controller,
            maxLength: 80,
          ),
          _buildTextField(
            'City/Village',
            _overseasCityController,
            maxLength: 40,
          ),
          _buildTextField(
            'District',
            _overseasDistrictController,
            maxLength: 60,
          ),
          _buildTextField('State', _overseasStateController, maxLength: 40),
          _buildTextField(
            'Pin',
            _overseasPinController,
            keyboardType: TextInputType.phone,
            maxLength: 6,
            validator: FormHelper.validatePinField,
          ),
          const SizedBox(height: 20),
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
    bool isRequired = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          counterText: maxLength != null ? '' : null, // Hide default counter
          labelStyle: isRequired
              ? TextStyle(
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                )
              : null,
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator ??
            (isRequired
                ? (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  }
                : null),
      ),
    );
  }

  Widget _buildCompactCheckbox(
    String label,
    bool value,
    Function(bool?) onChanged,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
