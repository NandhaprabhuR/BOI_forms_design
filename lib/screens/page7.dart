import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Page7Form extends StatefulWidget {
  const Page7Form({super.key});

  @override
  State<Page7Form> createState() => _Page7FormState();
}

class _Page7FormState extends State<Page7Form> {
  // FORM NO.60 fields
  final TextEditingController _firstNameController = TextEditingController(text: 'ARUNKUMAR');
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController(text: 'K.');
  final TextEditingController _dobIncorporationController = TextEditingController(text: '28.07.2000');
  final TextEditingController _fatherNameController = TextEditingController(text: 'KANAGARAJ');
  final TextEditingController _flatNoController = TextEditingController(text: '104');
  final TextEditingController _premisesNameController = TextEditingController();
  final TextEditingController _roadStreetLaneController = TextEditingController(text: 'Kovai Road');
  final TextEditingController _areaLocalityController = TextEditingController(text: 'Kadaiyur');
  final TextEditingController _townDistrictStateController = TextEditingController(text: 'Kangayam');
  final TextEditingController _pinCodeController = TextEditingController(text: '638701');
  final TextEditingController _telephoneNumberController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController(text: '9999999999');
  final TextEditingController _amountOfTransactionController = TextEditingController();
  final TextEditingController _dateOfTransactionController = TextEditingController();
  final TextEditingController _jointAccountPersonsInvolvedController = TextEditingController();
  String? _modeOfTransaction = ''; // Radio group for transaction mode
  final TextEditingController _aadhaarNumberController = TextEditingController();
  final TextEditingController _panApplicationDateAckNoController = TextEditingController();
  final TextEditingController _agriculturalIncomeController = TextEditingController();
  final TextEditingController _otherAgrIncomeController = TextEditingController();
  final TextEditingController _docCode1Controller = TextEditingController();
  final TextEditingController _docIdNumber1Controller = TextEditingController();
  final TextEditingController _docAuthority1Controller = TextEditingController();
  final TextEditingController _docCode2Controller = TextEditingController();
  final TextEditingController _docIdNumber2Controller = TextEditingController();
  final TextEditingController _docAuthority2Controller = TextEditingController();

  // Verification fields
  final TextEditingController _verificationNameController = TextEditingController(); // This will be the same as first name
  final TextEditingController _verifiedDayController = TextEditingController(text: '27');
  final TextEditingController _verifiedMonthController = TextEditingController(text: 'April');
  final TextEditingController _verifiedYearController = TextEditingController(text: '2023');
  final TextEditingController _verificationPlaceController = TextEditingController(text: 'GANAPATHYPALAYAM');
  final TextEditingController _signatureOfDeclarantController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _surnameController.dispose();
    _dobIncorporationController.dispose();
    _fatherNameController.dispose();
    _flatNoController.dispose();
    _premisesNameController.dispose();
    _roadStreetLaneController.dispose();
    _areaLocalityController.dispose();
    _townDistrictStateController.dispose();
    _pinCodeController.dispose();
    _telephoneNumberController.dispose();
    _mobileNumberController.dispose();
    _amountOfTransactionController.dispose();
    _dateOfTransactionController.dispose();
    _jointAccountPersonsInvolvedController.dispose();
    _aadhaarNumberController.dispose();
    _panApplicationDateAckNoController.dispose();
    _agriculturalIncomeController.dispose();
    _otherAgrIncomeController.dispose();
    _docCode1Controller.dispose();
    _docIdNumber1Controller.dispose();
    _docAuthority1Controller.dispose();
    _docCode2Controller.dispose();
    _docIdNumber2Controller.dispose();
    _docAuthority2Controller.dispose();
    _verificationNameController.dispose();
    _verifiedDayController.dispose();
    _verifiedMonthController.dispose();
    _verifiedYearController.dispose();
    _verificationPlaceController.dispose();
    _signatureOfDeclarantController.dispose();
    super.dispose();
  }

  // Helper function to pick date
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('dd.MM.yyyy').format(picked); // Changed format for consistency with image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Income-tax Rules, 1962'),
          _buildSectionTitle('FORM NO.60'),
          _buildInfoText('[See second proviso to rule 114B]'),
          _buildInfoText('Form for declaration to be filed by an individual or a person (not being a company or firm) who does not have a permanent account number and who enters into any transaction specified in rule 114B'),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(child: _buildTextField(controller: _firstNameController, labelText: '1 First Name')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _middleNameController, labelText: 'Middle Name')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _surnameController, labelText: 'Surname')),
            ],
          ),
          _buildTextField(
            controller: _dobIncorporationController,
            labelText: '2 Date of Birth / Incorporation of declarant',
            readOnly: true,
            onTap: () => _selectDate(context, _dobIncorporationController),
          ),
          _buildTextField(controller: _fatherNameController, labelText: '3 Father\'s Name (in case of individual)'),
          _buildTextField(controller: _flatNoController, labelText: '4 Flat No./Floor No.'),
          _buildTextField(controller: _premisesNameController, labelText: '5 Name of premises / Block Name & No.'),
          _buildTextField(controller: _roadStreetLaneController, labelText: '6 Road / Street / Lane'),
          _buildTextField(controller: _areaLocalityController, labelText: '7 Area / Locality'),
          _buildTextField(controller: _townDistrictStateController, labelText: '8. Town/District/State'),
          _buildTextField(controller: _pinCodeController, labelText: '9 Pin code'),
          _buildTextField(controller: _telephoneNumberController, labelText: '10 Telephone Number (with STD code)'),
          _buildTextField(controller: _mobileNumberController, labelText: '11 Mobile Number'),
          _buildTextField(controller: _amountOfTransactionController, labelText: '12 Amount of Transaction (Rs.)'),
          _buildTextField(
            controller: _dateOfTransactionController,
            labelText: '13 Date of transaction',
            readOnly: true,
            onTap: () => _selectDate(context, _dateOfTransactionController),
          ),
          _buildTextField(controller: _jointAccountPersonsInvolvedController, labelText: '14 In case of transaction in joint names, number of persons involved in the transaction'),
          _buildRadioGroup(
            '15 Mode of Transaction',
            ['Cash', 'Cheque', 'Card', 'Draft/Banker\'s Cheque', 'Online transfer', 'Other'],
            _modeOfTransaction,
                (String? value) {
              setState(() {
                _modeOfTransaction = value;
              });
            },
          ),
          _buildTextField(controller: _aadhaarNumberController, labelText: '16 Aadhaar Number issued by UIDAI (if available):'),
          _buildTextField(
            controller: _panApplicationDateAckNoController,
            labelText: '17 If applied for PAN and it is not yet generated enter date of application and acknowledgement number',
            readOnly: true,
            onTap: () => _selectDate(context, _panApplicationDateAckNoController),
          ),
          _buildInfoText('18 If PAN not applied, fill estimated total income (including income of spouse, minor child etc., as per section 64 of Income-tax Act, 1961) for the financial year in which the above transaction is held (a) Agricultural income (Rs.) (b) Other than Agr Income (Rs.)'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _agriculturalIncomeController, labelText: '(a) Agricultural income (Rs.)')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _otherAgrIncomeController, labelText: '(b) Other than Agr Income (Rs.)')),
            ],
          ),
          _buildInfoText('19 Details of document being produced in support of identify in Column 1 (Refer Instruction overleaf)'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _docCode1Controller, labelText: 'Document code')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _docIdNumber1Controller, labelText: 'Document identification number')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _docAuthority1Controller, labelText: 'Name and address of the authority issuing the document')),
            ],
          ),
          _buildInfoText('20 Details of document being produced in support of identify in Column 4 to 13 (Refer Instruction overleaf)'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _docCode2Controller, labelText: 'Document code')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _docIdNumber2Controller, labelText: 'Document identification number')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _docAuthority2Controller, labelText: 'Name and address of the authority issuing the document')),
            ],
          ),
          const SizedBox(height: 20),

          _buildSectionTitle('Verification'),
          _buildInfoText('I, _________ do hereby declare that what is stated above is true to the best of my knowledge and belief. I further declare that I do not have a Permanent Account Number and my / our estimated total income (including income of spouse, minor child etc., as per section 64 of Income Tax Act, 1961) computed in accordance with the provisions of Income tax Act, 1961 for the financial year in which the above transaction is held will be less than maximum amount not chargeable to tax.'),
          _buildTextField(controller: _verificationNameController, labelText: 'I, (Name of declarant)'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _verifiedDayController, labelText: 'Verified today the')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _verifiedMonthController, labelText: 'day of')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _verifiedYearController, labelText: '')),
            ],
          ),
          _buildTextField(controller: _verificationPlaceController, labelText: 'Place :'),
          const SizedBox(height: 10),
          Container(
            height: 80,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: const Center(child: Text('(Signature of declarant)')),
          ),
          _buildTextField(controller: _signatureOfDeclarantController, labelText: 'Signature of declarant'),
          _buildInfoText('Note: Before signing the declaration, the declarant should satisfy himself that the information furnished in this form is true, correct and complete in all respects. Any person making a false statement in the declaration shall be liable to prosecution under section 277 of the Income-tax Act, 1961 and on conviction be punishable,'),
          _buildInfoText('(i) in a case where tax sought to be evaded exceeds twenty-five lakh rupees, with rigorous imprisonment which shall not be less than six months but which may extend to seven years and with fine;'),
          _buildInfoText('(ii) in any other case, with rigorous imprisonment which shall not be less than three months but which may extend to two years and with fine.'),
          const SizedBox(height: 30),
          // The submit button has been removed from here as per your request.
        ],
      ),
    );
  }

  // The _showSubmissionDialog method has been removed as it's no longer needed in this file.

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

  Widget _buildCheckbox(String title, bool value, ValueChanged<bool?> onChanged) {
    return SizedBox(
      width: 180, // Approximate width for checkbox and text
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue[700],
          ),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowOfCheckboxes(String title, List<Widget> checkboxes) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Wrap(
            spacing: 0.0,
            runSpacing: 0.0,
            children: checkboxes,
          ),
        ],
      ),
    );
  }

  Widget _buildRadioGroup(String title, List<String> options, String? selectedOption, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          Wrap(
            spacing: 0.0,
            runSpacing: 0.0,
            children: options.map((option) {
              return SizedBox(
                width: 200, // Approximate width for radio and text
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<String>(
                      value: option,
                      groupValue: selectedOption,
                      onChanged: onChanged,
                      activeColor: Colors.blue[700],
                    ),
                    Flexible(
                      child: Text(
                        option,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String title, List<String> options, String? selectedOption, ValueChanged<String?> onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 120, // Adjust width as needed for the title
          child: Text(
            title,
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ...options.map((option) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<String>(
                value: option,
                groupValue: selectedOption,
                onChanged: onChanged,
                activeColor: Colors.blue[700],
              ),
              Text(
                option,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildRowOfRadioButtons(String title, List<Widget> radioOptionWidgets) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          Wrap(
            spacing: 0.0,
            runSpacing: 0.0,
            children: radioOptionWidgets,
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxGroup(
      String title, Map<String, bool> options, Set<String> selectedOptions,
      void Function(String, bool?) onChanged, {bool isSingleSelection = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          Wrap(
            spacing: 0.0,
            runSpacing: 0.0,
            children: options.keys.map((option) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20, // Example: roughly half screen width minus padding
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: selectedOptions.contains(option),
                      onChanged: (bool? value) {
                        if (isSingleSelection && value == true) {
                          setState(() {
                            selectedOptions.clear(); // Clear all other selections
                            selectedOptions.add(option);
                          });
                        } else {
                          onChanged(option, value);
                        }
                      },
                      activeColor: Colors.blue[700],
                    ),
                    Flexible(
                      child: Text(
                        option,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
