// lib/form_data_model.dart

class FormDataModel {
  // --- Page 1: Part-I & CIF Data (pdfdesign1.dart) ---
  String branchName;
  String branchCode;
  String date;
  String customerId;
  String accountNo;
  String ckycNo;
  String existingCustomerId;

  // --- Page 1: Application and Account Type Checkboxes ---
  bool applicationTypeNew;
  bool applicationTypeUpdate;
  bool accountTypeNormal;
  bool accountTypeSmallRisk;
  String customerFirstName;
  String customerMiddleName;
  String customerLastName;
  String customerPrefix;
  String maidenName;
  String maidenNamePrefix;
  String fatherName;
  String fatherPrefix;
  String motherName;
  String motherPrefix;
  String spouseName;
  String spousePrefix;

  // Gender and Marital Status
  bool genderMale;
  bool genderFemale;
  bool genderTransgender;
  bool maritalStatusMarried;
  bool maritalStatusUnmarried;
  bool maritalStatusOthers;

  String mobileNo;
  String emailId;
  String alternateMobileNo;
  String telOff;
  String telRes;
  String aadharDocNo;
  String currentAddress;
  String currentAddressLine2;
  String currentCity;
  String currentDistrict;
  String currentState;
  String currentPin;
  String dob;

  // Occupation Type checkboxes
  bool occupationSService;
  bool occupationPrivateSector;
  bool occupationPublicSector;
  bool occupationGovernmentSector;
  bool occupationOOthers;
  bool occupationProfessional;
  bool occupationSelfEmployed;
  bool occupationRetired;
  bool occupationHouseWife;
  bool occupationStudent;
  bool occupationBBusiness;
  bool occupationAgriculture;
  bool occupationXNotCategorised;

  String occupationType;
  String monthlyIncome;
  String netWorth;
  String estAnnualTurnover;
  String noOfDependents;
  bool illiterateYes;
  bool illiterateNo;
  String identificationMarks;
  String guardianPrefix;
  String guardianName;
  String guardianMiddleName;
  String guardianSurname;
  String relationshipWithGuardian;

  // Nationality and Resident Status
  bool nationalityInIndian;
  bool nationalityOthers;
  String countryName;
  bool residentIndividual;
  bool nonResidentIndian;
  bool foreignNational;
  bool pio;

  // Religion checkboxes
  bool religionHindu;
  bool religionMuslim;
  bool religionChristian;
  bool religionSikh;
  bool religionOthers;

  // Category checkboxes
  bool categoryGeneral;
  bool categoryOBC;
  bool categorySC;
  bool categoryST;
  bool categoryMinority;

  // Customer Type checkboxes
  bool customerTypeGeneral;
  bool customerTypeSrCitizen;
  bool customerTypePensioner;
  bool customerTypeMinor;
  bool customerTypeStaffExStaff;
  String customerTypePfNo;
  bool customerTypeOthers;
  String customerTypeOthersSpecify;

  // Person with disability
  bool disabilityYes;
  bool disabilityNo;
  bool disabilityVisuallyImpaired;
  bool disabilityDifferentlyAbled;

  // Educational Qualification checkboxes
  bool educationBelowSSC;
  bool educationSSC;
  bool educationHSC;
  bool educationGraduate;
  bool educationPostGraduate;
  bool educationProfessional;
  bool educationOthers;

  // Organization and Business
  String organizationName;
  String designationProfession;
  String natureOfBusiness;

  // Politically Exposed Person
  bool politicallyExposedPerson;
  bool relatedToPoliticallyExposedPerson;
  bool politicallyExposedNone;

  // ISO codes and other
  String isoCountryCodeJurisdiction;
  String placeCityOfBirth;
  String isoCountryCodeOfBirth;
  String countryCodeOfBirth;
  String citizenship;

  // Tax Residence
  bool taxResidenceIndiaYes;
  bool taxResidenceIndiaNo;
  String panTaxIdNumber;
  String alternateCountry;
  String stdCode;
  String landlineNo;
  String alternateStdCode;
  String alternateLandlineNo;

  // --- Document Details (Proof of Identity/Address) ---
  // Document type checkboxes
  bool docTypePassport;
  bool docTypeVoterIdCard;
  bool docTypeDrivingLicence;
  bool docTypeAadhaar;
  bool docTypeNregaJobCard;
  bool docTypePopulationRegisterLetter;

  String documentNo;
  String issueDate;
  String expiryDate;

  // Address type checkboxes
  bool addressTypeResidentialBusiness;
  bool addressTypeResidential;
  bool addressTypeBusiness;
  bool addressTypeRegisteredOffice;
  bool addressTypeUnspecified;

  // Permanent Address fields
  String permanentAddress;
  String permanentAddressLine2;
  String permanentCity;
  String permanentDistrict;
  String permanentState;
  String permanentPin;

  // Overseas Address fields
  String overseasAddress;
  String overseasAddressLine2;
  String overseasCity;
  String overseasDistrict;
  String overseasState;
  String overseasPin;

  // --- Page 2: Part-I Continuation (pdfdesign2.dart) ---
  // Section 5: Address details - Correspondence/Local/Same as Current-Permanent
  String correspondenceAddress;
  String correspondenceAddressLine2;
  String correspondenceCity;
  String correspondenceDistrict;
  String correspondenceState;
  String correspondencePin;

  String localAddress;
  String localAddressLine2;
  String localCity;
  String localDistrict;
  String localState;
  String localPin;

  String sameAsAddress;
  String sameAsAddressLine2;
  String sameAsCity;
  String sameAsDistrict;
  String sameAsState;
  String sameAsPin;

  // Section 6: Self Declaration
  bool selfDeclarationAadhaarMismatch;

  // Section 7: Alternative address proof documents
  bool altProofUtilityBill;
  bool altProofPPOFPPO;
  bool altProofPropertyTaxReceipt;
  bool altProofLetterOfAllotment;
  String altProofDocumentNo;
  String altProofDate;

  // Section 8: Declaration cum Undertaking
  bool declarationTermsAccepted;
  bool declarationAadhaarSubmitted;
  bool biometricConsentYes;
  bool biometricConsentNo;
  String applicantPhoto; // Photo path or base64
  String applicantSignatureImage; // Signature image path or base64
  String declarationPlace;
  String declarationDate;

  // Legacy fields (kept for backward compatibility)
  String ovdDocumentNo;
  String ovdDocumentDate;
  String applicantSignatureName;

  // --- Office Use/Attestation (Section 9) ---
  bool officeVerificationYes;
  bool officeVerificationNo;
  bool depositorIlliterate;
  bool depositorBlind;
  String depositorStaff;
  bool riskCategoryHigh;
  bool riskCategoryMedium;
  bool riskCategoryLow;
  String officeIdentificationMarks;
  String officialName;
  String pfNo;
  String designation;
  String ssNo;
  String officeUseDate;
  String officialSignature;

  // --- Page 3: Part-II (pdfdesign3.dart) ---
  // Header fields
  String page3Date;
  String page3AccountNo;

  String firstApplicantCustomerId;
  String secondApplicantCustomerId;
  String atmCardName;
  String fdAmount;
  String rdInstallment;
  String debitAccountNo;
  String modeOfOperationOther;
  String nominationRegistrationNo;
  String depositType;
  String nominationAccountNo;
  String acknowledgementDate; // Page 6 Date

  // --- Page 4: DA-1 Nomination ---
  String nomineeName;
  String nomineeAge; // Page 6 Age
  String nomineeMobile;
  String nomineeRelationship;
  String nomineeDob;
  String nomineeAddress;
  String nomineeGuardianName;
  String witness1Name;
  String witness1Address;
  String witness2Name;
  String witness2Address;

  // --- Page 9: Annexure-2 (pdfdesign9.dart) ---
  String relatedPersonFirstName;
  String relatedPersonPrefix;
  String relatedPersonDocNo;

  // --- Signatures and Photos ---
  String signature1Text; // Path or Base64 for first signature
  String signature2Text; // Path or Base64 for second signature
  String signature3Text; // Path or Base64 for third signature (Page 10)
  String witnessSignature1; // For nomination witness 1
  String witnessSignature2; // For nomination witness 2

  // --- Checkboxes for Page 3: Account Type ---
  bool accountTypeSavingsBank;
  bool accountTypeBSBDA;
  bool accountTypeSmallAccount;
  bool accountTypeCurrent;
  bool accountTypeFixedDeposit;
  bool accountTypeCapsGain;

  // --- Checkboxes for Page 3: Mode of Operation ---
  bool modeOfOperationSelf;
  bool modeOfOperationEitherOrSurvivor;
  bool modeOfOperationFormerOrSurvivor;
  bool modeOfOperationAnyoneOrSurvivor;
  bool modeOfOperationJointly;
  bool modeOfOperationOtherCheckbox;
  String modeOfOperationOtherText;

  // --- Checkboxes for Page 3: Services Required ---
  // Section 3: Services Required
  bool atmCard1stApplicant;
  bool atmCard2ndApplicant;
  String atmCardName1stApplicant;
  String atmCardName2ndApplicant;
  bool chequeBookYes;
  bool chequeBookNo;
  bool internetBanking1stApplicantYes;
  bool internetBanking1stApplicantNo;
  bool internetBanking2ndApplicantYes;
  bool internetBanking2ndApplicantNo;
  bool smsAlertYes;
  bool smsAlertNo;
  bool phoneBankingYes;
  bool phoneBankingNo;
  bool mobileBankingYes;
  bool mobileBankingNo;
  bool passbookYes;
  bool passbookNo;
  bool eStatementRequired;
  bool eStatementNotRequired;
  bool netBankingYes;
  bool netBankingNo;
  bool emailStatementYes;
  bool emailStatementNo;

  // --- Missing Page 3 Checkboxes ---
  bool nominationYes;
  bool nominationNo;
  bool fdAutoRenewPrincipalPaybackInterest;
  bool fdPayPrincipalAndInterest;
  bool fdAutoRenewBoth;
  bool fdAutoRenewPartAmount;
  bool modRecurringDeposit;
  bool modDoubleBenefit;
  bool modMICQIC;
  bool modShortFixedDeposit;
  bool modTaxSaving;
  bool modCapitalGain;
  bool rdMonthly;
  bool rdQuarterly;
  bool rdCalenderQuarter;
  bool rdHalfYearly;
  bool rdYearly;

  // --- Page 3: Multi-Option Deposit/Recurring Deposit Options ---
  bool modTermDeposit;
  bool modTermDepositReinvestment;
  String modPeriodYears;
  String modPeriodMonths;

  // --- Page 9: POI Options (Annexure-2) ---
  bool poiPassport;
  bool poiVoterId;
  bool poiDrivingLicence;
  bool poiAadhaar;
  bool poiNregaJobCard;
  bool poiNprLetter;
  bool poiOthers;

  // --- Missing Page 7 (Form 60) Fields ---
  String form60FirstName;
  String form60MiddleName;
  String form60Surname;
  String form60DateOfBirth;
  String form60FatherName;
  String form60FlatNo;
  String form60PremisesName;
  String form60RoadStreet;
  String form60AreaLocality;
  String form60TownDistrictState;
  String form60PinCode;
  String form60TelephoneSTD;
  String form60MobileNumber;
  String form60TransactionAmount;
  String form60TransactionDate;
  String form60JointPersonsCount;
  bool form60ModeCash;
  bool form60ModeCheque;
  bool form60ModeCard;
  bool form60ModeDraft;
  bool form60ModeOnlineTransfer;
  bool form60ModeOther;
  String form60AadhaarNumber;
  String form60PanApplicationDate;
  String form60PanAckNo;
  String form60AgriculturalIncome;
  String form60OtherIncome;
  String form60VerifiedDay;
  String form60VerifiedMonth;
  String form60VerifiedYear;
  String form60VerificationPlace;
  String form60DeclarantSignature;

  // --- Missing Page 9 Fields ---
  bool fatcaIndianCitizen;
  bool fatcaNonIndianCitizen;
  bool pepYes;
  bool pepNo;

  // --- Page 6 Signatures (Mutable) ---
  String bsbdSignature = '';
  String ackApplicantSignature = '';
  String ackBankOfficialSignature = '';
  String fatcaDeclarantSignature = ''; // Added for Page 9 FATCA signature

  // --- MODIFIED: All default data is now blank ---
  FormDataModel({
    // Page 1 Defaults
    this.branchName = '',
    this.branchCode = '',
    this.date = '',
    this.customerId = '',
    this.accountNo = '',
    this.ckycNo = '',
    this.existingCustomerId = '',
    this.applicationTypeNew = false,
    this.applicationTypeUpdate = false,
    this.accountTypeNormal = false,
    this.accountTypeSmallRisk = false,
    this.customerFirstName = '',
    this.customerMiddleName = '',
    this.customerLastName = '',
    this.customerPrefix = '',
    this.maidenName = '',
    this.maidenNamePrefix = '',
    this.fatherName = '',
    this.fatherPrefix = '',
    this.motherName = '',
    this.motherPrefix = '',
    this.spouseName = '',
    this.spousePrefix = '',
    this.genderMale = false,
    this.genderFemale = false,
    this.genderTransgender = false,
    this.maritalStatusMarried = false,
    this.maritalStatusUnmarried = false,
    this.maritalStatusOthers = false,
    this.mobileNo = '',
    this.emailId = '',
    this.alternateMobileNo = '',
    this.telOff = '',
    this.telRes = '',
    this.aadharDocNo = '',
    this.currentAddress = '',
    this.currentAddressLine2 = '',
    this.currentCity = '',
    this.currentDistrict = '',
    this.currentState = '',
    this.currentPin = '',
    this.dob = '',
    this.occupationSService = false,
    this.occupationPrivateSector = false,
    this.occupationPublicSector = false,
    this.occupationGovernmentSector = false,
    this.occupationOOthers = false,
    this.occupationProfessional = false,
    this.occupationSelfEmployed = false,
    this.occupationRetired = false,
    this.occupationHouseWife = false,
    this.occupationStudent = false,
    this.occupationBBusiness = false,
    this.occupationAgriculture = false,
    this.occupationXNotCategorised = false,
    this.occupationType = '',
    this.monthlyIncome = '',
    this.netWorth = '',
    this.estAnnualTurnover = '',
    this.noOfDependents = '',
    this.illiterateYes = false,
    this.illiterateNo = false,
    this.identificationMarks = '',
    this.guardianPrefix = '',
    this.guardianName = '',
    this.guardianMiddleName = '',
    this.guardianSurname = '',
    this.relationshipWithGuardian = '',
    this.nationalityInIndian = false,
    this.nationalityOthers = false,
    this.countryName = '',
    this.residentIndividual = false,
    this.nonResidentIndian = false,
    this.foreignNational = false,
    this.pio = false,
    this.religionHindu = false,
    this.religionMuslim = false,
    this.religionChristian = false,
    this.religionSikh = false,
    this.religionOthers = false,
    this.categoryGeneral = false,
    this.categoryOBC = false,
    this.categorySC = false,
    this.categoryST = false,
    this.categoryMinority = false,
    this.customerTypeGeneral = false,
    this.customerTypeSrCitizen = false,
    this.customerTypePensioner = false,
    this.customerTypeMinor = false,
    this.customerTypeStaffExStaff = false,
    this.customerTypePfNo = '',
    this.customerTypeOthers = false,
    this.customerTypeOthersSpecify = '',
    this.disabilityYes = false,
    this.disabilityNo = false,
    this.disabilityVisuallyImpaired = false,
    this.disabilityDifferentlyAbled = false,
    this.educationBelowSSC = false,
    this.educationSSC = false,
    this.educationHSC = false,
    this.educationGraduate = false,
    this.educationPostGraduate = false,
    this.educationProfessional = false,
    this.educationOthers = false,
    this.organizationName = '',
    this.designationProfession = '',
    this.natureOfBusiness = '',
    this.politicallyExposedPerson = false,
    this.relatedToPoliticallyExposedPerson = false,
    this.politicallyExposedNone = false,
    this.isoCountryCodeJurisdiction = '',
    this.placeCityOfBirth = '',
    this.isoCountryCodeOfBirth = '',
    this.countryCodeOfBirth = '',
    this.citizenship = '',
    this.taxResidenceIndiaYes = false,
    this.taxResidenceIndiaNo = false,
    this.panTaxIdNumber = '',
    this.alternateCountry = '',
    this.stdCode = '',
    this.landlineNo = '',
    this.alternateStdCode = '',
    this.alternateLandlineNo = '',

    // Document Details
    this.docTypePassport = false,
    this.docTypeVoterIdCard = false,
    this.docTypeDrivingLicence = false,
    this.docTypeAadhaar = false,
    this.docTypeNregaJobCard = false,
    this.docTypePopulationRegisterLetter = false,
    this.documentNo = '',
    this.issueDate = '',
    this.expiryDate = '',

    // Address Type
    this.addressTypeResidentialBusiness = false,
    this.addressTypeResidential = false,
    this.addressTypeBusiness = false,
    this.addressTypeRegisteredOffice = false,
    this.addressTypeUnspecified = false,

    // Permanent Address
    this.permanentAddress = '',
    this.permanentAddressLine2 = '',
    this.permanentCity = '',
    this.permanentDistrict = '',
    this.permanentState = '',
    this.permanentPin = '',

    // Overseas Address
    this.overseasAddress = '',
    this.overseasAddressLine2 = '',
    this.overseasCity = '',
    this.overseasDistrict = '',
    this.overseasState = '',
    this.overseasPin = '',

    // Page 2 Defaults
    this.correspondenceAddress = '',
    this.correspondenceAddressLine2 = '',
    this.correspondenceCity = '',
    this.correspondenceDistrict = '',
    this.correspondenceState = '',
    this.correspondencePin = '',
    this.localAddress = '',
    this.localAddressLine2 = '',
    this.localCity = '',
    this.localDistrict = '',
    this.localState = '',
    this.localPin = '',
    this.sameAsAddress = '',
    this.sameAsAddressLine2 = '',
    this.sameAsCity = '',
    this.sameAsDistrict = '',
    this.sameAsState = '',
    this.sameAsPin = '',
    this.selfDeclarationAadhaarMismatch = false,
    this.altProofUtilityBill = false,
    this.altProofPPOFPPO = false,
    this.altProofPropertyTaxReceipt = false,
    this.altProofLetterOfAllotment = false,
    this.altProofDocumentNo = '',
    this.altProofDate = '',
    this.declarationTermsAccepted = false,
    this.declarationAadhaarSubmitted = false,
    this.biometricConsentYes = false,
    this.biometricConsentNo = false,
    this.applicantPhoto = '',
    this.applicantSignatureImage = '',
    this.declarationPlace = '',
    this.declarationDate = '',
    this.ovdDocumentNo = '',
    this.ovdDocumentDate = '',
    this.applicantSignatureName = '',

    // Office Use (Section 9)
    this.officeVerificationYes = false,
    this.officeVerificationNo = false,
    this.depositorIlliterate = false,
    this.depositorBlind = false,
    this.depositorStaff = '',
    this.riskCategoryHigh = false,
    this.riskCategoryMedium = false,
    this.riskCategoryLow = false,
    this.officeIdentificationMarks = '',
    this.officialName = '',
    this.pfNo = '',
    this.designation = '',
    this.ssNo = '',
    this.officeUseDate = '',
    this.officialSignature = '',

    // Page 3 Part-II Defaults
    this.page3Date = '',
    this.page3AccountNo = '',
    this.accountTypeSavingsBank = false,
    this.accountTypeBSBDA = false,
    this.accountTypeSmallAccount = false,
    this.accountTypeCurrent = false,
    this.accountTypeFixedDeposit = false,
    this.accountTypeCapsGain = false,
    this.modeOfOperationSelf = false,
    this.modeOfOperationEitherOrSurvivor = false,
    this.modeOfOperationFormerOrSurvivor = false,
    this.modeOfOperationAnyoneOrSurvivor = false,
    this.modeOfOperationJointly = false,
    this.modeOfOperationOtherCheckbox = false,
    this.modeOfOperationOtherText = '',
    this.firstApplicantCustomerId = '',
    this.secondApplicantCustomerId = '',
    this.atmCardName = '',
    this.fdAmount = '',
    this.rdInstallment = '',
    this.debitAccountNo = '',
    this.modeOfOperationOther = '',
    this.nominationRegistrationNo = '',
    this.depositType = '',
    this.nominationAccountNo = '',
    this.acknowledgementDate = '', // New field

    // Page 4 Defaults
    this.nomineeName = '',
    this.nomineeAge = '', // New field
    this.nomineeMobile = '',
    this.nomineeRelationship = '',
    this.nomineeDob = '',
    this.nomineeAddress = '',
    this.nomineeGuardianName = '',
    this.witness1Name = '',
    this.witness1Address = '',
    this.witness2Name = '',
    this.witness2Address = '',

    // Page 9 Defaults (Annexure-2)
    this.relatedPersonFirstName = '',
    this.relatedPersonPrefix = '',
    this.relatedPersonDocNo = '',

    // Signature and Photo Defaults
    this.signature1Text = '',
    this.signature2Text = '',
    this.signature3Text = '',
    this.witnessSignature1 = '',
    this.witnessSignature2 = '',

    // Checkbox Defaults - Services
    this.atmCard1stApplicant = false,
    this.atmCard2ndApplicant = false,
    this.atmCardName1stApplicant = '',
    this.atmCardName2ndApplicant = '',
    this.chequeBookYes = false,
    this.chequeBookNo = false,
    this.internetBanking1stApplicantYes = false,
    this.internetBanking1stApplicantNo = false,
    this.internetBanking2ndApplicantYes = false,
    this.internetBanking2ndApplicantNo = false,
    this.smsAlertYes = false,
    this.smsAlertNo = false,
    this.phoneBankingYes = false,
    this.phoneBankingNo = false,
    this.mobileBankingYes = false,
    this.mobileBankingNo = false,
    this.passbookYes = false,
    this.passbookNo = false,
    this.eStatementRequired = false,
    this.eStatementNotRequired = false,
    this.netBankingYes = false,
    this.netBankingNo = false,
    this.emailStatementYes = false,
    this.emailStatementNo = false,

    // Checkbox Defaults - Nomination
    this.nominationYes = false,
    this.nominationNo = false,

    // Checkbox Defaults - Fixed Deposit
    this.fdAutoRenewPrincipalPaybackInterest = false,
    this.fdPayPrincipalAndInterest = false,
    this.fdAutoRenewBoth = false,
    this.fdAutoRenewPartAmount = false,

    // Checkbox Defaults - Multi Option Deposit
    this.modRecurringDeposit = false,
    this.modDoubleBenefit = false,
    this.modMICQIC = false,
    this.modShortFixedDeposit = false,
    this.modTaxSaving = false,
    this.modCapitalGain = false,

    // Checkbox Defaults - RD Frequency
    this.rdMonthly = false,
    this.rdQuarterly = false,
    this.rdCalenderQuarter = false,
    this.rdHalfYearly = false,
    this.rdYearly = false,

    // Page 3: MOD/RD defaults
    this.modTermDeposit = false,
    this.modTermDepositReinvestment = false,
    this.modPeriodYears = '',
    this.modPeriodMonths = '',

    // Page 9: POI defaults
    this.poiPassport = false,
    this.poiVoterId = false,
    this.poiDrivingLicence = false,
    this.poiAadhaar = false,
    this.poiNregaJobCard = false,
    this.poiNprLetter = false,
    this.poiOthers = false,

    // Missing Page 7 (Form 60) Fields
    this.form60FirstName = '',
    this.form60MiddleName = '',
    this.form60Surname = '',
    this.form60DateOfBirth = '',
    this.form60FatherName = '',
    this.form60FlatNo = '',
    this.form60PremisesName = '',
    this.form60RoadStreet = '',
    this.form60AreaLocality = '',
    this.form60TownDistrictState = '',
    this.form60PinCode = '',
    this.form60TelephoneSTD = '',
    this.form60MobileNumber = '',
    this.form60TransactionAmount = '',
    this.form60TransactionDate = '',
    this.form60JointPersonsCount = '',
    this.form60ModeCash = false,
    this.form60ModeCheque = false,
    this.form60ModeCard = false,
    this.form60ModeDraft = false,
    this.form60ModeOnlineTransfer = false,
    this.form60ModeOther = false,
    this.form60AadhaarNumber = '',
    this.form60PanApplicationDate = '',
    this.form60PanAckNo = '',
    this.form60AgriculturalIncome = '',
    this.form60OtherIncome = '',
    this.form60VerifiedDay = '',
    this.form60VerifiedMonth = '',
    this.form60VerifiedYear = '',
    this.form60VerificationPlace = '',
    this.form60DeclarantSignature = '',

    // Missing Page 9 FATCA Checkboxes
    this.fatcaIndianCitizen = false,
    this.fatcaNonIndianCitizen = false,
    this.pepYes = false,
    this.pepNo = false,
  });

  // --- This 'fromMap' factory is already correct. ---
  // It reads your Excel file and fills the data.
  // If a field is blank in Excel, it will use the blank default from above.
  factory FormDataModel.fromMap(Map<String, dynamic> map) {
    // Get the default values from the main constructor
    final defaultModel = FormDataModel();

    // Helper function to safely get a value from the map.
    // It searches for the header *case-insensitively* and *trims spaces*.
    String getValue(String headerName, String modelDefault) {
      // Find the key in the map, ignoring case and spaces
      final key = map.keys.firstWhere(
        (k) => k.toString().trim().toLowerCase() == headerName.toLowerCase(),
        orElse: () => '', // Return empty string if no key matches
      );

      if (key.isNotEmpty) {
        final value = map[key]?.toString().trim();
        // If the value from Excel is not null and not empty, use it
        if (value != null && value.isNotEmpty) {
          return value;
        }
      }
      // Otherwise, use the default value from the FormDataModel (which is '')
      return modelDefault;
    }

    // Map all fields using the robust getValue helper
    return FormDataModel(
      branchName: getValue('branchName', defaultModel.branchName),
      branchCode: getValue('branchCode', defaultModel.branchCode),
      date: getValue('date', defaultModel.date),
      customerId: getValue('customerId', defaultModel.customerId),
      accountNo: getValue('accountNo', defaultModel.accountNo),
      ckycNo: getValue('ckycNo', defaultModel.ckycNo),
      existingCustomerId: getValue(
        'existingCustomerId',
        defaultModel.existingCustomerId,
      ),
      customerFirstName: getValue(
        'customerFirstName',
        defaultModel.customerFirstName,
      ),
      customerMiddleName: getValue(
        'customerMiddleName',
        defaultModel.customerMiddleName,
      ),
      customerLastName: getValue(
        'customerLastName',
        defaultModel.customerLastName,
      ),
      customerPrefix: getValue('customerPrefix', defaultModel.customerPrefix),
      maidenName: getValue('maidenName', defaultModel.maidenName),
      maidenNamePrefix: getValue(
        'maidenNamePrefix',
        defaultModel.maidenNamePrefix,
      ),
      fatherName: getValue('fatherName', defaultModel.fatherName),
      fatherPrefix: getValue('fatherPrefix', defaultModel.fatherPrefix),
      motherName: getValue('motherName', defaultModel.motherName),
      motherPrefix: getValue('motherPrefix', defaultModel.motherPrefix),
      spouseName: getValue('spouseName', defaultModel.spouseName),
      spousePrefix: getValue('spousePrefix', defaultModel.spousePrefix),
      mobileNo: getValue('mobileNo', defaultModel.mobileNo),
      emailId: getValue('emailId', defaultModel.emailId),
      alternateMobileNo: getValue(
        'alternateMobileNo',
        defaultModel.alternateMobileNo,
      ),
      telOff: getValue('telOff', defaultModel.telOff),
      telRes: getValue('telRes', defaultModel.telRes),
      aadharDocNo: getValue('aadharDocNo', defaultModel.aadharDocNo),
      currentAddress: getValue('currentAddress', defaultModel.currentAddress),
      currentAddressLine2: getValue(
        'currentAddressLine2',
        defaultModel.currentAddressLine2,
      ),
      currentCity: getValue('currentCity', defaultModel.currentCity),
      currentDistrict: getValue(
        'currentDistrict',
        defaultModel.currentDistrict,
      ),
      currentState: getValue('currentState', defaultModel.currentState),
      currentPin: getValue('currentPin', defaultModel.currentPin),
      dob: getValue('dob', defaultModel.dob),
      occupationSService:
          getValue(
            'occupationSService',
            defaultModel.occupationSService.toString(),
          ).toLowerCase() ==
          'true',
      occupationPrivateSector:
          getValue(
            'occupationPrivateSector',
            defaultModel.occupationPrivateSector.toString(),
          ).toLowerCase() ==
          'true',
      occupationPublicSector:
          getValue(
            'occupationPublicSector',
            defaultModel.occupationPublicSector.toString(),
          ).toLowerCase() ==
          'true',
      occupationGovernmentSector:
          getValue(
            'occupationGovernmentSector',
            defaultModel.occupationGovernmentSector.toString(),
          ).toLowerCase() ==
          'true',
      occupationOOthers:
          getValue(
            'occupationOOthers',
            defaultModel.occupationOOthers.toString(),
          ).toLowerCase() ==
          'true',
      occupationProfessional:
          getValue(
            'occupationProfessional',
            defaultModel.occupationProfessional.toString(),
          ).toLowerCase() ==
          'true',
      occupationSelfEmployed:
          getValue(
            'occupationSelfEmployed',
            defaultModel.occupationSelfEmployed.toString(),
          ).toLowerCase() ==
          'true',
      occupationRetired:
          getValue(
            'occupationRetired',
            defaultModel.occupationRetired.toString(),
          ).toLowerCase() ==
          'true',
      occupationHouseWife:
          getValue(
            'occupationHouseWife',
            defaultModel.occupationHouseWife.toString(),
          ).toLowerCase() ==
          'true',
      occupationStudent:
          getValue(
            'occupationStudent',
            defaultModel.occupationStudent.toString(),
          ).toLowerCase() ==
          'true',
      occupationBBusiness:
          getValue(
            'occupationBBusiness',
            defaultModel.occupationBBusiness.toString(),
          ).toLowerCase() ==
          'true',
      occupationAgriculture:
          getValue(
            'occupationAgriculture',
            defaultModel.occupationAgriculture.toString(),
          ).toLowerCase() ==
          'true',
      occupationXNotCategorised:
          getValue(
            'occupationXNotCategorised',
            defaultModel.occupationXNotCategorised.toString(),
          ).toLowerCase() ==
          'true',
      occupationType: getValue('occupationType', defaultModel.occupationType),
      monthlyIncome: getValue('monthlyIncome', defaultModel.monthlyIncome),
      netWorth: getValue('netWorth', defaultModel.netWorth),
      estAnnualTurnover: getValue(
        'estAnnualTurnover',
        defaultModel.estAnnualTurnover,
      ),
      noOfDependents: getValue('noOfDependents', defaultModel.noOfDependents),
      identificationMarks: getValue(
        'identificationMarks',
        defaultModel.identificationMarks,
      ),
      guardianPrefix: getValue('guardianPrefix', defaultModel.guardianPrefix),
      guardianName: getValue('guardianName', defaultModel.guardianName),
      guardianMiddleName: getValue(
        'guardianMiddleName',
        defaultModel.guardianMiddleName,
      ),
      guardianSurname: getValue(
        'guardianSurname',
        defaultModel.guardianSurname,
      ),
      relationshipWithGuardian: getValue(
        'relationshipWithGuardian',
        defaultModel.relationshipWithGuardian,
      ),
      countryName: getValue('countryName', defaultModel.countryName),
      religionHindu:
          getValue(
            'religionHindu',
            defaultModel.religionHindu.toString(),
          ).toLowerCase() ==
          'true',
      religionMuslim:
          getValue(
            'religionMuslim',
            defaultModel.religionMuslim.toString(),
          ).toLowerCase() ==
          'true',
      religionChristian:
          getValue(
            'religionChristian',
            defaultModel.religionChristian.toString(),
          ).toLowerCase() ==
          'true',
      religionSikh:
          getValue(
            'religionSikh',
            defaultModel.religionSikh.toString(),
          ).toLowerCase() ==
          'true',
      religionOthers:
          getValue(
            'religionOthers',
            defaultModel.religionOthers.toString(),
          ).toLowerCase() ==
          'true',
      categoryGeneral:
          getValue(
            'categoryGeneral',
            defaultModel.categoryGeneral.toString(),
          ).toLowerCase() ==
          'true',
      categoryOBC:
          getValue(
            'categoryOBC',
            defaultModel.categoryOBC.toString(),
          ).toLowerCase() ==
          'true',
      categorySC:
          getValue(
            'categorySC',
            defaultModel.categorySC.toString(),
          ).toLowerCase() ==
          'true',
      categoryST:
          getValue(
            'categoryST',
            defaultModel.categoryST.toString(),
          ).toLowerCase() ==
          'true',
      categoryMinority:
          getValue(
            'categoryMinority',
            defaultModel.categoryMinority.toString(),
          ).toLowerCase() ==
          'true',
      customerTypeGeneral:
          getValue(
            'customerTypeGeneral',
            defaultModel.customerTypeGeneral.toString(),
          ).toLowerCase() ==
          'true',
      customerTypeSrCitizen:
          getValue(
            'customerTypeSrCitizen',
            defaultModel.customerTypeSrCitizen.toString(),
          ).toLowerCase() ==
          'true',
      customerTypePensioner:
          getValue(
            'customerTypePensioner',
            defaultModel.customerTypePensioner.toString(),
          ).toLowerCase() ==
          'true',
      customerTypeMinor:
          getValue(
            'customerTypeMinor',
            defaultModel.customerTypeMinor.toString(),
          ).toLowerCase() ==
          'true',
      customerTypeStaffExStaff:
          getValue(
            'customerTypeStaffExStaff',
            defaultModel.customerTypeStaffExStaff.toString(),
          ).toLowerCase() ==
          'true',
      customerTypePfNo: getValue(
        'customerTypePfNo',
        defaultModel.customerTypePfNo,
      ),
      customerTypeOthers:
          getValue(
            'customerTypeOthers',
            defaultModel.customerTypeOthers.toString(),
          ).toLowerCase() ==
          'true',
      customerTypeOthersSpecify: getValue(
        'customerTypeOthersSpecify',
        defaultModel.customerTypeOthersSpecify,
      ),
      disabilityYes:
          getValue(
            'disabilityYes',
            defaultModel.disabilityYes.toString(),
          ).toLowerCase() ==
          'true',
      disabilityNo:
          getValue(
            'disabilityNo',
            defaultModel.disabilityNo.toString(),
          ).toLowerCase() ==
          'true',
      disabilityVisuallyImpaired:
          getValue(
            'disabilityVisuallyImpaired',
            defaultModel.disabilityVisuallyImpaired.toString(),
          ).toLowerCase() ==
          'true',
      disabilityDifferentlyAbled:
          getValue(
            'disabilityDifferentlyAbled',
            defaultModel.disabilityDifferentlyAbled.toString(),
          ).toLowerCase() ==
          'true',
      educationBelowSSC:
          getValue(
            'educationBelowSSC',
            defaultModel.educationBelowSSC.toString(),
          ).toLowerCase() ==
          'true',
      educationSSC:
          getValue(
            'educationSSC',
            defaultModel.educationSSC.toString(),
          ).toLowerCase() ==
          'true',
      educationHSC:
          getValue(
            'educationHSC',
            defaultModel.educationHSC.toString(),
          ).toLowerCase() ==
          'true',
      educationGraduate:
          getValue(
            'educationGraduate',
            defaultModel.educationGraduate.toString(),
          ).toLowerCase() ==
          'true',
      educationPostGraduate:
          getValue(
            'educationPostGraduate',
            defaultModel.educationPostGraduate.toString(),
          ).toLowerCase() ==
          'true',
      educationProfessional:
          getValue(
            'educationProfessional',
            defaultModel.educationProfessional.toString(),
          ).toLowerCase() ==
          'true',
      educationOthers:
          getValue(
            'educationOthers',
            defaultModel.educationOthers.toString(),
          ).toLowerCase() ==
          'true',
      organizationName: getValue(
        'organizationName',
        defaultModel.organizationName,
      ),
      designationProfession: getValue(
        'designationProfession',
        defaultModel.designationProfession,
      ),
      natureOfBusiness: getValue(
        'natureOfBusiness',
        defaultModel.natureOfBusiness,
      ),
      politicallyExposedPerson:
          getValue(
            'politicallyExposedPerson',
            defaultModel.politicallyExposedPerson.toString(),
          ).toLowerCase() ==
          'true',
      relatedToPoliticallyExposedPerson:
          getValue(
            'relatedToPoliticallyExposedPerson',
            defaultModel.relatedToPoliticallyExposedPerson.toString(),
          ).toLowerCase() ==
          'true',
      politicallyExposedNone:
          getValue(
            'politicallyExposedNone',
            defaultModel.politicallyExposedNone.toString(),
          ).toLowerCase() ==
          'true',
      isoCountryCodeJurisdiction: getValue(
        'isoCountryCodeJurisdiction',
        defaultModel.isoCountryCodeJurisdiction,
      ),
      placeCityOfBirth: getValue(
        'placeCityOfBirth',
        defaultModel.placeCityOfBirth,
      ),
      isoCountryCodeOfBirth: getValue(
        'isoCountryCodeOfBirth',
        defaultModel.isoCountryCodeOfBirth,
      ),
      countryCodeOfBirth: getValue(
        'countryCodeOfBirth',
        defaultModel.countryCodeOfBirth,
      ),
      citizenship: getValue('citizenship', defaultModel.citizenship),
      taxResidenceIndiaYes:
          getValue(
            'taxResidenceIndiaYes',
            defaultModel.taxResidenceIndiaYes.toString(),
          ).toLowerCase() ==
          'true',
      taxResidenceIndiaNo:
          getValue(
            'taxResidenceIndiaNo',
            defaultModel.taxResidenceIndiaNo.toString(),
          ).toLowerCase() ==
          'true',
      panTaxIdNumber: getValue('panTaxIdNumber', defaultModel.panTaxIdNumber),
      alternateCountry: getValue(
        'alternateCountry',
        defaultModel.alternateCountry,
      ),
      stdCode: getValue('stdCode', defaultModel.stdCode),
      landlineNo: getValue('landlineNo', defaultModel.landlineNo),
      alternateStdCode: getValue(
        'alternateStdCode',
        defaultModel.alternateStdCode,
      ),
      alternateLandlineNo: getValue(
        'alternateLandlineNo',
        defaultModel.alternateLandlineNo,
      ),

      // Document Details
      docTypePassport:
          getValue(
            'docTypePassport',
            defaultModel.docTypePassport.toString(),
          ).toLowerCase() ==
          'true',
      docTypeVoterIdCard:
          getValue(
            'docTypeVoterIdCard',
            defaultModel.docTypeVoterIdCard.toString(),
          ).toLowerCase() ==
          'true',
      docTypeDrivingLicence:
          getValue(
            'docTypeDrivingLicence',
            defaultModel.docTypeDrivingLicence.toString(),
          ).toLowerCase() ==
          'true',
      docTypeAadhaar:
          getValue(
            'docTypeAadhaar',
            defaultModel.docTypeAadhaar.toString(),
          ).toLowerCase() ==
          'true',
      docTypeNregaJobCard:
          getValue(
            'docTypeNregaJobCard',
            defaultModel.docTypeNregaJobCard.toString(),
          ).toLowerCase() ==
          'true',
      docTypePopulationRegisterLetter:
          getValue(
            'docTypePopulationRegisterLetter',
            defaultModel.docTypePopulationRegisterLetter.toString(),
          ).toLowerCase() ==
          'true',
      documentNo: getValue('documentNo', defaultModel.documentNo),
      issueDate: getValue('issueDate', defaultModel.issueDate),
      expiryDate: getValue('expiryDate', defaultModel.expiryDate),

      // Address Type
      addressTypeResidentialBusiness:
          getValue(
            'addressTypeResidentialBusiness',
            defaultModel.addressTypeResidentialBusiness.toString(),
          ).toLowerCase() ==
          'true',
      addressTypeResidential:
          getValue(
            'addressTypeResidential',
            defaultModel.addressTypeResidential.toString(),
          ).toLowerCase() ==
          'true',
      addressTypeBusiness:
          getValue(
            'addressTypeBusiness',
            defaultModel.addressTypeBusiness.toString(),
          ).toLowerCase() ==
          'true',
      addressTypeRegisteredOffice:
          getValue(
            'addressTypeRegisteredOffice',
            defaultModel.addressTypeRegisteredOffice.toString(),
          ).toLowerCase() ==
          'true',
      addressTypeUnspecified:
          getValue(
            'addressTypeUnspecified',
            defaultModel.addressTypeUnspecified.toString(),
          ).toLowerCase() ==
          'true',

      // Permanent Address
      permanentAddress: getValue(
        'permanentAddress',
        defaultModel.permanentAddress,
      ),
      permanentAddressLine2: getValue(
        'permanentAddressLine2',
        defaultModel.permanentAddressLine2,
      ),
      permanentCity: getValue('permanentCity', defaultModel.permanentCity),
      permanentDistrict: getValue(
        'permanentDistrict',
        defaultModel.permanentDistrict,
      ),
      permanentState: getValue('permanentState', defaultModel.permanentState),
      permanentPin: getValue('permanentPin', defaultModel.permanentPin),

      // Overseas Address
      overseasAddress: getValue(
        'overseasAddress',
        defaultModel.overseasAddress,
      ),
      overseasAddressLine2: getValue(
        'overseasAddressLine2',
        defaultModel.overseasAddressLine2,
      ),
      overseasCity: getValue('overseasCity', defaultModel.overseasCity),
      overseasDistrict: getValue(
        'overseasDistrict',
        defaultModel.overseasDistrict,
      ),
      overseasState: getValue('overseasState', defaultModel.overseasState),
      overseasPin: getValue('overseasPin', defaultModel.overseasPin),

      // Page 2
      correspondenceAddress: getValue(
        'correspondenceAddress',
        defaultModel.correspondenceAddress,
      ),
      correspondenceAddressLine2: getValue(
        'correspondenceAddressLine2',
        defaultModel.correspondenceAddressLine2,
      ),
      correspondenceCity: getValue(
        'correspondenceCity',
        defaultModel.correspondenceCity,
      ),
      correspondenceDistrict: getValue(
        'correspondenceDistrict',
        defaultModel.correspondenceDistrict,
      ),
      correspondenceState: getValue(
        'correspondenceState',
        defaultModel.correspondenceState,
      ),
      correspondencePin: getValue(
        'correspondencePin',
        defaultModel.correspondencePin,
      ),
      localAddress: getValue('localAddress', defaultModel.localAddress),
      localAddressLine2: getValue(
        'localAddressLine2',
        defaultModel.localAddressLine2,
      ),
      localCity: getValue('localCity', defaultModel.localCity),
      localDistrict: getValue('localDistrict', defaultModel.localDistrict),
      localState: getValue('localState', defaultModel.localState),
      localPin: getValue('localPin', defaultModel.localPin),
      sameAsAddress: getValue('sameAsAddress', defaultModel.sameAsAddress),
      sameAsAddressLine2: getValue(
        'sameAsAddressLine2',
        defaultModel.sameAsAddressLine2,
      ),
      sameAsCity: getValue('sameAsCity', defaultModel.sameAsCity),
      sameAsDistrict: getValue('sameAsDistrict', defaultModel.sameAsDistrict),
      sameAsState: getValue('sameAsState', defaultModel.sameAsState),
      sameAsPin: getValue('sameAsPin', defaultModel.sameAsPin),
      selfDeclarationAadhaarMismatch:
          getValue(
            'selfDeclarationAadhaarMismatch',
            defaultModel.selfDeclarationAadhaarMismatch.toString(),
          ).toLowerCase() ==
          'true',
      altProofUtilityBill:
          getValue(
            'altProofUtilityBill',
            defaultModel.altProofUtilityBill.toString(),
          ).toLowerCase() ==
          'true',
      altProofPPOFPPO:
          getValue(
            'altProofPPOFPPO',
            defaultModel.altProofPPOFPPO.toString(),
          ).toLowerCase() ==
          'true',
      altProofPropertyTaxReceipt:
          getValue(
            'altProofPropertyTaxReceipt',
            defaultModel.altProofPropertyTaxReceipt.toString(),
          ).toLowerCase() ==
          'true',
      altProofLetterOfAllotment:
          getValue(
            'altProofLetterOfAllotment',
            defaultModel.altProofLetterOfAllotment.toString(),
          ).toLowerCase() ==
          'true',
      altProofDocumentNo: getValue(
        'altProofDocumentNo',
        defaultModel.altProofDocumentNo,
      ),
      altProofDate: getValue('altProofDate', defaultModel.altProofDate),
      declarationTermsAccepted:
          getValue(
            'declarationTermsAccepted',
            defaultModel.declarationTermsAccepted.toString(),
          ).toLowerCase() ==
          'true',
      declarationAadhaarSubmitted:
          getValue(
            'declarationAadhaarSubmitted',
            defaultModel.declarationAadhaarSubmitted.toString(),
          ).toLowerCase() ==
          'true',
      biometricConsentYes:
          getValue(
            'biometricConsentYes',
            defaultModel.biometricConsentYes.toString(),
          ).toLowerCase() ==
          'true',
      biometricConsentNo:
          getValue(
            'biometricConsentNo',
            defaultModel.biometricConsentNo.toString(),
          ).toLowerCase() ==
          'true',
      applicantPhoto: getValue('applicantPhoto', defaultModel.applicantPhoto),
      applicantSignatureImage: getValue(
        'applicantSignatureImage',
        defaultModel.applicantSignatureImage,
      ),
      declarationPlace: getValue(
        'declarationPlace',
        defaultModel.declarationPlace,
      ),
      declarationDate: getValue(
        'declarationDate',
        defaultModel.declarationDate,
      ),
      ovdDocumentNo: getValue('ovdDocumentNo', defaultModel.ovdDocumentNo),
      ovdDocumentDate: getValue(
        'ovdDocumentDate',
        defaultModel.ovdDocumentDate,
      ),
      applicantSignatureName: getValue(
        'applicantSignatureName',
        defaultModel.applicantSignatureName,
      ),

      // Office Use (Section 9)
      officeVerificationYes:
          getValue(
            'officeVerificationYes',
            defaultModel.officeVerificationYes.toString(),
          ).toLowerCase() ==
          'true',
      officeVerificationNo:
          getValue(
            'officeVerificationNo',
            defaultModel.officeVerificationNo.toString(),
          ).toLowerCase() ==
          'true',
      depositorIlliterate:
          getValue(
            'depositorIlliterate',
            defaultModel.depositorIlliterate.toString(),
          ).toLowerCase() ==
          'true',
      depositorBlind:
          getValue(
            'depositorBlind',
            defaultModel.depositorBlind.toString(),
          ).toLowerCase() ==
          'true',
      depositorStaff: getValue('depositorStaff', defaultModel.depositorStaff),
      riskCategoryHigh:
          getValue(
            'riskCategoryHigh',
            defaultModel.riskCategoryHigh.toString(),
          ).toLowerCase() ==
          'true',
      riskCategoryMedium:
          getValue(
            'riskCategoryMedium',
            defaultModel.riskCategoryMedium.toString(),
          ).toLowerCase() ==
          'true',
      riskCategoryLow:
          getValue(
            'riskCategoryLow',
            defaultModel.riskCategoryLow.toString(),
          ).toLowerCase() ==
          'true',
      officeIdentificationMarks: getValue(
        'officeIdentificationMarks',
        defaultModel.officeIdentificationMarks,
      ),
      officialName: getValue('officialName', defaultModel.officialName),
      pfNo: getValue('pfNo', defaultModel.pfNo),
      designation: getValue('designation', defaultModel.designation),
      ssNo: getValue('ssNo', defaultModel.ssNo),
      officeUseDate: getValue('officeUseDate', defaultModel.officeUseDate),
      officialSignature: getValue(
        'officialSignature',
        defaultModel.officialSignature,
      ),

      // Page 3 Part-II
      page3Date: getValue('page3Date', defaultModel.page3Date),
      page3AccountNo: getValue('page3AccountNo', defaultModel.page3AccountNo),
      accountTypeSavingsBank:
          getValue(
            'accountTypeSavingsBank',
            defaultModel.accountTypeSavingsBank.toString(),
          ).toLowerCase() ==
          'true',
      accountTypeBSBDA:
          getValue(
            'accountTypeBSBDA',
            defaultModel.accountTypeBSBDA.toString(),
          ).toLowerCase() ==
          'true',
      accountTypeSmallAccount:
          getValue(
            'accountTypeSmallAccount',
            defaultModel.accountTypeSmallAccount.toString(),
          ).toLowerCase() ==
          'true',
      accountTypeCurrent:
          getValue(
            'accountTypeCurrent',
            defaultModel.accountTypeCurrent.toString(),
          ).toLowerCase() ==
          'true',
      accountTypeFixedDeposit:
          getValue(
            'accountTypeFixedDeposit',
            defaultModel.accountTypeFixedDeposit.toString(),
          ).toLowerCase() ==
          'true',
      accountTypeCapsGain:
          getValue(
            'accountTypeCapsGain',
            defaultModel.accountTypeCapsGain.toString(),
          ).toLowerCase() ==
          'true',
      modeOfOperationSelf:
          getValue(
            'modeOfOperationSelf',
            defaultModel.modeOfOperationSelf.toString(),
          ).toLowerCase() ==
          'true',
      modeOfOperationEitherOrSurvivor:
          getValue(
            'modeOfOperationEitherOrSurvivor',
            defaultModel.modeOfOperationEitherOrSurvivor.toString(),
          ).toLowerCase() ==
          'true',
      modeOfOperationFormerOrSurvivor:
          getValue(
            'modeOfOperationFormerOrSurvivor',
            defaultModel.modeOfOperationFormerOrSurvivor.toString(),
          ).toLowerCase() ==
          'true',
      modeOfOperationAnyoneOrSurvivor:
          getValue(
            'modeOfOperationAnyoneOrSurvivor',
            defaultModel.modeOfOperationAnyoneOrSurvivor.toString(),
          ).toLowerCase() ==
          'true',
      modeOfOperationJointly:
          getValue(
            'modeOfOperationJointly',
            defaultModel.modeOfOperationJointly.toString(),
          ).toLowerCase() ==
          'true',
      modeOfOperationOtherCheckbox:
          getValue(
            'modeOfOperationOtherCheckbox',
            defaultModel.modeOfOperationOtherCheckbox.toString(),
          ).toLowerCase() ==
          'true',
      modeOfOperationOtherText: getValue(
        'modeOfOperationOtherText',
        defaultModel.modeOfOperationOtherText,
      ),

      firstApplicantCustomerId: getValue(
        'firstApplicantCustomerId',
        defaultModel.firstApplicantCustomerId,
      ),
      secondApplicantCustomerId: getValue(
        'secondApplicantCustomerId',
        defaultModel.secondApplicantCustomerId,
      ),
      atmCardName: getValue('atmCardName', defaultModel.atmCardName),
      fdAmount: getValue('fdAmount', defaultModel.fdAmount),
      rdInstallment: getValue('rdInstallment', defaultModel.rdInstallment),
      debitAccountNo: getValue('debitAccountNo', defaultModel.debitAccountNo),
      modeOfOperationOther: getValue(
        'modeOfOperationOther',
        defaultModel.modeOfOperationOther,
      ),
      nominationRegistrationNo: getValue(
        'nominationRegistrationNo',
        defaultModel.nominationRegistrationNo,
      ),
      depositType: getValue('depositType', defaultModel.depositType),
      nominationAccountNo: getValue(
        'nominationAccountNo',
        defaultModel.nominationAccountNo,
      ),

      nomineeName: getValue('nomineeName', defaultModel.nomineeName),
      nomineeMobile: getValue('nomineeMobile', defaultModel.nomineeMobile),
      nomineeRelationship: getValue(
        'nomineeRelationship',
        defaultModel.nomineeRelationship,
      ),
      nomineeDob: getValue('nomineeDob', defaultModel.nomineeDob),
      nomineeAddress: getValue('nomineeAddress', defaultModel.nomineeAddress),
      nomineeGuardianName: getValue(
        'nomineeGuardianName',
        defaultModel.nomineeGuardianName,
      ),
      witness1Name: getValue('witness1Name', defaultModel.witness1Name),
      witness1Address: getValue(
        'witness1Address',
        defaultModel.witness1Address,
      ),
      witness2Name: getValue('witness2Name', defaultModel.witness2Name),
      witness2Address: getValue(
        'witness2Address',
        defaultModel.witness2Address,
      ),

      relatedPersonFirstName: getValue(
        'relatedPersonFirstName',
        defaultModel.relatedPersonFirstName,
      ),
      relatedPersonPrefix: getValue(
        'relatedPersonPrefix',
        defaultModel.relatedPersonPrefix,
      ),
      relatedPersonDocNo: getValue(
        'relatedPersonDocNo',
        defaultModel.relatedPersonDocNo,
      ),

      signature1Text: getValue('signature1Text', defaultModel.signature1Text),
      signature2Text: getValue('signature2Text', defaultModel.signature2Text),
      witnessSignature1: getValue(
        'witnessSignature1',
        defaultModel.witnessSignature1,
      ),
      witnessSignature2: getValue(
        'witnessSignature2',
        defaultModel.witnessSignature2,
      ),

      // Checkbox values - convert string to bool
      // Page 1 checkboxes
      applicationTypeNew:
          getValue('applicationTypeNew', '').toLowerCase() == 'true',
      applicationTypeUpdate:
          getValue('applicationTypeUpdate', '').toLowerCase() == 'true',
      accountTypeNormal:
          getValue('accountTypeNormal', '').toLowerCase() == 'true',
      accountTypeSmallRisk:
          getValue('accountTypeSmallRisk', '').toLowerCase() == 'true',
      genderMale: getValue('genderMale', '').toLowerCase() == 'true',
      genderFemale: getValue('genderFemale', '').toLowerCase() == 'true',
      genderTransgender:
          getValue('genderTransgender', '').toLowerCase() == 'true',
      maritalStatusMarried:
          getValue('maritalStatusMarried', '').toLowerCase() == 'true',
      maritalStatusUnmarried:
          getValue('maritalStatusUnmarried', '').toLowerCase() == 'true',
      maritalStatusOthers:
          getValue('maritalStatusOthers', '').toLowerCase() == 'true',
      illiterateYes: getValue('illiterateYes', '').toLowerCase() == 'true',
      illiterateNo: getValue('illiterateNo', '').toLowerCase() == 'true',
      nationalityInIndian:
          getValue('nationalityInIndian', '').toLowerCase() == 'true',
      nationalityOthers:
          getValue('nationalityOthers', '').toLowerCase() == 'true',
      residentIndividual:
          getValue('residentIndividual', '').toLowerCase() == 'true',
      nonResidentIndian:
          getValue('nonResidentIndian', '').toLowerCase() == 'true',
      foreignNational: getValue('foreignNational', '').toLowerCase() == 'true',
      pio: getValue('pio', '').toLowerCase() == 'true',

      // Page 3 checkboxes - Services Required
      atmCard1stApplicant:
          getValue('atmCard1stApplicant', '').toLowerCase() == 'true',
      atmCard2ndApplicant:
          getValue('atmCard2ndApplicant', '').toLowerCase() == 'true',
      atmCardName1stApplicant: getValue('atmCardName1stApplicant', ''),
      atmCardName2ndApplicant: getValue('atmCardName2ndApplicant', ''),
      chequeBookYes: getValue('chequeBookYes', '').toLowerCase() == 'true',
      chequeBookNo: getValue('chequeBookNo', '').toLowerCase() == 'true',
      internetBanking1stApplicantYes:
          getValue('internetBanking1stApplicantYes', '').toLowerCase() ==
          'true',
      internetBanking1stApplicantNo:
          getValue('internetBanking1stApplicantNo', '').toLowerCase() == 'true',
      internetBanking2ndApplicantYes:
          getValue('internetBanking2ndApplicantYes', '').toLowerCase() ==
          'true',
      internetBanking2ndApplicantNo:
          getValue('internetBanking2ndApplicantNo', '').toLowerCase() == 'true',
      smsAlertYes: getValue('smsAlertYes', '').toLowerCase() == 'true',
      smsAlertNo: getValue('smsAlertNo', '').toLowerCase() == 'true',
      phoneBankingYes: getValue('phoneBankingYes', '').toLowerCase() == 'true',
      phoneBankingNo: getValue('phoneBankingNo', '').toLowerCase() == 'true',
      mobileBankingYes:
          getValue('mobileBankingYes', '').toLowerCase() == 'true',
      mobileBankingNo: getValue('mobileBankingNo', '').toLowerCase() == 'true',
      passbookYes: getValue('passbookYes', '').toLowerCase() == 'true',
      passbookNo: getValue('passbookNo', '').toLowerCase() == 'true',
      eStatementRequired:
          getValue('eStatementRequired', '').toLowerCase() == 'true',
      eStatementNotRequired:
          getValue('eStatementNotRequired', '').toLowerCase() == 'true',
      netBankingYes: getValue('netBankingYes', '').toLowerCase() == 'true',
      netBankingNo: getValue('netBankingNo', '').toLowerCase() == 'true',
      emailStatementYes:
          getValue('emailStatementYes', '').toLowerCase() == 'true',
      emailStatementNo:
          getValue('emailStatementNo', '').toLowerCase() == 'true',

      nominationYes: getValue('nominationYes', '').toLowerCase() == 'true',
      nominationNo: getValue('nominationNo', '').toLowerCase() == 'true',

      fdAutoRenewPrincipalPaybackInterest:
          getValue('fdAutoRenewPrincipalPaybackInterest', '').toLowerCase() ==
          'true',
      fdPayPrincipalAndInterest:
          getValue('fdPayPrincipalAndInterest', '').toLowerCase() == 'true',
      fdAutoRenewBoth: getValue('fdAutoRenewBoth', '').toLowerCase() == 'true',
      fdAutoRenewPartAmount:
          getValue('fdAutoRenewPartAmount', '').toLowerCase() == 'true',

      modRecurringDeposit:
          getValue('modRecurringDeposit', '').toLowerCase() == 'true',
      modDoubleBenefit:
          getValue('modDoubleBenefit', '').toLowerCase() == 'true',
      modMICQIC: getValue('modMICQIC', '').toLowerCase() == 'true',
      modShortFixedDeposit:
          getValue('modShortFixedDeposit', '').toLowerCase() == 'true',
      modTaxSaving: getValue('modTaxSaving', '').toLowerCase() == 'true',
      modCapitalGain: getValue('modCapitalGain', '').toLowerCase() == 'true',

      rdMonthly: getValue('rdMonthly', '').toLowerCase() == 'true',
      rdQuarterly: getValue('rdQuarterly', '').toLowerCase() == 'true',
      rdCalenderQuarter:
          getValue('rdCalenderQuarter', '').toLowerCase() == 'true',
      rdHalfYearly: getValue('rdHalfYearly', '').toLowerCase() == 'true',
      rdYearly: getValue('rdYearly', '').toLowerCase() == 'true',

      fatcaIndianCitizen:
          getValue('fatcaIndianCitizen', '').toLowerCase() == 'true',
      fatcaNonIndianCitizen:
          getValue('fatcaNonIndianCitizen', '').toLowerCase() == 'true',
      pepYes: getValue('pepYes', '').toLowerCase() == 'true',
      pepNo: getValue('pepNo', '').toLowerCase() == 'true',

      // Page 7: Form No.60 fields
      form60FirstName: getValue('form60FirstName', ''),
      form60MiddleName: getValue('form60MiddleName', ''),
      form60Surname: getValue('form60Surname', ''),
      form60DateOfBirth: getValue('form60DateOfBirth', ''),
      form60FatherName: getValue('form60FatherName', ''),
      form60FlatNo: getValue('form60FlatNo', ''),
      form60PremisesName: getValue('form60PremisesName', ''),
      form60RoadStreet: getValue('form60RoadStreet', ''),
      form60AreaLocality: getValue('form60AreaLocality', ''),
      form60TownDistrictState: getValue('form60TownDistrictState', ''),
      form60PinCode: getValue('form60PinCode', ''),
      form60TelephoneSTD: getValue('form60TelephoneSTD', ''),
      form60MobileNumber: getValue('form60MobileNumber', ''),
      form60TransactionAmount: getValue('form60TransactionAmount', ''),
      form60TransactionDate: getValue('form60TransactionDate', ''),
      form60JointPersonsCount: getValue('form60JointPersonsCount', ''),
      form60ModeCash: getValue('form60ModeCash', '').toLowerCase() == 'true',
      form60ModeCheque:
          getValue('form60ModeCheque', '').toLowerCase() == 'true',
      form60ModeCard: getValue('form60ModeCard', '').toLowerCase() == 'true',
      form60ModeDraft: getValue('form60ModeDraft', '').toLowerCase() == 'true',
      form60ModeOnlineTransfer:
          getValue('form60ModeOnlineTransfer', '').toLowerCase() == 'true',
      form60ModeOther: getValue('form60ModeOther', '').toLowerCase() == 'true',
      form60AadhaarNumber: getValue('form60AadhaarNumber', ''),
      // Row 17: PAN application details
      form60PanApplicationDate: getValue('form60PanApplicationDate', ''),
      form60PanAckNo: getValue('form60PanAckNo', ''),
      // Row 18: Income details
      form60AgriculturalIncome: getValue('form60AgriculturalIncome', ''),
      form60OtherIncome: getValue('form60OtherIncome', ''),
      // Verification section fields
      form60VerifiedDay: getValue('form60VerifiedDay', ''),
      form60VerifiedMonth: getValue('form60VerifiedMonth', ''),
      form60VerifiedYear: getValue('form60VerifiedYear', ''),
      form60VerificationPlace: getValue('form60VerificationPlace', ''),
      form60DeclarantSignature: getValue('form60DeclarantSignature', ''),
    );
  }
}
