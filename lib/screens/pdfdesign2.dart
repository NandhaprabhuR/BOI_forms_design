// lib/screens/pdfdesign2.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart';
import 'pdf_helpers.dart';

// Main builder for the second page
pw.Widget buildSecondPage(FormDataModel data) { // <--- MODIFIED
  final addressData = {
    'address': data.currentAddress, // <--- FROM MODEL
    'city': data.currentCity,       // <--- FROM MODEL
    'district': data.currentDistrict, // <--- FROM MODEL
    'state': data.currentState,     // <--- FROM MODEL
    'pin': data.currentPin,         // <--- FROM MODEL
  };

  // No outer border here, it flows from page 1
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // Section 4 is now in pdfdesign1.dart

      // Start with Section 5
      _buildAddressSection(
        title: '5. Address details',
        tabs: ['Correspondence', 'Local', 'Same as Current/Permanent Address'],
        data: addressData,
      ),
      pw.SizedBox(height: 4), // Reduced from 6
      _buildProofOfAddressDeclaration(),
      pw.SizedBox(height: 4), // Reduced from 6
      _buildAlternateAddressProof(),
      pw.SizedBox(height: 4), // Reduced from 6
      _buildFinalDeclaration(data), // <--- MODIFIED
      pw.SizedBox(height: 4), // Reduced from 6
      _buildOfficeUseSection(),
      // No page number needed here, handled by MultiPage footer
    ],
  );
}

// Reusable widget for an address block (Unchanged, uses the 'data' map)
pw.Widget _buildAddressSection({
  required String title,
  required List<String> tabs,
  required Map<String, String> data,
}) {
  // This function remains unchanged, as it correctly uses the 'data' map passed in buildSecondPage(data)
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
            pw.Text(title,
                style:
                pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8)),
            pw.SizedBox(width: 20),
            ...tabs.map((tab) => pw.Container(
              margin: const pw.EdgeInsets.symmetric(horizontal: 8),
              padding: const pw.EdgeInsets.symmetric(horizontal: 6),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey600),
                color: PdfColors.white,
              ),
              child: pw.Text(tab, style: const pw.TextStyle(fontSize: 7.5)),
            )),
          ],
        ),
      ),
      pw.SizedBox(height: 3),
      pw.Row(children: [
        pw.Text('Address type*', style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(width: 10),
        labeledCheckbox('Residential/Business', checked: true),
        pw.SizedBox(width: 8),
        labeledCheckbox('Residential'),
        pw.SizedBox(width: 8),
        labeledCheckbox('Business'),
        pw.SizedBox(width: 8),
        labeledCheckbox('Registered Office'),
        pw.SizedBox(width: 8),
        labeledCheckbox('Unspecified'),
      ]),
      pw.SizedBox(height: 3),
      pw.Row(children: [
        pw.Text('Address*', style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(width: 10),
        pw.Expanded(child: charBoxes(data['address']!, 35)),
      ]),
      pw.SizedBox(height: 2),
      pw.Padding(
        padding: const pw.EdgeInsets.only(left: 60),
        child: charBoxes('', 35),
      ),
      pw.SizedBox(height: 3),
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
              pw.Row(children: [
                pw.SizedBox(
                    width: 50,
                    child: pw.Text('City/Village*',
                        style: const pw.TextStyle(fontSize: 8))),
                charBoxes(data['city']!, 15),
              ]),
              pw.SizedBox(height: 2),
              pw.Row(children: [
                pw.SizedBox(
                    width: 50,
                    child: pw.Text('State*',
                        style: const pw.TextStyle(fontSize: 8))),
                charBoxes(data['state']!, 15),
              ]),
            ]),
          ),
          pw.SizedBox(width: 20),
          pw.Expanded(
            child: pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
              pw.Row(children: [
                pw.SizedBox(
                    width: 40,
                    child: pw.Text('District*',
                        style: const pw.TextStyle(fontSize: 8))),
                charBoxes(data['district']!, 15),
              ]),
              pw.SizedBox(height: 2),
              pw.Row(children: [
                pw.SizedBox(
                    width: 40,
                    child: pw.Text('Pin*',
                        style: const pw.TextStyle(fontSize: 8))),
                charBoxes(data['pin']!, 6),
              ]),
            ]),
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
              style:
              pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
        ),
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.fromLTRB(8, 3, 8, 3), // Reduced padding
          child: pw.Text(
              'If the Proof of Address as per Aadhar provided does not contain current address, a SELF DECLARATION of current address is required as a proof of current address.',
              style: const pw.TextStyle(fontSize: 8)),
        )
      ]);
}

// Section 7 - Reduced internal spacing
pw.Widget _buildAlternateAddressProof() {
  return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: double.infinity,
          color: PdfColors.grey200,
          padding: const pw.EdgeInsets.all(2),
          child: pw.Text(
              '7. If the Proof of Address(OVD) provided does not contain current address-please provide any of the documents below.',
              style:
              pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
        ),
        pw.SizedBox(height: 2), // Reduced
        pw.Row(children: [
          labeledCheckbox('Utility Bill'),
          pw.SizedBox(width: 15),
          labeledCheckbox('PPO/FPPO'),
          pw.SizedBox(width: 15),
          labeledCheckbox('Property or Municipal tax receipt'),
        ]),
        pw.SizedBox(height: 2), // Reduced
        pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          checkBox(),
          pw.SizedBox(width: 2),
          pw.Expanded(
              child: pw.Text(
                  'Letter of allotment of accomodation issued by employer/ issued by State or Central Government departments, statutory or regulatory bodies, Public sector undertaking, scheduled commercial banks, financial institutions and listed companies. Similarly, leave and license agreements with such employers allotting official accomodation',
                  style: const pw.TextStyle(fontSize: 7.5))),
        ]),
        pw.SizedBox(height: 2), // Reduced
        pw.Row(children: [
          pw.Text('Document No', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          charBoxes('', 15),
          pw.Spacer(),
          pw.Text('Date:', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          charBoxes('', 8),
        ]),
        pw.SizedBox(height: 2), // Reduced
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.fromLTRB(8, 3, 8, 3), // Reduced padding
          child: pw.Text(
              'I hereby undertake that OVD with current address will be submitted within a period of three months from the date of opening of account failing which bank may stop / restrict operations in the account',
              style: const pw.TextStyle(fontSize: 8)),
        )
      ]);
}

// Final Declaration Section - MODIFIED to use data model
pw.Widget _buildFinalDeclaration(FormDataModel data) { // <--- MODIFIED
  // ===== FIX: Safely pad the date string to prevent substring errors =====
  final date = data.declarationDate.padRight(8, ' ');
  // =====================================================================

  // Get date components for display
  final d1 = date.substring(0, 1);
  final d2 = date.substring(1, 2);
  final m1 = date.substring(2, 3);
  final m2 = date.substring(3, 4);
  final y1 = date.substring(4, 5);
  final y2 = date.substring(5, 6);
  final y3 = date.substring(6, 7);
  final y4 = date.substring(7, 8);


  return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: double.infinity,
          color: PdfColors.grey200,
          padding: const pw.EdgeInsets.all(2),
          child: pw.Text('8. DECLARATION CUM UNDERTAKING CUM SELF-CERTIFICATION',
              style:
              pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
        ),
        pw.SizedBox(height: 2), // Reduced
        pw.Text(
            'I have read the copy of Terms and Conditions of the Account Opening given to me. The Terms and Conditions have been explained to me/us and having understood, I accept the same.',
            style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(height: 1), // Reduced
        pw.Text(
            '1. I hereby declare that I have submitted the Aadhaar Card issued by UIDAI voluntarily for identification and /or address proof towards the compliance of KYC norms under the PMLA, 2002',
            style: const pw.TextStyle(fontSize: 8)),
        pw.SizedBox(height: 1), // Reduced
        pw.Text(
            '2. I hereby consent that the Bank may verify the same with the UIDAI and authorise the UIDAI expressly to release the identity and address through biometric authentication to the Bank',
            style: const pw.TextStyle(fontSize: 8)),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
          labeledCheckbox('YES'),
          pw.SizedBox(width: 20),
          labeledCheckbox('NO'),
        ]),
        pw.SizedBox(height: 2), // Reduced
        pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
          pw.Container(
              width: 90,
              height: 100, // Keep photo height
              decoration:
              pw.BoxDecoration(border: pw.Border.all(color: PdfColors.grey)),
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text('PHOTO', style: const pw.TextStyle(fontSize: 8)),
                    pw.SizedBox(height: 8),
                    pw.Text('Please Paste\nRecent passport Size',
                        style: const pw.TextStyle(fontSize: 7),
                        textAlign: pw.TextAlign.center),
                    pw.SizedBox(height: 8),
                    pw.Text('(Do Not Staple)',
                        style: const pw.TextStyle(fontSize: 7)),
                  ])),
          pw.SizedBox(width: 10),
          pw.Expanded(
              child: pw.Container(
                  height: 60, // Keep signature height
                  decoration:
                  pw.BoxDecoration(border: pw.Border.all(color: PdfColors.black)),
                  child: pw.Center(
                      child: pw.Text(data.applicantSignatureName, // <--- FROM MODEL
                          style: const pw.TextStyle(fontSize: 20))))),
          pw.SizedBox(width: 10),
          pw.Container(
              width: 110,
              height: 60, // Keep signature box height
              decoration:
              pw.BoxDecoration(border: pw.Border.all(color: PdfColors.grey)),
              child: pw.Center(
                  child: pw.Text(
                      'Signature/Thumb impression of the Applicant\n\nPlease sign in black ink only',
                      style: const pw.TextStyle(fontSize: 6.5),
                      textAlign: pw.TextAlign.center))),
        ]),
        pw.SizedBox(height: 2), // Reduced
        pw.Row(children: [
          pw.Text('Place:', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          charBoxes(data.declarationPlace, 20), // <--- FROM MODEL
          pw.Spacer(),
          pw.Text('Date:', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          pw.Row(children: [
            charBoxWithLabel(d1, 'D'),
            charBoxWithLabel(d2, 'D'),
            pw.SizedBox(width: 3),
            charBoxWithLabel(m1, 'M'),
            charBoxWithLabel(m2, 'M'),
            pw.SizedBox(width: 3),
            charBoxWithLabel(y1, 'Y'),
            charBoxWithLabel(y2, 'Y'),
            charBoxWithLabel(y3, 'Y'),
            charBoxWithLabel(y4, 'Y'),
          ]),
        ])
      ]);
}

// Section 9 - Unchanged Content
pw.Widget _buildOfficeUseSection() {
  pw.Widget emptyBox(double width) => pw.Container(
      width: width,
      height: 12,
      decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)));

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
              pw.Text('9. FOR OFFICE USE/ATTESTATION',
                  style:
                  pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8)),
              ...['Documents received', 'Self certified', 'True copies', 'Notary']
                  .map((text) => pw.Container(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 4),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.grey600),
                    color: PdfColors.white,
                  ),
                  child:
                  pw.Text(text, style: const pw.TextStyle(fontSize: 7.5))))
            ],
          ),
        ),
        pw.SizedBox(height: 2), // Reduced
        pw.Text(
            'Whether self-certification & documents received as part of account opening process have been verified and found correct YES/NO',
            style: const pw.TextStyle(fontSize: 7.5)),
        pw.Text('(Branch to proceed with opening only when certification is (YES))',
            style: const pw.TextStyle(fontSize: 7.5)),
        pw.SizedBox(height: 2), // Reduced
        pw.Text(
            'Certified that the implications and conditions for the operation of the account have been explained to the depositor (only in case of illiterate applicant)',
            style: const pw.TextStyle(fontSize: 7.5)),
        pw.SizedBox(height: 2), // Reduced
        pw.Row(children: [
          pw.Text('Depositor is', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 8),
          labeledCheckbox('Illiterate'),
          pw.SizedBox(width: 8),
          labeledCheckbox('Blind'),
          pw.SizedBox(width: 8),
          labeledCheckbox('Staff'),
          charBoxes('', 8),
          pw.Spacer(),
          pw.Text('Risk Category:*', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 8),
          labeledCheckbox('High'),
          pw.SizedBox(width: 8),
          labeledCheckbox('Medium'),
          pw.SizedBox(width: 8),
          labeledCheckbox('Low'),
        ]),
        pw.SizedBox(height: 2), // Reduced
        pw.Text(
            'Details of one or two identification marks, if any, such as a mole or scar (mandatory for illiterate applicant)',
            style: const pw.TextStyle(fontSize: 7.5)),
        pw.SizedBox(height: 2), // Reduced
        pw.Text(
            'In person verification carried out and Signature/LTI of the applicant verified by:',
            style: const pw.TextStyle(fontSize: 7.5)),
        pw.SizedBox(height: 3), // Reduced
        pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
          pw.Text('Official Name:', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          pw.Expanded(flex: 2, child: emptyBox(0)),
          pw.SizedBox(width: 10),
          pw.Text('PF No.', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          charBoxes('', 8),
          pw.SizedBox(width: 10),
          pw.Text('Designation', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          pw.Expanded(flex: 1, child: emptyBox(0)),
        ]),
        pw.SizedBox(height: 3), // Reduced
        pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
          pw.Text('Date:', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          charBoxWithLabel('', 'd'),
          charBoxWithLabel('', 'd'),
          pw.SizedBox(width: 2),
          charBoxWithLabel('', 'm'),
          charBoxWithLabel('', 'm'),
          pw.SizedBox(width: 2),
          charBoxWithLabel('', 'y'),
          charBoxWithLabel('', 'y'),
          pw.SizedBox(width: 10),
          pw.Text('SS No', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          emptyBox(50),
          pw.SizedBox(width: 10),
          pw.Text('Signature', style: const pw.TextStyle(fontSize: 8)),
          pw.SizedBox(width: 5),
          pw.Expanded(child: emptyBox(0)),
        ]),
        // Removed final SizedBox and Page number
      ]);
}