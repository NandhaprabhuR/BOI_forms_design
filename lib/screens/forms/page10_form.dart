// lib/screens/forms/page10_form.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/form_data_model.dart';

class Page10Form extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page10Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page10Form> createState() => _Page10FormState();
}

class _Page10FormState extends State<Page10Form> {
  // Signature paths for 3 applicants
  String? _signature1Path;
  String? _signature2Path;
  String? _signature3Path;

  void _notifyChange() {
    widget.onDataChanged(FormDataModel(
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
      relatedPersonPrefix: widget.initialData.relatedPersonPrefix,
      relatedPersonFirstName: widget.initialData.relatedPersonFirstName,
      relatedPersonDocNo: widget.initialData.relatedPersonDocNo,
      signature1Text: _signature1Path ?? '',
      signature2Text: _signature2Path ?? '',
    ));
  }

  Future<void> _pickSignature(int applicantNumber) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        switch (applicantNumber) {
          case 1:
            _signature1Path = image.path;
            break;
          case 2:
            _signature2Path = image.path;
            break;
          case 3:
            _signature3Path = image.path;
            break;
        }
        _notifyChange();
      });
    }
  }

  void _clearSignature(int applicantNumber) {
    setState(() {
      switch (applicantNumber) {
        case 1:
          _signature1Path = null;
          break;
        case 2:
          _signature2Path = null;
          break;
        case 3:
          _signature3Path = null;
          break;
      }
      _notifyChange();
    });
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
              '(Annexure III)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'DECLARATION FROM NRI CUSTOMERS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          // Declaration Text
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'I/We hereby declare that I am/we are non-resident(s) of Indian origin. I/we understand that the account(s) are being opened on the basis of the statements declarations made by me /us and I/we also agree that if any statements / declarations made herein is found to be not correct in material particulars, you are not bound to pay any interest on deposit made by me/us. I/we agree that no claim will be made by me/us for any interest on deposit/s for any period after the date/s maturity of the deposit/s. I/we agree to abide by the provisions of the foreign currency (Non-Resident Account / Non-Resident (external) Account/ Non Resident (Ordinary) account and Resident Foreign Currency account schemes. I/we hereby undertake to intimate you about my/our return to India for permanent residence immediately on arrival. I/we further understand that on my/our return to India my/our intimating you the same, My/our FCNR deposit will be converted into Rupee and thereafter account will be designated as Resident Account and If the deposit is kept for further term, interest will be payable on the Rupee deposit at the rate originally fixed. I/we agree that the premature withdrawal is permitted at my/our request, the payment of the interest on the deposit may be allowed in accordance with the prevailing stipulations laid down by Reserve Bank of India, Bank of India in this regards. I/we further understand that the interest payable on renewals will be at the applicable ruling rates on the date of maturity, and that the deposit receipt will be renewed on my /our presenting the matured receipt on the maturity date. You may at your own option but at my/our risk and responsibility in all respect, appoint an agent, who shall be my /our agent to collect and transmission of any cheque, bills, hundies or other instruments or share certificates or other documents or goods or the instruments received in exchange or payments thereof, and the advices and correspondence relating thereto, whether by post or otherwise and whether by land, sea or air or by telegram or cables shall be entirely at my/our risk and responsibility and any loss, damage or delay however occasioned shall be on my/our account and be wholly borne by me/us.',
              style: TextStyle(fontSize: 11, height: 1.6),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 20),

          // Second paragraph
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'I/we undertake that I/we shall not make available to any person resident in India foreign currency against reimbursement in rupees or any other manner in India. I/we further undertake that in case of debits to the accounts for the purpose of investing in India and credits representing sale proceeds of investments. I/we shall ensure that such investments/ disinvestments would be covered by either general or special permission of Reserve Bank.',
              style: TextStyle(fontSize: 11, height: 1.6),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 30),

          // Signature Section
          const Text(
            'Signatures of Applicants',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildSignatureBox('Signature of Applicant 1', 1, _signature1Path)),
              const SizedBox(width: 8),
              Expanded(child: _buildSignatureBox('Signature of Applicant 2', 2, _signature2Path)),
              const SizedBox(width: 8),
              Expanded(child: _buildSignatureBox('Signature of Applicant 3', 3, _signature3Path)),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSignatureBox(String label, int applicantNumber, String? signaturePath) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _pickSignature(applicantNumber),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4),
            ),
            child: signaturePath != null
                ? Stack(
                    children: [
                      Center(
                        child: Image.file(
                          File(signaturePath),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () => _clearSignature(applicantNumber),
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
                      Icon(Icons.draw, size: 28, color: Colors.grey.shade400),
                      const SizedBox(height: 4),
                      Text(
                        'Tap to add',
                        style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
