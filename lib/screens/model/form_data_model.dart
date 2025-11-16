// lib/form_data_model.dart

class FormDataModel {
  // --- Page 1: Part-I & CIF Data (pdfdesign1.dart) ---
  final String branchName;
  final String date;
  final String customerFirstName;
  final String customerMiddleName;
  final String customerLastName;
  final String customerPrefix;
  final String fatherName;
  final String motherName;
  final String spouseName;
  final String mobileNo;
  final String emailId;
  final String aadharDocNo;
  final String currentAddress;
  final String currentCity;
  final String currentDistrict;
  final String currentState;
  final String currentPin;
  final String dob;
  final String occupationType;
  final String noOfDependents;
  final String guardianPrefix;
  final String guardianName;
  final String relationshipWithGuardian;
  final String alternateCountry;
  final String stdCode;
  final String landlineNo;
  final String alternateStdCode;
  final String alternateLandlineNo;

  // --- Page 2: Part-I Continuation (pdfdesign2.dart) ---
  final String applicantSignatureName;
  final String declarationPlace;
  final String declarationDate;

  // --- Page 3: Part-II (pdfdesign3.dart) ---
  final String firstApplicantCustomerId;
  final String secondApplicantCustomerId;
  final String accountNo;
  final String atmCardName;
  final String fdAmount;
  final String rdInstallment;
  final String debitAccountNo;
  final String modeOfOperationOther;

  // --- Page 4: Nomination DA-1 (pdfdesign4.dart) ---
  final String nominationRegistrationNo;
  final String depositType;
  final String nominationAccountNo;
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

  // --- Page 7: Form 60 (pdfdesign7.dart) ---
  final String form60Surname;
  final String form60FatherName;
  final String form60VerifiedDay;
  final String form60VerifiedMonth;
  final String form60VerifiedYear;
  final String form60VerificationPlace;
  final String form60FlatNo;
  final String form60PremisesName;
  final String form60Road;
  final String form60AreaLocality;
  final String form60TownDistrictState;
  final String form60StdCode;
  final String form60TelephoneNo;
  final String form60TransactionAmount;
  final String form60TransactionDate;
  final String form60NoOfPersons;
  final String form60PanApplicationDate;
  final String form60PanAckNo;
  final String form60AgriculturalIncome;
  final String form60OtherIncome;
  final String form60IdentityDocCode;
  final String form60IdentityDocNo;
  final String form60IdentityIssuingAuthority;
  final String form60AddressDocCode;
  final String form60AddressDocNo;
  final String form60AddressIssuingAuthority;

  // --- Page 9: Annexure-2 (pdfdesign9.dart) ---
  final String relatedPersonFirstName;
  final String relatedPersonPrefix;
  final String relatedPersonDocNo;

  // --- Placeholder Signatures/Texts (Used across multiple pages) ---
  final String signature1Text;
  final String signature2Text;

  // --- Signature Images (file paths or asset names) ---
  final String signature1ImagePath;
  final String signature2ImagePath;
  final String signature3ImagePath;

  // --- MODIFIED: All default data is now blank ---
  FormDataModel({
    // Page 1 Defaults
    this.branchName = '',
    this.date = '',
    this.customerFirstName = '',
    this.customerMiddleName = '',
    this.customerLastName = '',
    this.customerPrefix = '',
    this.fatherName = '',
    this.motherName = '',
    this.spouseName = '',
    this.mobileNo = '',
    this.emailId = '',
    this.aadharDocNo = '',
    this.currentAddress = '',
    this.currentCity = '',
    this.currentDistrict = '',
    this.currentState = '',
    this.currentPin = '',
    this.dob = '',
    this.occupationType = '',
    this.noOfDependents = '',
    this.guardianPrefix = '',
    this.guardianName = '',
    this.relationshipWithGuardian = '',
    this.alternateCountry = '',
    this.stdCode = '',
    this.landlineNo = '',
    this.alternateStdCode = '',
    this.alternateLandlineNo = '',

    // Page 2 Defaults
    this.applicantSignatureName = '',
    this.declarationPlace = '',
    this.declarationDate = '',

    // Page 3 Defaults
    this.firstApplicantCustomerId = '',
    this.secondApplicantCustomerId = '',
    this.accountNo = '',
    this.atmCardName = '',
    this.fdAmount = '',
    this.rdInstallment = '',
    this.debitAccountNo = '',
    this.modeOfOperationOther = '',

    // Page 4 Defaults
    this.nominationRegistrationNo = '',
    this.depositType = '',
    this.nominationAccountNo = '',
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

    // Page 7 Defaults (Form 60)
    this.form60Surname = '',
    this.form60FatherName = '',
    this.form60VerifiedDay = '',
    this.form60VerifiedMonth = '',
    this.form60VerifiedYear = '',
    this.form60VerificationPlace = '',
    this.form60FlatNo = '',
    this.form60PremisesName = '',
    this.form60Road = '',
    this.form60AreaLocality = '',
    this.form60TownDistrictState = '',
    this.form60StdCode = '',
    this.form60TelephoneNo = '',
    this.form60TransactionAmount = '',
    this.form60TransactionDate = '',
    this.form60NoOfPersons = '',
    this.form60PanApplicationDate = '',
    this.form60PanAckNo = '',
    this.form60AgriculturalIncome = '',
    this.form60OtherIncome = '',
    this.form60IdentityDocCode = '',
    this.form60IdentityDocNo = '',
    this.form60IdentityIssuingAuthority = '',
    this.form60AddressDocCode = '',
    this.form60AddressDocNo = '',
    this.form60AddressIssuingAuthority = '',

    // Page 9 Defaults (Annexure-2)
    this.relatedPersonFirstName = '',
    this.relatedPersonPrefix = '',
    this.relatedPersonDocNo = '',

    // Signature Defaults
    this.signature1Text = '',
    this.signature2Text = '',
    this.signature1ImagePath = '',
    this.signature2ImagePath = '',
    this.signature3ImagePath = '',
  });

  // --- This 'fromMap' factory is already correct. ---
  // It reads your Excel file and fills the data.
  // If a field is blank in Excel, it will use the blank default from above.
  factory FormDataModel.fromMap(Map<String, dynamic> map) {
    // Get the default values from the main constructor
    final defaultModel = FormDataModel();

    // Helper function to safely get a value from the map.
    // It searches for the header *case-insensitively* and *trims spaces*.
    // Also supports multiple alternative header names.
    String getValue(
      String headerName,
      String modelDefault, [
      List<String>? alternatives,
    ]) {
      // Create a list of all possible header names (main + alternatives)
      final possibleNames = [headerName, ...(alternatives ?? [])];

      // Try to find any matching key
      for (final name in possibleNames) {
        final key = map.keys.firstWhere(
          (k) => k.toString().trim().toLowerCase() == name.toLowerCase(),
          orElse: () => '', // Return empty string if no key matches
        );

        if (key.isNotEmpty) {
          final value = map[key]?.toString().trim();
          // If the value from Excel is not null and not empty, use it
          if (value != null && value.isNotEmpty) {
            print('  ✓ Found "$headerName" → "$value"');
            return value;
          }
        }
      }

      // Otherwise, use the default value from the FormDataModel (which is '')
      print('  ✗ Not found "$headerName" (tried: ${possibleNames.join(", ")})');
      return modelDefault;
    }

    // Map all fields using the robust getValue helper
    return FormDataModel(
      branchName: getValue('Branch Name', defaultModel.branchName, [
        'branchName',
      ]),
      date: getValue('Date', defaultModel.date, ['date']),
      customerFirstName: getValue(
        'Customer First Name',
        defaultModel.customerFirstName,
        ['customerFirstName'],
      ),
      customerMiddleName: getValue(
        'Customer Middle Name',
        defaultModel.customerMiddleName,
        ['customerMiddleName'],
      ),
      customerLastName: getValue(
        'Customer Last Name',
        defaultModel.customerLastName,
        ['customerLastName'],
      ),
      customerPrefix: getValue('Customer Prefix', defaultModel.customerPrefix, [
        'customerPrefix',
      ]),
      fatherName: getValue('Father Name', defaultModel.fatherName, [
        'fatherName',
      ]),
      motherName: getValue('Mother Name', defaultModel.motherName, [
        'motherName',
      ]),
      spouseName: getValue('Spouse Name', defaultModel.spouseName, [
        'spouseName',
      ]),
      mobileNo: getValue('Mobile No.', defaultModel.mobileNo, [
        'Mobile No',
        'Mobile Number',
        'mobileNo',
      ]),
      emailId: getValue('Email ID', defaultModel.emailId, [
        'Email',
        'Email Id',
        'emailId',
      ]),
      aadharDocNo: getValue('Aadhar Doc No', defaultModel.aadharDocNo, [
        'Aadhar No.',
        'Aadhar No',
        'Aadhaar No',
        'Aadhaar Number',
        'aadharDocNo',
      ]),
      currentAddress: getValue('Current Address', defaultModel.currentAddress, [
        'Address',
        'currentAddress',
      ]),
      currentCity: getValue('Current City', defaultModel.currentCity, [
        'City',
        'currentCity',
      ]),
      currentDistrict: getValue(
        'Current District',
        defaultModel.currentDistrict,
        ['District', 'currentDistrict'],
      ),
      currentState: getValue('Current State', defaultModel.currentState, [
        'State',
        'currentState',
      ]),
      currentPin: getValue('Current Pin', defaultModel.currentPin, [
        'Pin',
        'Pincode',
        'Pin Code',
        'currentPin',
      ]),
      dob: getValue('DOB', defaultModel.dob, [
        'Date of Birth',
        'DateOfBirth',
        'dob',
      ]),
      occupationType: getValue('Occupation Type', defaultModel.occupationType, [
        'Occupation',
        'occupationType',
      ]),
      noOfDependents: getValue(
        'No Of Dependents',
        defaultModel.noOfDependents,
        ['noOfDependents'],
      ),
      guardianPrefix: getValue('Guardian Prefix', defaultModel.guardianPrefix, [
        'guardianPrefix',
      ]),
      guardianName: getValue('Guardian Name', defaultModel.guardianName, [
        'guardianName',
      ]),
      relationshipWithGuardian: getValue(
        'Relationship With Guardian',
        defaultModel.relationshipWithGuardian,
        ['relationshipWithGuardian'],
      ),
      alternateCountry: getValue(
        'Alternate Country',
        defaultModel.alternateCountry,
        ['alternateCountry'],
      ),
      stdCode: getValue('STD Code', defaultModel.stdCode, ['stdCode']),
      landlineNo: getValue('Landline No', defaultModel.landlineNo, [
        'landlineNo',
      ]),
      alternateStdCode: getValue(
        'Alternate STD Code',
        defaultModel.alternateStdCode,
        ['alternateStdCode'],
      ),
      alternateLandlineNo: getValue(
        'Alternate Landline No',
        defaultModel.alternateLandlineNo,
        ['alternateLandlineNo'],
      ),

      applicantSignatureName: getValue(
        'Applicant Signature Name',
        defaultModel.applicantSignatureName,
        ['applicantSignatureName'],
      ),
      declarationPlace: getValue(
        'Declaration Place',
        defaultModel.declarationPlace,
        ['declarationPlace'],
      ),
      declarationDate: getValue(
        'Declaration Date',
        defaultModel.declarationDate,
        ['declarationDate'],
      ),

      atmCardName: getValue('ATM Card Name', defaultModel.atmCardName, [
        'atmCardName',
      ]),
      fdAmount: getValue('FD Amount', defaultModel.fdAmount, ['fdAmount']),
      rdInstallment: getValue('RD Installment', defaultModel.rdInstallment, [
        'rdInstallment',
      ]),
      debitAccountNo: getValue(
        'Debit Account No',
        defaultModel.debitAccountNo,
        ['debitAccountNo'],
      ),
      firstApplicantCustomerId: getValue(
        'First Applicant Customer ID',
        defaultModel.firstApplicantCustomerId,
        ['firstApplicantCustomerId'],
      ),
      secondApplicantCustomerId: getValue(
        'Second Applicant Customer ID',
        defaultModel.secondApplicantCustomerId,
        ['secondApplicantCustomerId'],
      ),
      accountNo: getValue('Account No', defaultModel.accountNo, ['accountNo']),
      modeOfOperationOther: getValue(
        'Mode Of Operation Other',
        defaultModel.modeOfOperationOther,
        ['modeOfOperationOther'],
      ),

      nominationRegistrationNo: getValue(
        'Nomination Registration No',
        defaultModel.nominationRegistrationNo,
        ['nominationRegistrationNo'],
      ),
      depositType: getValue('Deposit Type', defaultModel.depositType, [
        'depositType',
      ]),
      nominationAccountNo: getValue(
        'Nomination Account No',
        defaultModel.nominationAccountNo,
        ['nominationAccountNo'],
      ),
      nomineeName: getValue('Nominee Name', defaultModel.nomineeName, [
        'nomineeName',
      ]),
      nomineeMobile: getValue('Nominee Mobile', defaultModel.nomineeMobile, [
        'nomineeMobile',
      ]),
      nomineeRelationship: getValue(
        'Nominee Relationship',
        defaultModel.nomineeRelationship,
        ['nomineeRelationship'],
      ),
      nomineeDob: getValue('Nominee DOB', defaultModel.nomineeDob, [
        'nomineeDob',
      ]),
      nomineeAddress: getValue('Nominee Address', defaultModel.nomineeAddress, [
        'nomineeAddress',
      ]),
      nomineeGuardianName: getValue(
        'Nominee Guardian Name',
        defaultModel.nomineeGuardianName,
        ['nomineeGuardianName'],
      ),
      witness1Name: getValue('Witness 1 Name', defaultModel.witness1Name, [
        'witness1Name',
      ]),
      witness1Address: getValue(
        'Witness 1 Address',
        defaultModel.witness1Address,
        ['witness1Address'],
      ),
      witness2Name: getValue('Witness 2 Name', defaultModel.witness2Name, [
        'witness2Name',
      ]),
      witness2Address: getValue(
        'Witness 2 Address',
        defaultModel.witness2Address,
        ['witness2Address'],
      ),

      form60Surname: getValue('Form60 Surname', defaultModel.form60Surname, [
        'form60Surname',
      ]),
      form60FatherName: getValue(
        'Form60 Father Name',
        defaultModel.form60FatherName,
        ['form60FatherName'],
      ),
      form60VerifiedDay: getValue(
        'Form60 Verified Day',
        defaultModel.form60VerifiedDay,
        ['form60VerifiedDay'],
      ),
      form60VerifiedMonth: getValue(
        'Form60 Verified Month',
        defaultModel.form60VerifiedMonth,
        ['form60VerifiedMonth'],
      ),
      form60VerifiedYear: getValue(
        'Form60 Verified Year',
        defaultModel.form60VerifiedYear,
        ['form60VerifiedYear'],
      ),
      form60VerificationPlace: getValue(
        'Form60 Verification Place',
        defaultModel.form60VerificationPlace,
        ['form60VerificationPlace'],
      ),
      form60FlatNo: getValue('Form60 Flat No', defaultModel.form60FlatNo, [
        'form60FlatNo',
      ]),
      form60PremisesName: getValue(
        'Form60 Premises Name',
        defaultModel.form60PremisesName,
        ['form60PremisesName'],
      ),
      form60Road: getValue('Form60 Road', defaultModel.form60Road, [
        'form60Road',
      ]),
      form60AreaLocality: getValue(
        'Form60 Area Locality',
        defaultModel.form60AreaLocality,
        ['form60AreaLocality'],
      ),
      form60TownDistrictState: getValue(
        'Form60 Town District State',
        defaultModel.form60TownDistrictState,
        ['form60TownDistrictState'],
      ),
      form60StdCode: getValue('Form60 STD Code', defaultModel.form60StdCode, [
        'form60StdCode',
      ]),
      form60TelephoneNo: getValue(
        'Form60 Telephone No',
        defaultModel.form60TelephoneNo,
        ['form60TelephoneNo'],
      ),
      form60TransactionAmount: getValue(
        'Form60 Transaction Amount',
        defaultModel.form60TransactionAmount,
        ['form60TransactionAmount'],
      ),
      form60TransactionDate: getValue(
        'Form60 Transaction Date',
        defaultModel.form60TransactionDate,
        ['form60TransactionDate'],
      ),
      form60NoOfPersons: getValue(
        'Form60 No Of Persons',
        defaultModel.form60NoOfPersons,
        ['form60NoOfPersons'],
      ),
      form60PanApplicationDate: getValue(
        'Form60 PAN Application Date',
        defaultModel.form60PanApplicationDate,
        ['form60PanApplicationDate'],
      ),
      form60PanAckNo: getValue(
        'Form60 PAN Ack No',
        defaultModel.form60PanAckNo,
        ['form60PanAckNo'],
      ),
      form60AgriculturalIncome: getValue(
        'Form60 Agricultural Income',
        defaultModel.form60AgriculturalIncome,
        ['form60AgriculturalIncome'],
      ),
      form60OtherIncome: getValue(
        'Form60 Other Income',
        defaultModel.form60OtherIncome,
        ['form60OtherIncome'],
      ),
      form60IdentityDocCode: getValue(
        'Form60 Identity Doc Code',
        defaultModel.form60IdentityDocCode,
        ['form60IdentityDocCode'],
      ),
      form60IdentityDocNo: getValue(
        'Form60 Identity Doc No',
        defaultModel.form60IdentityDocNo,
        ['form60IdentityDocNo'],
      ),
      form60IdentityIssuingAuthority: getValue(
        'Form60 Identity Issuing Authority',
        defaultModel.form60IdentityIssuingAuthority,
        ['form60IdentityIssuingAuthority'],
      ),
      form60AddressDocCode: getValue(
        'Form60 Address Doc Code',
        defaultModel.form60AddressDocCode,
        ['form60AddressDocCode'],
      ),
      form60AddressDocNo: getValue(
        'Form60 Address Doc No',
        defaultModel.form60AddressDocNo,
        ['form60AddressDocNo'],
      ),
      form60AddressIssuingAuthority: getValue(
        'Form60 Address Issuing Authority',
        defaultModel.form60AddressIssuingAuthority,
        ['form60AddressIssuingAuthority'],
      ),

      relatedPersonFirstName: getValue(
        'Related Person First Name',
        defaultModel.relatedPersonFirstName,
        ['relatedPersonFirstName'],
      ),
      relatedPersonPrefix: getValue(
        'Related Person Prefix',
        defaultModel.relatedPersonPrefix,
        ['relatedPersonPrefix'],
      ),
      relatedPersonDocNo: getValue(
        'Related Person Doc No',
        defaultModel.relatedPersonDocNo,
        ['relatedPersonDocNo'],
      ),

      signature1Text: getValue(
        'Signature 1 Text',
        defaultModel.signature1Text,
        ['signature1Text'],
      ),
      signature2Text: getValue(
        'Signature 2 Text',
        defaultModel.signature2Text,
        ['signature2Text'],
      ),
      signature1ImagePath: getValue(
        'Signature 1 Image Path',
        defaultModel.signature1ImagePath,
        ['signature1ImagePath'],
      ),
      signature2ImagePath: getValue(
        'Signature 2 Image Path',
        defaultModel.signature2ImagePath,
        ['signature2ImagePath'],
      ),
      signature3ImagePath: getValue(
        'Signature 3 Image Path',
        defaultModel.signature3ImagePath,
        ['signature3ImagePath'],
      ),
    );
  }
}
