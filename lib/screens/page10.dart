import 'package:flutter/material.dart';

class Page10Form extends StatefulWidget {
  const Page10Form({super.key});

  @override
  State<Page10Form> createState() => _Page10FormState();
}

class _Page10FormState extends State<Page10Form> {
  // Signature fields for Page 10
  final TextEditingController _applicantSignature1Controller = TextEditingController();
  final TextEditingController _applicantSignature2Controller = TextEditingController();
  final TextEditingController _applicantSignature3Controller = TextEditingController();

  @override
  void dispose() {
    _applicantSignature1Controller.dispose();
    _applicantSignature2Controller.dispose();
    _applicantSignature3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('(Annexure III)'),
          _buildSectionTitle('DECLARATION FROM NRI CUSTOMERS-'),
          _buildInfoText('I/We hereby declare that I am/we are non-resident(s) of Indian origin. I/We understand that the account(s) are being opened on the basis of the statements declarations made by me/us and I/we also agree that if any statements / declarations made herein is found to be not correct in material particulars, you are not bound to pay any interest on deposit made by me/us. I/We agree that no claim will be made by me/us for any interest on deposit/s for any period after the date/s maturity of the deposit/s. I/we agree to abide by the provisions of the foreign currency (Non-Resident Account / Non-Resident (external) Account/ Non Resident (Ordinary) account and Resident Foreign Currency account schemes. I/we hereby undertake to intimate you about my/our return to India for permanent residence immediately on arrival. I/we further understand that on my/our return to India my/our intimating you the same, My/our FCNR deposit will be converted into Rupee and thereafter account will be designated as Resident Account and If the deposit is kept for further term, interest will be payable on the Rupee deposit at the rate originally fixed. I/we agree that the premature withdrawal is permitted at my/our request, the payment of the interest on the deposit may be allowed in accordance with the prevailing stipulations laid down by Reserve Bank of India, Bank of India in this regards. I/we further understand that the interest payable on renewals will be at the applicable ruling rates on the date of maturity, and that the deposit receipt will be renewed on my /our presenting the matured receipt on the maturity date. You may at your own option but at my/our risk and responsibility in all respect, appoint an agent, who shall be my /our agent to collect and transmission of any cheque, bills, hundies or other instruments or share certificates or other documents or goods or the instruments received in exchange or payments thereof, and the advices and correspondence relating thereto, whether by post or otherwise and whether by land, sea or air or by telegram or cables shall be entirely at my/our risk and responsibility and any loss, damage or delay however occasioned shall be on my/our account and be wholly borne by me/us.'),
          _buildInfoText('I/we undertake that I/we shall not make available to any person resident in India foreign currency against reimbursement in rupees or any other manner in India I/we further undertake that in case of debits to the accounts for the purpose of investing in India and credits representing sale proceeds of investments. I/we shall ensure that such investments/disinvestments would be covered by either general or special permission of Reserve Bank.'),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: const Center(child: Text('Signature of Applicant 1')),
                    ),
                    _buildTextField(controller: _applicantSignature1Controller, labelText: 'Signature of Applicant 1'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: const Center(child: Text('Signature of Applicant 2')),
                    ),
                    _buildTextField(controller: _applicantSignature2Controller, labelText: 'Signature of Applicant 2'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: const Center(child: Text('Signature of Applicant 3')),
                    ),
                    _buildTextField(controller: _applicantSignature3Controller, labelText: 'Signature of Applicant 3'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Submit Button - Moved to the final page (Page 10)
          Center(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement final form submission logic
                _showSubmissionDialog(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blue[800],
                foregroundColor: Colors.white,
                elevation: 5,
                shadowColor: Colors.blueAccent,
              ),
              child: const Text(
                'Submit All Forms',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showSubmissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text('Form Submission', style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text('All forms have been submitted successfully! (This is a placeholder message)'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Helper Widgets (Copied from previous pages for self-containment)
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool readOnly = false,
    VoidCallback? onTap,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.blue[600]!, width: 2.0),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
      ),
    );
  }
}
