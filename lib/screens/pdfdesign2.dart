// lib/screens/pdfdesign2.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart';
import 'pdf_helpers.dart';

// Main builder for the second page
pw.Widget buildSecondPage(
  FormDataModel data,
  pw.MemoryImage? signature1Image,
  pw.MemoryImage? signature2Image,
  pw.MemoryImage? applicantPhoto,
  pw.MemoryImage? applicantSignature,
  pw.MemoryImage? officialSignature,
) {
  // Address data map for the helper
  final addressData = {
    'address': data.correspondenceAddress, // Use correspondence address for this section (Section 5)
    'city': data.correspondenceCity,
    'district': data.correspondenceDistrict,
    'state': data.correspondenceState,
    'pin': data.correspondencePin,
  };

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // Section 5: Address Details (Correspondence/Local)
      _buildAddressSection(
        title: '5. Address details',
        tabs: ['Correspondence', 'Local', 'Same as Current/Permanent Address'],
        model: data,
        dataMap: addressData, // Pass the map for text fields
      ),
      pw.SizedBox(height: 4),
      
      _buildProofOfAddressDeclaration(),
      pw.SizedBox(height: 4),
      
      _buildAlternateAddressProof(data),
      pw.SizedBox(height: 4),
      
      _buildFinalDeclaration(
        data,
        applicantPhoto,
        applicantSignature,
      ),
      pw.SizedBox(height: 4),
      
      _buildOfficeUseSection(data, officialSignature),
    ],
  );
}

// Reusable widget for an address block 
// MODIFIED to accept FormDataModel for checkboxes
pw.Widget _buildAddressSection({
  required String title,
  required List<String> tabs,
  required FormDataModel model, 
  required Map<String, String> dataMap,
}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        decoration: const pw.BoxDecoration(
          color: PdfColors.grey200,
          border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey600)),
        ),
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: pw.Row(
          children: [
            pw.Text(
              title,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
            ),
            pw.SizedBox(width: 20),
            ...tabs.map(
              (tab) => pw.Container(
                margin: const pw.EdgeInsets.symmetric(horizontal: 8),
                padding: const pw.EdgeInsets.symmetric(horizontal: 6),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.grey600),
                  color: PdfColors.white,
                ),
                child: pw.Text(tab, style: const pw.TextStyle(fontSize: 7.5)),
              ),
            ),
          ],
        ),
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        children: [
          pw.Text('Address type*', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 10),
          // Use model checkboxes (reusing same fields as page 1 or separate if they exist? 
          // Re-checking model: 'addressTypeResidentialBusiness' etc are likely for Page 1. 
          // Page 2 usually repeats the same address type options. 
          // Assuming for now we reuse the same flags or if Page 2 has its own, they should be in model.
          // Looking at model, I see only one set of 'addressType...' fields. 
          // Usually correspondence address type matches current if "Same as" is checked, 
          // but if it's different, we might need separate fields. 
          // However, given the model provided, we will reuse the existing address type flags 
          // OR default to unchecked if strictly separate fields are missing/not populated.
          // Let's use the existing ones as a best effort fallback or if they are shared.
          labeledCheckbox('Residential/Business', checked: model.addressTypeResidentialBusiness),
          pw.SizedBox(width: 8),
          labeledCheckbox('Residential', checked: model.addressTypeResidential),
          pw.SizedBox(width: 8),
          labeledCheckbox('Business', checked: model.addressTypeBusiness),
          pw.SizedBox(width: 8),
          labeledCheckbox('Registered Office', checked: model.addressTypeRegisteredOffice),
          pw.SizedBox(width: 8),
          labeledCheckbox('Unspecified', checked: model.addressTypeUnspecified),
        ],
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        children: [
          pw.Text('Address*', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 10),
          pw.Expanded(child: charBoxes(dataMap['address']!, 35)),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Padding(
        padding: const pw.EdgeInsets.only(left: 60),
        child: charBoxes('', 35), // Line 2 could be added to map if needed
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: pw.Column(
              mainAxisSize: pw.MainAxisSize.min,
              children: [
                pw.Row(
                  children: [
                    pw.SizedBox(
                      width: 50,
                      child: pw.Text(
                        'City/Village*',
                        style: const pw.TextStyle(fontSize: 8),
                      ),
                    ),
                    charBoxes(dataMap['city']!, 15),
                  ],
                ),
                pw.SizedBox(height: 2),
                pw.Row(
                  children: [
                    pw.SizedBox(
                      width: 50,
                      child: pw.Text(
                        'State*',
                        style: const pw.TextStyle(fontSize: 8),
                      ),
                    ),
                    charBoxes(dataMap['state']!, 15),
                  ],
                ),
              ],
            ),
          ),
          pw.SizedBox(width: 20),
          pw.Expanded(
            child: pw.Column(
              mainAxisSize: pw.MainAxisSize.min,
              children: [
                pw.Row(
                  children: [
                    pw.SizedBox(
                      width: 40,
                      child: pw.Text(
                        'District*',
                        style: const pw.TextStyle(fontSize: 8),
                      ),
                    ),
                    charBoxes(dataMap['district']!, 15),
                  ],
                ),
                pw.SizedBox(height: 2),
                pw.Row(
                  children: [
                    pw.SizedBox(
                      width: 40,
                      child: pw.Text(
                        'Pin*',
                        style: const pw.TextStyle(fontSize: 8),
                      ),
                    ),
                    charBoxes(dataMap['pin']!, 6),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

// Section 6 - Unchanged Content
pw.Widget _buildProofOfAddressDeclaration() {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.all(2),
        child: pw.Text(
          '6. If the Proof of Address as per Aadhar (OVD) provided does not contain current address',
          style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
        ),
      ),
      pw.Container(
        width: double.infinity,
        padding: const pw.EdgeInsets.fromLTRB(8, 3, 8, 3), 
        child: pw.Text(
          'If the Proof of Address as per Aadhar provided does not contain current address, a SELF DECLARATION of current address is required as a proof of current address.',
          style: const pw.TextStyle(fontSize: 8),
        ),
      ),
    ],
  );
}

// Section 7 - Alternate Proof
pw.Widget _buildAlternateAddressProof(FormDataModel data) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.all(2),
        child: pw.Text(
          '7. If the Proof of Address(OVD) provided does not contain current address-please provide any of the documents below.',
          style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
        ),
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        children: [
          labeledCheckbox('Utility Bill', checked: data.altProofUtilityBill),
          pw.SizedBox(width: 15),
          labeledCheckbox('PPO/FPPO', checked: data.altProofPPOFPPO),
          pw.SizedBox(width: 15),
          labeledCheckbox('Property or Municipal tax receipt', checked: data.altProofPropertyTaxReceipt),
        ],
      ),
      pw.SizedBox(height: 2), 
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          labeledCheckbox('', checked: data.altProofLetterOfAllotment),
          pw.SizedBox(width: 2),
          pw.Expanded(
            child: pw.Text(
              'Letter of allotment of accomodation issued by employer/ issued by State or Central Government departments, statutory or regulatory bodies, Public sector undertaking, scheduled commercial banks, financial institutions and listed companies. Similarly, leave and license agreements with such employers allotting official accomodation',
              style: const pw.TextStyle(fontSize: 7.5),
            ),
          ),
        ],
      ),
      pw.SizedBox(height: 2), 
      pw.Row(
        children: [
          pw.Text('Document No', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          charBoxes(data.altProofDocumentNo, 15),
          pw.Spacer(),
          pw.Text('Date:', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          charBoxes(data.altProofDate, 10),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Container(
        width: double.infinity,
        padding: const pw.EdgeInsets.fromLTRB(8, 3, 8, 3),
        child: pw.Text(
          'I hereby undertake that OVD with current address will be submitted within a period of three months from the date of opening of account failing which bank may stop / restrict operations in the account',
          style: const pw.TextStyle(fontSize: 8),
        ),
      ),
    ],
  );
}

// Final Declaration Section
pw.Widget _buildFinalDeclaration(
  FormDataModel data,
  pw.MemoryImage? applicantPhoto,
  pw.MemoryImage? applicantSignature,
) {
  // Pad date
  final date = data.declarationDate.padRight(8, ' ');
  
  String safeChar(String s, int i) => s.length > i ? s[i] : '';

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        color: PdfColors.grey200,
        padding: const pw.EdgeInsets.all(2),
        child: pw.Text(
          '8. DECLARATION CUM UNDERTAKING CUM SELF-CERTIFICATION',
          style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
        ),
      ),
      pw.SizedBox(height: 2),
      pw.Text(
        'I have read the copy of Terms and Conditions of the Account Opening given to me. The Terms and Conditions have been explained to me/us and having understood, I accept the same.',
        style: const pw.TextStyle(fontSize: 8),
      ),
      pw.SizedBox(height: 1),
      pw.Text(
        '1. I hereby declare that I have submitted the Aadhaar Card issued by UIDAI voluntarily for identification and /or address proof towards the compliance of KYC norms under the PMLA, 2002',
        style: const pw.TextStyle(fontSize: 8),
      ),
      pw.SizedBox(height: 1),
      pw.Text(
        '2. I hereby consent that the Bank may verify the same with the UIDAI and authorise the UIDAI expressly to release the identity and address through biometric authentication to the Bank',
        style: const pw.TextStyle(fontSize: 8),
      ),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          labeledCheckbox('YES', checked: data.biometricConsentYes),
          pw.SizedBox(width: 20),
          labeledCheckbox('NO', checked: data.biometricConsentNo),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Container(
            width: 90,
            height: 100,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.grey),
            ),
            child: applicantPhoto != null
                ? pw.Image(applicantPhoto, fit: pw.BoxFit.cover)
                : pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text('PHOTO*', style: const pw.TextStyle(fontSize: 8)),
                      pw.SizedBox(height: 8),
                      pw.Text(
                        'Please Paste\nRecent passport Size',
                        style: const pw.TextStyle(fontSize: 7),
                        textAlign: pw.TextAlign.center,
                      ),
                      pw.SizedBox(height: 8),
                      pw.Text(
                        '(Do not Staple)',
                        style: const pw.TextStyle(fontSize: 7),
                      ),
                    ],
                  ),
          ),
          pw.SizedBox(width: 10),
          pw.Expanded(
            child: pw.Container(
              height: 100, 
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.black),
              ),
              child: applicantSignature != null
                  ? pw.Image(applicantSignature, fit: pw.BoxFit.contain)
                  : pw.Center(
                      child: pw.Text(
                        'Signature/Thumb impression of the Applicant\n\nPlease sign in black ink only',
                        style: const pw.TextStyle(fontSize: 7),
                        textAlign: pw.TextAlign.center,
                      ),
                    ),
            ),
          ),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        children: [
          pw.Text('Place:', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          charBoxes(data.declarationPlace, 20),
          pw.Spacer(),
          pw.Text('Date:', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          pw.Row(
            children: [
              charBoxWithLabel(safeChar(date, 0), 'D'),
              charBoxWithLabel(safeChar(date, 1), 'D'),
              pw.SizedBox(width: 3),
              charBoxWithLabel(safeChar(date, 2), 'M'),
              charBoxWithLabel(safeChar(date, 3), 'M'),
              pw.SizedBox(width: 3),
              charBoxWithLabel(safeChar(date, 4), 'Y'),
              charBoxWithLabel(safeChar(date, 5), 'Y'),
              charBoxWithLabel(safeChar(date, 6), 'Y'),
              charBoxWithLabel(safeChar(date, 7), 'Y'),
            ],
          ),
        ],
      ),
    ],
  );
}

// Section 9 - Office Use/Attestation
pw.Widget _buildOfficeUseSection(
  FormDataModel data,
  pw.MemoryImage? officialSignature,
) {
  final date = data.officeUseDate.padRight(8, ' ');
  String safeChar(String s, int i) => s.length > i ? s[i] : '';

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        decoration: const pw.BoxDecoration(
          color: PdfColors.grey200,
          border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey600)),
        ),
        padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              '9. FOR OFFICE USE/ATTESTATION',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
            ),
            ...[
              'Documents received',
              'Self certified',
              'True copies',
              'Notary',
            ].map(
              (text) => pw.Container(
                padding: const pw.EdgeInsets.symmetric(horizontal: 4),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.grey600),
                  color: PdfColors.white,
                ),
                child: pw.Text(text, style: const pw.TextStyle(fontSize: 7.5)),
              ),
            ),
          ],
        ),
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        children: [
          pw.Expanded(
            child: pw.Text(
              'Whether self-certification & documents received as part of account opening process have been verified and found correct YES/NO\n(Branch to proceed with opening only when certification is (YES))',
              style: const pw.TextStyle(fontSize: 7.5),
            ),
          ),
          pw.SizedBox(width: 10),
          labeledCheckbox('YES', checked: data.officeVerificationYes),
          pw.SizedBox(width: 8),
          labeledCheckbox('NO', checked: data.officeVerificationNo),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Text(
        'Certified that the implications and conditions for the operation of the account have been explained to the depositor (only in case of illiterate applicant)',
        style: const pw.TextStyle(fontSize: 7.5),
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        children: [
          pw.Text('Depositor is', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 8),
          labeledCheckbox('Illiterate', checked: data.depositorIlliterate),
          pw.SizedBox(width: 8),
          labeledCheckbox('Blind', checked: data.depositorBlind),
          pw.SizedBox(width: 8),
          pw.Text('Staff', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 4),
          charBoxes(data.depositorStaff, 10),
          pw.Spacer(),
          pw.Text('Risk Category:*', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 8),
          labeledCheckbox('High', checked: data.riskCategoryHigh),
          pw.SizedBox(width: 8),
          labeledCheckbox('Medium', checked: data.riskCategoryMedium),
          pw.SizedBox(width: 8),
          labeledCheckbox('Low', checked: data.riskCategoryLow),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Row(
        children: [
          pw.Text(
            'Details of one or two identification marks, if any, such as a mole or scar (mandatory for illiterate applicant)',
            style: const pw.TextStyle(fontSize: 7.5),
          ),
          pw.SizedBox(width: 5),
          pw.Expanded(
            child: pw.Container(
              height: 12,
              decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
              padding: const pw.EdgeInsets.all(2),
              child: pw.Text(
                data.officeIdentificationMarks,
                style: const pw.TextStyle(fontSize: 7),
              ),
            ),
          ),
        ],
      ),
      pw.SizedBox(height: 2),
      pw.Text(
        'In person verification carried out and Signature/LTI of the applicant verified by:',
        style: const pw.TextStyle(fontSize: 7.5),
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Text('Official Name:', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          pw.Expanded(
            flex: 2,
            child: pw.Container(
              height: 12,
              decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
              padding: const pw.EdgeInsets.all(2),
              child: pw.Text(
                data.officialName,
                style: const pw.TextStyle(fontSize: 7),
              ),
            ),
          ),
          pw.SizedBox(width: 10),
          pw.Text('PF No.', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          charBoxes(data.pfNo, 10),
          pw.SizedBox(width: 10),
          pw.Text('Designation', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          pw.Expanded(
            flex: 1,
            child: pw.Container(
              height: 12,
              decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
              padding: const pw.EdgeInsets.all(2),
              child: pw.Text(
                data.designation,
                style: const pw.TextStyle(fontSize: 7),
              ),
            ),
          ),
        ],
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Text('Date:', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          charBoxWithLabel(safeChar(date, 0), 'd'),
          charBoxWithLabel(safeChar(date, 1), 'd'),
          pw.SizedBox(width: 2),
          charBoxWithLabel(safeChar(date, 2), 'm'),
          charBoxWithLabel(safeChar(date, 3), 'm'),
          pw.SizedBox(width: 2),
          charBoxWithLabel(safeChar(date, 4), 'y'),
          charBoxWithLabel(safeChar(date, 5), 'y'),
          charBoxWithLabel(safeChar(date, 6), 'y'),
          charBoxWithLabel(safeChar(date, 7), 'y'),
          pw.SizedBox(width: 10),
          pw.Text('PF No', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          charBoxes(data.pfNo, 10),
          pw.SizedBox(width: 10),
          pw.Text('Signature', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          pw.Expanded(
            child: pw.Container(
              height: 40,
              decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
              padding: const pw.EdgeInsets.all(2),
              child: officialSignature != null
                  ? pw.Image(officialSignature, fit: pw.BoxFit.contain)
                  : pw.Center(
                      child: pw.Text(
                        'Signature',
                        style: const pw.TextStyle(
                          fontSize: 7,
                          color: PdfColors.grey,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    ],
  );
}
