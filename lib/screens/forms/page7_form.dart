// lib/screens/forms/page7_form.dart

import 'package:flutter/material.dart';
import '../model/form_data_model.dart';
import 'form_helper.dart';

class Page7Form extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page7Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page7Form> createState() => _Page7FormState();
}

class _Page7FormState extends State<Page7Form> {
  // Controllers for Form No.60 fields
  late TextEditingController _firstNameController;
  late TextEditingController _middleNameController;
  late TextEditingController _surnameController;
  late TextEditingController _dobController;
  late TextEditingController _fatherNameController;
  late TextEditingController _flatNoController;
  late TextEditingController _premisesNameController;
  late TextEditingController _roadStreetController;
  late TextEditingController _areaLocalityController;
  late TextEditingController _townDistrictStateController;
  late TextEditingController _pinCodeController;
  late TextEditingController _telephoneSTDController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _transactionAmountController;
  late TextEditingController _transactionDateController;
  late TextEditingController _jointPersonsCountController;
  late TextEditingController _aadhaarNumberController;

  // Mode of transaction checkboxes
  bool _modeCash = false;
  bool _modeCheque = false;
  bool _modeCard = false;
  bool _modeDraft = false;
  bool _modeOnlineTransfer = false;
  bool _modeOther = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _middleNameController = TextEditingController();
    _surnameController = TextEditingController();
    _dobController = TextEditingController();
    _fatherNameController = TextEditingController();
    _flatNoController = TextEditingController();
    _premisesNameController = TextEditingController();
    _roadStreetController = TextEditingController();
    _areaLocalityController = TextEditingController();
    _townDistrictStateController = TextEditingController();
    _pinCodeController = TextEditingController();
    _telephoneSTDController = TextEditingController();
    _mobileNumberController = TextEditingController();
    _transactionAmountController = TextEditingController();
    _transactionDateController = TextEditingController();
    _jointPersonsCountController = TextEditingController();
    _aadhaarNumberController = TextEditingController();

    FormHelper.addListeners([
      _firstNameController,
      _middleNameController,
      _surnameController,
      _dobController,
      _fatherNameController,
      _flatNoController,
      _premisesNameController,
      _roadStreetController,
      _areaLocalityController,
      _townDistrictStateController,
      _pinCodeController,
      _telephoneSTDController,
      _mobileNumberController,
      _transactionAmountController,
      _transactionDateController,
      _jointPersonsCountController,
      _aadhaarNumberController,
    ], _notifyChange);
  }

  void _notifyChange() {
    widget.onDataChanged(widget.initialData);
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (val) {
            onChanged(val);
            _notifyChange();
          },
        ),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 12))),
      ],
    );
  }

  @override
  void dispose() {
    FormHelper.disposeControllers([
      _firstNameController,
      _middleNameController,
      _surnameController,
      _dobController,
      _fatherNameController,
      _flatNoController,
      _premisesNameController,
      _roadStreetController,
      _areaLocalityController,
      _townDistrictStateController,
      _pinCodeController,
      _telephoneSTDController,
      _mobileNumberController,
      _transactionAmountController,
      _transactionDateController,
      _jointPersonsCountController,
      _aadhaarNumberController,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
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
            child: Column(
              children: [
                const Text(
                  'Annexure-1',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Income-tax Rules, 1962',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Text(
                  'FORM NO.60',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Text(
                  '[See second proviso to rule 114B]',
                  style: TextStyle(
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Description
          const Text(
            'Form for declaration to be filed by an individual or a person (not being a company or firm) who does not have a permanent account number and who enters into any transaction specified in rule 114B',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),

          // 1. Name
          FormHelper.buildSectionTitle('1. Name'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'First Name',
            _firstNameController,
            maxLines: 1,
          ),
          const SizedBox(height: 12),
          FormHelper.buildTextField(
            'Middle Name',
            _middleNameController,
            maxLines: 1,
          ),
          const SizedBox(height: 12),
          FormHelper.buildTextField('Surname', _surnameController, maxLines: 1),
          const SizedBox(height: 20),

          // 2. Date of Birth / Incorporation of declarant
          FormHelper.buildSectionTitle(
            '2. Date of Birth / Incorporation of declarant',
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Date of Birth (DD/MM/YYYY)',
            _dobController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 3. Father's Name
          FormHelper.buildSectionTitle(
            '3. Father\'s Name (in case of individual)',
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Father\'s Name',
            _fatherNameController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 4. Flat No./Floor No.
          FormHelper.buildSectionTitle('4. Flat No./Floor No.'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Flat No./Floor No.',
            _flatNoController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 5. Name of premises / Block Name & No.
          FormHelper.buildSectionTitle(
            '5. Name of premises / Block Name & No.',
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Name of premises / Block Name & No.',
            _premisesNameController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 6. Road / Street / Lane
          FormHelper.buildSectionTitle('6. Road / Street / Lane'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Road / Street / Lane',
            _roadStreetController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 7. Area / Locality
          FormHelper.buildSectionTitle('7. Area / Locality'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Area / Locality',
            _areaLocalityController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 8. Town/District/State
          FormHelper.buildSectionTitle('8. Town/District/State'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Town/District/State',
            _townDistrictStateController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 9. Pin code
          FormHelper.buildSectionTitle('9. Pin code'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Pin code',
            _pinCodeController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 10. Telephone Number (with STD code)
          FormHelper.buildSectionTitle('10. Telephone Number (with STD code)'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Telephone Number (with STD code)',
            _telephoneSTDController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 11. Mobile Number
          FormHelper.buildSectionTitle('11. Mobile Number'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Mobile Number',
            _mobileNumberController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 12. Amount of Transaction (Rs.)
          FormHelper.buildSectionTitle('12. Amount of Transaction (Rs.)'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Amount of Transaction (Rs.)',
            _transactionAmountController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 13. Date of transaction
          FormHelper.buildSectionTitle('13. Date of transaction'),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Date of transaction (DD/MM/YYYY)',
            _transactionDateController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 14. In case of transaction in joint names
          FormHelper.buildSectionTitle(
            '14. In case of transaction in joint names, number of persons involved in the transaction',
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Number of persons involved',
            _jointPersonsCountController,
            maxLines: 1,
          ),
          const SizedBox(height: 20),

          // 15. Mode of transaction
          FormHelper.buildSectionTitle('15. Mode of transaction'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                _buildCheckbox('Cash', _modeCash, (val) {
                  setState(() => _modeCash = val ?? false);
                }),
                _buildCheckbox('Cheque', _modeCheque, (val) {
                  setState(() => _modeCheque = val ?? false);
                }),
                _buildCheckbox('Card', _modeCard, (val) {
                  setState(() => _modeCard = val ?? false);
                }),
                _buildCheckbox('Draft/Banker\'s Cheque', _modeDraft, (val) {
                  setState(() => _modeDraft = val ?? false);
                }),
                _buildCheckbox('Online transfer', _modeOnlineTransfer, (val) {
                  setState(() => _modeOnlineTransfer = val ?? false);
                }),
                _buildCheckbox('Other', _modeOther, (val) {
                  setState(() => _modeOther = val ?? false);
                }),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 16. Aadhaar Number
          FormHelper.buildSectionTitle(
            '16. Aadhaar Number issued by UIDAI (if available) :',
          ),
          const SizedBox(height: 8),
          FormHelper.buildTextField(
            'Aadhaar Number',
            _aadhaarNumberController,
            maxLines: 1,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
