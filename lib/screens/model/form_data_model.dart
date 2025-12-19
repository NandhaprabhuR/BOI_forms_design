// lib/form_data_model.dart

class FormDataModel {
  // --- Page 1: Part-I & CIF Data (pdfdesign1.dart) ---
  final String branchName;
  final String branchCode;
  final String date;
  final String customerId;
  final String accountNo;
  final String ckycNo;
  final String existingCustomerId;

  // --- Page 1: Application and Account Type Checkboxes ---
  final bool applicationTypeNew;
  final bool applicationTypeUpdate;
  final bool accountTypeNormal;
  final bool accountTypeSmallRisk;
  final String customerFirstName;
  final String customerMiddleName;
  final String customerLastName;
  final String customerPrefix;
  final String maidenName;
  final String maidenNamePrefix;
  final String fatherName;
  final String fatherPrefix;
  final String motherName;
  final String motherPrefix;
  final String spouseName;
  final String spousePrefix;

  // Gender and Marital Status
  final bool genderMale;
  final bool genderFemale;
  final bool genderTransgender;
  final bool maritalStatusMarried;
  final bool maritalStatusUnmarried;
  final bool maritalStatusOthers;

  final String mobileNo;
  final String emailId;
  final String alternateMobileNo;
  final String telOff;
  final String telRes;
  final String aadharDocNo;
  final String currentAddress;
  final String currentAddressLine2;
  final String currentCity;
  final String currentDistrict;
  final String currentState;
  final String currentPin;
  final String dob;

  // Occupation Type checkboxes
  final bool occupationSService;
  final bool occupationPrivateSector;
  final bool occupationPublicSector;
  final bool occupationGovernmentSector;
  final bool occupationOOthers;
  final bool occupationProfessional;
  final bool occupationSelfEmployed;
  final bool occupationRetired;
  final bool occupationHouseWife;
  final bool occupationStudent;
  final bool occupationBBusiness;
  final bool occupationAgriculture;
  final bool occupationXNotCategorised;

  final String occupationType;
  final String monthlyIncome;
  final String netWorth;
  final String estAnnualTurnover;
  final String noOfDependents;
  final bool illiterateYes;
  final bool illiterateNo;
  final String identificationMarks;
  final String guardianPrefix;
  final String guardianName;
  final String guardianMiddleName;
  final String guardianSurname;
  final String relationshipWithGuardian;

  // Nationality and Resident Status
  final bool nationalityInIndian;
  final bool nationalityOthers;
  final String countryName;
  final bool residentIndividual;
  final bool nonResidentIndian;
  final bool foreignNational;
  final bool pio;

  // Religion checkboxes
  final bool religionHindu;
  final bool religionMuslim;
  final bool religionChristian;
  final bool religionSikh;
  final bool religionOthers;

  // Category checkboxes
  final bool categoryGeneral;
  final bool categoryOBC;
  final bool categorySC;
  final bool categoryST;
  final bool categoryMinority;

  // Customer Type checkboxes
  final bool customerTypeGeneral;
  final bool customerTypeSrCitizen;
  final bool customerTypePensioner;
  final bool customerTypeMinor;
  final bool customerTypeStaffExStaff;
  final String customerTypePfNo;
  final bool customerTypeOthers;
  final String customerTypeOthersSpecify;

  // Person with disability
  final bool disabilityYes;
  final bool disabilityNo;
  final bool disabilityVisuallyImpaired;
  final bool disabilityDifferentlyAbled;

  // Educational Qualification checkboxes
  final bool educationBelowSSC;
  final bool educationSSC;
  final bool educationHSC;
  final bool educationGraduate;
  final bool educationPostGraduate;
  final bool educationProfessional;
  final bool educationOthers;

  // Organization and Business
  final String organizationName;
  final String designationProfession;
  final String natureOfBusiness;

  // Politically Exposed Person
  final bool politicallyExposedPerson;
  final bool relatedToPoliticallyExposedPerson;
  final bool politicallyExposedNone;

  // ISO codes and other
  final String isoCountryCodeJurisdiction;
  final String placeCityOfBirth;
  final String isoCountryCodeOfBirth;
  final String countryCodeOfBirth;
  final String citizenship;

  // Tax Residence
  final bool taxResidenceIndiaYes;
  final bool taxResidenceIndiaNo;
  final String panTaxIdNumber;
  final String alternateCountry;
  final String stdCode;
  final String landlineNo;
  final String alternateStdCode;
  final String alternateLandlineNo;

  // --- Document Details (Proof of Identity/Address) ---
  // Document type checkboxes
  final bool docTypePassport;
  final bool docTypeVoterIdCard;
  final bool docTypeDrivingLicence;
  final bool docTypeAadhaar;
  final bool docTypeNregaJobCard;
  final bool docTypePopulationRegisterLetter;

  final String documentNo;
  final String issueDate;
  final String expiryDate;

  // Address type checkboxes
  final bool addressTypeResidentialBusiness;
  final bool addressTypeResidential;
  final bool addressTypeBusiness;
  final bool addressTypeRegisteredOffice;
  final bool addressTypeUnspecified;

  // Permanent Address fields
  final String permanentAddress;
  final String permanentAddressLine2;
  final String permanentCity;
  final String permanentDistrict;
  final String permanentState;
  final String permanentPin;

  // Overseas Address fields
  final String overseasAddress;
  final String overseasAddressLine2;
  final String overseasCity;
  final String overseasDistrict;
  final String overseasState;
  final String overseasPin;

  // --- Page 2: Part-I Continuation (pdfdesign2.dart) ---
  // Section 5: Address details - Correspondence/Local/Same as Current-Permanent
  final String correspondenceAddress;
  final String correspondenceAddressLine2;
  final String correspondenceCity;
  final String correspondenceDistrict;
  final String correspondenceState;
  final String correspondencePin;

  final String localAddress;
  final String localAddressLine2;
  final String localCity;
  final String localDistrict;
  final String localState;
  final String localPin;

  final String sameAsAddress;
  final String sameAsAddressLine2;
  final String sameAsCity;
  final String sameAsDistrict;
  final String sameAsState;
  final String sameAsPin;

  // Section 6: Self Declaration
  final bool selfDeclarationAadhaarMismatch;

  // Section 7: Alternative address proof documents
  final bool altProofUtilityBill;
  final bool altProofPPOFPPO;
  final bool altProofPropertyTaxReceipt;
  final bool altProofLetterOfAllotment;
  final String altProofDocumentNo;
  final String altProofDate;

  // Section 8: Declaration cum Undertaking
  final bool declarationTermsAccepted;
  final bool declarationAadhaarSubmitted;
  final bool biometricConsentYes;
  final bool biometricConsentNo;
  final String applicantPhoto; // Photo path or base64
  final String applicantSignatureImage; // Signature image path or base64
  final String declarationPlace;
  final String declarationDate;

  // Legacy fields (kept for backward compatibility)
  final String ovdDocumentNo;
  final String ovdDocumentDate;
  final String applicantSignatureName;

  // --- Office Use/Attestation (Section 9) ---
  final bool officeVerificationYes;
  final bool officeVerificationNo;
  final bool depositorIlliterate;
  final bool depositorBlind;
  final String depositorStaff;
  final bool riskCategoryHigh;
  final bool riskCategoryMedium;
  final bool riskCategoryLow;
  final String officeIdentificationMarks;
  final String officialName;
  final String pfNo;
  final String designation;
  final String ssNo;
  final String officeUseDate;
  final String officialSignature;

  // --- Page 3: Part-II (pdfdesign3.dart) ---
  // Header fields
  final String page3Date;
  final String page3AccountNo;

  final String firstApplicantCustomerId;
  final String secondApplicantCustomerId;
  final String atmCardName;
  final String fdAmount;
  final String rdInstallment;
  final String debitAccountNo;
  final String modeOfOperationOther;
  final String nominationRegistrationNo;
  final String depositType;
  final String nominationAccountNo;

  // --- Page 4: Nomination DA-1 (pdfdesign4.dart) ---
  final String nomineeName;
  final String nomineeMobile;
  final String nomineeRelationship;
  final String nomineeDob;
  final String nomineeAddress;
  final String nomineeGuardianName;
  final String witness1Name;
  final String witness1Address;
  final String witness2Name;
  final String witness2Address;

  // --- Page 9: Annexure-2 (pdfdesign9.dart) ---
  final String relatedPersonFirstName;
  final String relatedPersonPrefix;
  final String relatedPersonDocNo;

  // --- Signatures and Photos ---
  final String signature1Text; // Path or Base64 for first signature
  final String signature2Text; // Path or Base64 for second signature
  final String witnessSignature1; // For nomination witness 1
  final String witnessSignature2; // For nomination witness 2

  // --- Checkboxes for Page 3: Account Type ---
  final bool accountTypeSavingsBank;
  final bool accountTypeBSBDA;
  final bool accountTypeSmallAccount;
  final bool accountTypeCurrent;
  final bool accountTypeFixedDeposit;
  final bool accountTypeCapsGain;

  // --- Checkboxes for Page 3: Mode of Operation ---
  final bool modeOfOperationSelf;
  final bool modeOfOperationEitherOrSurvivor;
  final bool modeOfOperationFormerOrSurvivor;
  final bool modeOfOperationAnyoneOrSurvivor;
  final bool modeOfOperationJointly;
  final bool modeOfOperationOtherCheckbox;
  final String modeOfOperationOtherText;

  // --- Checkboxes for Page 3: Services Required ---
  // Section 3: Services Required
  final bool atmCard1stApplicant;
  final bool atmCard2ndApplicant;
  final String atmCardName1stApplicant;
  final String atmCardName2ndApplicant;
  final bool chequeBookYes;
  final bool chequeBookNo;
  final bool internetBanking1stApplicantYes;
  final bool internetBanking1stApplicantNo;
  final bool internetBanking2ndApplicantYes;
  final bool internetBanking2ndApplicantNo;
  final bool smsAlertYes;
  final bool smsAlertNo;
  final bool phoneBankingYes;
  final bool phoneBankingNo;
  final bool mobileBankingYes;
  final bool mobileBankingNo;
  final bool passbookYes;
  final bool passbookNo;
  final bool eStatementRequired;
  final bool eStatementNotRequired;
  final bool netBankingYes;
  final bool netBankingNo;
  final bool emailStatementYes;
  final bool emailStatementNo;

  // --- Checkboxes for Page 3: Nomination ---
  final bool nominationYes;
  final bool nominationNo;

  // --- Checkboxes for Fixed Deposit Options ---
  final bool fdAutoRenewPrincipalPaybackInterest;
  final bool fdPayPrincipalAndInterest;
  final bool fdAutoRenewBoth;
  final bool fdAutoRenewPartAmount;

  // --- Checkboxes for Multi Option Deposit ---
  final bool modRecurringDeposit;
  final bool modDoubleBenefit;
  final bool modMICQIC;
  final bool modShortFixedDeposit;
  final bool modTaxSaving;
  final bool modCapitalGain;

  // --- Checkboxes for RD Installment Frequency ---
  final bool rdMonthly;
  final bool rdQuarterly;
  final bool rdCalenderQuarter;
  final bool rdHalfYearly;
  final bool rdYearly;

  // --- Additional Page 5-10 Checkboxes ---
  final bool fatcaIndianCitizen;
  final bool fatcaNonIndianCitizen;
  final bool pepYes;
  final bool pepNo;

  // --- Page 7: Form No.60 (Annexure-1) Fields ---
  final String form60FirstName;
  final String form60MiddleName;
  final String form60Surname;
  final String form60DateOfBirth;
  final String form60FatherName;
  final String form60FlatNo;
  final String form60PremisesName;
  final String form60RoadStreet;
  final String form60AreaLocality;
  final String form60TownDistrictState;
  final String form60PinCode;
  final String form60TelephoneSTD;
  final String form60MobileNumber;
  final String form60TransactionAmount;
  final String form60TransactionDate;
  final String form60JointPersonsCount;
  final bool form60ModeCash;
  final bool form60ModeCheque;
  final bool form60ModeCard;
  final bool form60ModeDraft;
  final bool form60ModeOnlineTransfer;
  final bool form60ModeOther;
  final String form60AadhaarNumber;

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

    // Page 4 Defaults
    this.nomineeName = '',
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

    // Checkbox Defaults - Additional
    this.fatcaIndianCitizen = false,
    this.fatcaNonIndianCitizen = false,
    this.pepYes = false,
    this.pepNo = false,

    // Page 7: Form No.60 Defaults
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
    );
  }
}
