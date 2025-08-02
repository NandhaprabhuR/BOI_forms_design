import 'package:flutter/material.dart';

class Page8Form extends StatefulWidget {
  const Page8Form({super.key});

  @override
  State<Page8Form> createState() => _Page8FormState();
}

class _Page8FormState extends State<Page8Form> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoText('2. The person accepting the declaration shall not accept the declaration where the amount of income of the nature referred to in item 22b exceeds the maximum amount which is not chargeable to tax, unless PAN is applied for and column 21 is duly filled.'),
          _buildSectionTitle('Instruction:'),
          _buildInfoText('(1) Documents which can be produced in support of identity and address (not required if applied for PAN and item 20 is filled): - (Following list is only for supporting document for Form 60)'),
          const SizedBox(height: 10),
          _buildDocumentTable(),
          const SizedBox(height: 20),
          _buildInfoText('(2) In case of a transaction in the name of a Minor, any of the above-mentioned documents as proof of Identity and Address of any of parents/guardians of such minor shall be deemed to be the proof of identity and address for the minor declarant, and the declaration should be signed by the parent/guardian.'),
          _buildInfoText('(3) For HUF any document in the name of Karta of HUF is required.'),
          _buildInfoText('(4) In case the transaction is in the name of more than one person the total number of persons should be mentioned in Sl. No. 18 and the total amount of transaction is to be filled in Sl. No. 16.'),
          _buildInfoText('In case the estimated total income in column 22b exceeds the maximum amount not chargeable to tax the person should apply for PAN, fill out item 21 and furnish proof of submission of application.'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDocumentTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: const {
        0: FlexColumnWidth(0.5), // Sl. No.
        1: FlexColumnWidth(3),  // Nature of Documents
        2: FlexColumnWidth(1),  // Document Code
        3: FlexColumnWidth(1),  // Proof of Identity
        4: FlexColumnWidth(1),  // Proof of Address
      },
      children: [
        _buildTableRow(
          ['Sl. No.', 'Nature of Documents', 'Document Code', 'Proof of Identity', 'Proof of Address'],
          isHeader: true,
        ),
        _buildTableRow(['A', 'For Individuals and HUF', '', '', ''], isCategory: true),
        _buildTableRow(['1', 'AADHAR card', '01', 'Yes', 'Yes']),
        _buildTableRow(['2', 'Bank/Post office passbook bearing photograph of the person', '02', 'Yes', 'Yes']),
        _buildTableRow(['3', 'Elector\'s photo identity card', '03', 'Yes', 'Yes']),
        _buildTableRow(['4', 'Ration/Public Distribution System card bearing photograph of the person', '04', 'Yes', 'Yes']),
        _buildTableRow(['5', 'Driving License', '05', 'Yes', 'Yes']),
        _buildTableRow(['6', 'Passport', '06', 'Yes', 'Yes']),
        _buildTableRow(['7', 'Pensioner Photo card', '07', 'Yes', 'Yes']),
        _buildTableRow(['8', 'National Rural Employment Guarantee Scheme (NREGS) Job Card', '08', 'Yes', 'Yes']),
        _buildTableRow(['9', 'Certificate of domicile certificate bearing photo of the person', '09', 'Yes', 'Yes']),
        _buildTableRow(['10', 'Certificate of identity/address signed by a Member of Parliament or Member of Legislative Assembly or Municipal Councillor or a Gazetted Officer as per annexure A prescribed in Form 49A', '10', 'Yes', 'Yes']),
        _buildTableRow(['11', 'Certificate from employer as per annexure B prescribed in Form 49A', '11', 'Yes', 'No']),
        _buildTableRow(['12', 'Kisan passbook bearing photo', '12', 'Yes', 'No']),
        _buildTableRow(['13', 'Arm\'s license', '13', 'Yes', 'No']),
        _buildTableRow(['14', 'Central Government Health Scheme/ Ex -Service men contributory Health Scheme', '14', 'Yes', 'No']),
        _buildTableRow(['15', 'Photo identity card issued by the government/Public Sector Undertaking', '15', 'Yes', 'No']),
        _buildTableRow(['16', 'Electricity bill (Not more than 3 months old)', '16', 'No', 'Yes']),
        _buildTableRow(['17', 'Landline Telephone bill (Not more than 3 months old)', '17', 'No', 'Yes']),
        _buildTableRow(['18', 'Water bill (Not more than 3 months old)', '18', 'No', 'Yes']),
        _buildTableRow(['19', 'Consumer gas card/book or piped gas bill (Not more than months old)', '19', 'No', 'Yes']),
        _buildTableRow(['20', 'Bank Account Statement (Not more than 3 months old)', '20', 'No', 'Yes']),
        _buildTableRow(['21', 'Credit Card statement (Not more than 3 months old)', '21', 'No', 'Yes']),
        _buildTableRow(['22', 'Depository Account Statement (Not more than 3 months old)', '22', 'No', 'Yes']),
        _buildTableRow(['23', 'Property registration document', '23', 'No', 'Yes']),
        _buildTableRow(['24', 'Allotment letter of accommodation from Government', '24', 'No', 'Yes']),
        _buildTableRow(['25', 'Passport of spouse bearing name of the person', '25', 'No', 'Yes']),
        _buildTableRow(['26', 'Property tax payment receipt (Not more than one year old)', '26', 'No', 'Yes']),
        _buildTableRow(['B', 'For Association of persons (Trusts)', '', '', ''], isCategory: true),
        _buildTableRow(['27', 'Copy of trust deed or copy of certificate of registration issued by Charity Commissioner', '27', 'Yes', 'Yes']),
        _buildTableRow(['C', 'For Association of persons (other than Trusts) or Body of Individuals or Local authority or Artificial Juridical Person)', '', '', ''], isCategory: true),
        _buildTableRow(['28', 'Copy of Agreement or copy of certificate of registration issued by Charity commissioner or Registrar of Cooperative society or any other competent authority or any other document originating from any Central or State Government Department establishing identity and address of such person.', '28', 'Yes', 'Yes']),
      ],
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false, bool isCategory = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Colors.blue[100] : (isCategory ? Colors.grey[200] : null),
      ),
      children: cells.map((cellText) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cellText,
            style: TextStyle(
              fontWeight: isHeader || isCategory ? FontWeight.bold : FontWeight.normal,
              fontSize: isHeader || isCategory ? 14 : 12,
              color: isHeader ? Colors.blue[900] : Colors.black,
            ),
          ),
        );
      }).toList(),
    );
  }

  // Helper Widgets (Copied from previous pages for self-containment, adding only what's new for this page)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue[900],
        ),
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey),
      ),
    );
  }
}
