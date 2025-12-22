// lib/screens/forms/page8_form.dart

import 'package:flutter/material.dart';
import '../model/form_data_model.dart';

class Page8Form extends StatelessWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page8Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              border: Border.all(color: Colors.orange.shade700, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Column(
              children: [
                Text(
                  'FORM NO.60 - Instructions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Note 2
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border.all(color: Colors.blue.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              '2. The person accepting the declaration shall not accept the declaration where the amount of income of the nature referred to in item 22b exceeds the maximum amount which is not chargeable to tax, unless PAN is applied for and column 21 is duly filled.',
              style: TextStyle(fontSize: 12, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 20),

          // Instruction header
          const Text(
            'Instruction:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '(1) Documents which can be produced in support of identity and address (not required if applied for PAN and item 20 is filled): -',
            style: TextStyle(fontSize: 12, height: 1.4),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Document Table
          _buildDocumentTable(),
          const SizedBox(height: 24),

          // Additional Notes
          _buildAdditionalNotes(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildDocumentTable() {
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
                _buildHeaderCell('Sl.', flex: 1),
                _buildHeaderCell('Nature of Documents', flex: 5),
                _buildHeaderCell('Document\nCode', flex: 2),
                _buildHeaderCell('Proof of\nIdentity', flex: 2),
                _buildHeaderCell('Proof of\nAddress', flex: 2),
              ],
            ),
          ),
          // Section A header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border(
                top: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            child: const Text(
              'A. For Individuals and HUF',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          // Data rows
          _buildDocumentRow('1', 'AADHAR card', '01', true, true),
          _buildDocumentRow('2', 'Bank/Post office passbook bearing photograph of the person', '02', true, true),
          _buildDocumentRow('3', 'Elector\'s photo identity card', '03', true, true),
          _buildDocumentRow('4', 'Ration/Public Distribution System card bearing photograph of the person', '04', true, true),
          _buildDocumentRow('5', 'Driving License', '05', true, true),
          _buildDocumentRow('6', 'Passport', '06', true, true),
          _buildDocumentRow('7', 'Pensioner Photo card', '07', true, true),
          _buildDocumentRow('8', 'National Rural Employment Guarantee Scheme (NREGS) Job Card', '08', true, true),
          _buildDocumentRow('9', 'Caste or Domicile certificate bearing photo of the person', '09', true, true),
          _buildDocumentRow('10', 'Certificate of identity/address signed by a Member of Parliament or Member of Legislative Assembly or Municipal Councillor or a Gazetted Officer as per annexure A prescribed in Form 49A', '10', true, true),
          _buildDocumentRow('11', 'Certificate from employer as per annexure B prescribed in Form 49A', '11', true, true),
          _buildDocumentRow('12', 'Kisan passbook bearing photo', '12', true, false),
          _buildDocumentRow('13', 'Arm\'s license', '13', true, false),
          _buildDocumentRow('14', 'Central Government Health Scheme/ Ex-Service men contributory Health Scheme', '14', true, false),
          _buildDocumentRow('15', 'Photo identity card issued by the government/Public Sector Undertaking', '15', true, false),
          _buildDocumentRow('16', 'Electricity bill (Not more than 3 months old)', '16', false, true),
          _buildDocumentRow('17', 'Landline Telephone bill (Not more than 3 months old)', '17', false, true),
          _buildDocumentRow('18', 'Water bill (Not more than 3 months old)', '18', false, true),
          _buildDocumentRow('19', 'Consumer gas card/book or piped gas bill (Not more than 3 months old)', '19', false, true),
          _buildDocumentRow('20', 'Bank Account Statement (Not more than 3 months old)', '20', false, true),
          _buildDocumentRow('21', 'Credit Card statement (Not more than 3 months old)', '21', false, true),
          _buildDocumentRow('22', 'Depository Account Statement (Not more than 3 months old)', '22', false, true),
          _buildDocumentRow('23', 'Property registration document', '23', false, true),
          _buildDocumentRow('24', 'Allotment letter of accommodation from Government', '24', false, true),
          _buildDocumentRow('25', 'Passport of spouse bearing name of the person', '25', false, true),
          _buildDocumentRow('26', 'Property tax payment receipt (Not more than one year old)', '26', false, true),
          // Section B header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              border: Border(
                top: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            child: const Text(
              'B. For Association of persons (Trusts)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          _buildDocumentRow('', 'Copy of trust deed or copy of certificate of registration issued by Charity Commissioner', '27', true, true),
          // Section C header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              border: Border(
                top: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            child: const Text(
              'C. For Association of persons (other than Trusts) or Body of Individuals or Local authority or Artificial Juridical Person)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
          ),
          _buildDocumentRow('', 'Copy of Agreement or copy of certificate of registration issued by Charity commissioner or Registrar of Cooperative society or any other competent authority or any other document originating from any Central or State Government Department establishing identity and address of such person.', '28', true, true, isLast: true),
        ],
      ),
    );
  }

  Widget _buildAdditionalNotes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildNoteItem('(2)', 'In case of a transaction in the name of a Minor, any of the above-mentioned documents as proof of Identity and Address of any of parents/guardians of such minor shall be deemed to be the proof of identity and address for the minor declarant, and the declaration should be signed by the parent/guardian.'),
        const SizedBox(height: 12),
        _buildNoteItem('(3)', 'For HUF any document in the name of Karta of HUF is required.'),
        const SizedBox(height: 12),
        _buildNoteItem('(4)', 'In case the transaction is in the name of more than one person the total number of persons should be mentioned in Sl. No. 18 and the total amount of transaction is to be filled in Sl. No. 16.'),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            border: Border.all(color: Colors.orange.shade300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'In case the estimated total income in column 22b exceeds the maximum amount not chargeable to tax the person should apply for PAN, fill out item 21 and furnish proof of submission of application.',
            style: TextStyle(fontSize: 12, height: 1.5, fontWeight: FontWeight.w500),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  Widget _buildNoteItem(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, height: 1.4),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildDocumentRow(String slNo, String document, String code, bool identity, bool address, {bool isLast = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade400),
          bottom: isLast ? BorderSide.none : BorderSide.none,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDataCell(slNo, flex: 1, isCenter: true),
          _buildDataCell(document, flex: 5),
          _buildDataCell(code, flex: 2, isCenter: true),
          _buildDataCell(identity ? 'Yes' : 'No', flex: 2, isCenter: true, isGreen: identity),
          _buildDataCell(address ? 'Yes' : 'No', flex: 2, isCenter: true, isGreen: address),
        ],
      ),
    );
  }

  Widget _buildDataCell(String text, {int flex = 1, bool isCenter = false, bool isGreen = false}) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11,
            color: isGreen ? Colors.green.shade700 : Colors.black,
            fontWeight: isGreen ? FontWeight.w500 : FontWeight.normal,
          ),
          textAlign: isCenter ? TextAlign.center : TextAlign.left,
        ),
      ),
    );
  }
}
