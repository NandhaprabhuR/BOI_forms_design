import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class Page2Form extends StatefulWidget {
  const Page2Form({super.key});

  @override
  State<Page2Form> createState() => _Page2FormState();
}

class _Page2FormState extends State<Page2Form> {
  // Section 4: Address details (Current)
  String? _currentAddressType = 'Residential/Business';
  final TextEditingController _currentAddressController = TextEditingController(text: '104 KOVALAI ROAD KADAIYUR');
  final TextEditingController _currentCityVillageController = TextEditingController(text: 'KANGAYAM');
  final TextEditingController _currentDistrictController = TextEditingController(text: 'TIRUPUR');
  final TextEditingController _currentStateController = TextEditingController(text: 'TAMILNADU');
  final TextEditingController _currentPinController = TextEditingController(text: '638701');

  // Section 5: Address details (Correspondence)
  bool _isSameAsCurrentAddress = true;
  String? _correspondenceAddressType = 'Residential/Business';
  final TextEditingController _correspondenceAddressController = TextEditingController(text: '104 KOVALAI ROAD KADAIYUR');
  final TextEditingController _correspondenceCityVillageController = TextEditingController(text: 'KANGAYAM');
  final TextEditingController _correspondenceDistrictController = TextEditingController(text: 'TIRUPUR');
  final TextEditingController _correspondenceStateController = TextEditingController(text: 'TAMILNADU');
  final TextEditingController _correspondencePinController = TextEditingController(text: '638701');

  // Section 7: Documents for OVD not containing current address
  Set<String> _selectedOVDDocuments = {};
  final TextEditingController _ovdDocNoController = TextEditingController();
  final TextEditingController _ovdDocDateController = TextEditingController();
  // New: Undertaking related to OVD
  bool _ovdUndertakingAccepted = false; // For "I hereby undertake that OVD..."

  // Section 8: DECLARATION CUM UNDERTAKING CUM SELF-CERTIFICATION
  bool _declarationAcceptedTerms = false; // For "I have read the copy of Terms and Conditions..."
  bool _declarationAadhaarSubmitted = true; // Defaulted to true as per image
  String? _biometricConsent = 'YES'; // For "I hereby consent that the bank may verify..."
  final TextEditingController _placeDeclarationController = TextEditingController();
  final TextEditingController _dateDeclarationController = TextEditingController(text: DateFormat('ddMMyyyy').format(DateTime.now()));


  // Section 9: FOR OFFICE USE/ATTESTATION
  Set<String> _officeUseDocuments = {};
  bool _verificationCorrectYes = false; // For "Whether self-certification & documents received... YES"
  bool _verificationCorrectNo = false; // For "Whether self-certification & documents received... NO"
  String? _depositorType = 'Illiterate'; // Defaulting as per image
  final TextEditingController _staffPfNoDepositorController = TextEditingController(); // For Staff PF No in Depositor type
  String? _riskCategory = 'Low'; // Defaulting as per image
  final TextEditingController _identificationMarksOfficeUseController = TextEditingController(); // For identification marks
  final TextEditingController _officialNameController = TextEditingController();
  final TextEditingController _pfNoController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _signatureOfficeUseController = TextEditingController(); // Renamed to avoid conflict
  final TextEditingController _officeUseDateController = TextEditingController();
  final TextEditingController _ssNoController = TextEditingController();


  @override
  void dispose() {
    _currentAddressController.dispose();
    _currentCityVillageController.dispose();
    _currentDistrictController.dispose();
    _currentStateController.dispose();
    _currentPinController.dispose();
    _correspondenceAddressController.dispose();
    _correspondenceCityVillageController.dispose();
    _correspondenceDistrictController.dispose();
    _correspondenceStateController.dispose();
    _correspondencePinController.dispose();
    _ovdDocNoController.dispose();
    _ovdDocDateController.dispose();
    _placeDeclarationController.dispose();
    _dateDeclarationController.dispose();
    _staffPfNoDepositorController.dispose(); // Dispose new controller
    _identificationMarksOfficeUseController.dispose(); // Dispose new controller
    _officialNameController.dispose();
    _pfNoController.dispose();
    _designationController.dispose();
    _signatureOfficeUseController.dispose(); // Dispose new controller
    _officeUseDateController.dispose();
    _ssNoController.dispose();
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
        controller.text = DateFormat('ddMMyyyy').format(picked);
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
          _buildSectionTitle('4 Address details (Current)'),
          _buildRadioGroup(
            'Address type*',
            ['Residential/Business', 'Residential', 'Business', 'Registered Office', 'Unspecified'],
            _currentAddressType,
                (String? value) {
              setState(() {
                _currentAddressType = value;
              });
            },
          ),
          _buildTextField(controller: _currentAddressController, labelText: 'Address*'),
          _buildTextField(controller: _currentCityVillageController, labelText: 'City/Village*'),
          _buildTextField(controller: _currentDistrictController, labelText: 'District*'),
          _buildTextField(controller: _currentStateController, labelText: 'State*'),
          _buildTextField(controller: _currentPinController, labelText: 'Pin*'),
          const SizedBox(height: 20),

          _buildSectionTitle('5 Address details (Correspondence)'),
          _buildCheckbox('Same as Current/Permanent Address', _isSameAsCurrentAddress, (bool? value) {
            setState(() {
              _isSameAsCurrentAddress = value!;
              if (_isSameAsCurrentAddress) {
                _correspondenceAddressType = _currentAddressType;
                _correspondenceAddressController.text = _currentAddressController.text;
                _correspondenceCityVillageController.text = _currentCityVillageController.text;
                _correspondenceDistrictController.text = _currentDistrictController.text;
                _correspondenceStateController.text = _currentStateController.text;
                _correspondencePinController.text = _currentPinController.text;
              }
            });
          }),
          if (!_isSameAsCurrentAddress) ...[
            _buildRadioGroup(
              'Address type*',
              ['Correspondence', 'Residential/Business', 'Residential', 'Business', 'Registered Office', 'Unspecified'],
              _correspondenceAddressType,
                  (String? value) {
                setState(() {
                  _correspondenceAddressType = value;
                });
              },
            ),
            _buildTextField(controller: _correspondenceAddressController, labelText: 'Address*'),
            _buildTextField(controller: _correspondenceCityVillageController, labelText: 'City/Village*'),
            _buildTextField(controller: _correspondenceDistrictController, labelText: 'District*'),
            _buildTextField(controller: _correspondenceStateController, labelText: 'State*'),
            _buildTextField(controller: _correspondencePinController, labelText: 'Pin*'),
          ],
          const SizedBox(height: 20),

          _buildSectionTitle('6 If the Proof of Address as per Aadhaar (OVD) provided does not contain current address'),
          _buildInfoText('If the Proof of Address as per Aadhaar provided does not contain current address, a SELF DECLARATION of current address is required as a proof of current address.'),
          const SizedBox(height: 20),

          _buildSectionTitle('7 If the Proof of Address (OVD) provided does not contain current address, PLEASE PROVIDE any of the documents below.'),
          _buildCheckboxGroup(
            '',
            {
              'Utility Bill': false, 'PPO/FPO': false, 'Property or Municipal tax receipt': false,
              'Letter of allotment of accommodation issued by employers/ issued by State or Central Government departments, statutory or regulatory bodies, Public sector undertaking, scheduled commercial banks, financial institutions and listed companies. Similarly, leave and license agreements with such employers allotting official accommodation': false,
            },
            _selectedOVDDocuments,
                (String key, bool? value) {
              setState(() {
                if (value!) {
                  _selectedOVDDocuments.add(key);
                } else {
                  _selectedOVDDocuments.remove(key);
                }
              });
            },
          ),
          _buildTextField(controller: _ovdDocNoController, labelText: 'Document No'),
          _buildTextField(
            controller: _ovdDocDateController,
            labelText: 'Date',
            readOnly: true,
            onTap: () => _selectDate(context, _ovdDocDateController),
          ),
          _buildInfoText('I hereby undertake that OVD with current address will be submitted within a period of three months from the date of opening of accountfailing which bank may stop / restrict operations in the account'),
          const SizedBox(height: 20),

          _buildSectionTitle('8 DECLARATION CUM UNDERTAKING CUM SELF-CERTIFICATION'),
          _buildCheckbox('I have read the copy of Terms and Conditions of the Account Opening given to me. The Terms and Conditions have been explained to me/us and having understood, I accept the same.', _declarationAcceptedTerms, (bool? value) {
            setState(() {
              _declarationAcceptedTerms = value!;
            });
          }),
          _buildInfoText('I hereby declare that I have submitted the Aadhaar Card issued by UIDAI voluntarily for identification and/or address proof towards the compliance of KYC norms under the PMLA, 2002'),
          _buildInfoText('I hereby consent that the bank may verify the same with the UIDAI and authorise the UIDAI expressly to release the identity and address through biometric authentication to the Bank.'),
          _buildRadioGroup(
            '', // No specific title for this radio group
            ['YES', 'NO'],
            _biometricConsent,
                (String? value) {
              setState(() {
                _biometricConsent = value;
              });
            },
          ),
          const SizedBox(height: 20),
          // Placeholder for Photo and Signature boxes
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('PHOTO\n(Please Paste\nRecent passport Size\n(Do Not Staple)')),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('Signature/Thumb impression of the Applicant\n(Please sign in black ink only)')),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTextField(controller: _placeDeclarationController, labelText: 'Place'),
          _buildTextField(
            controller: _dateDeclarationController,
            labelText: 'Date',
            readOnly: true,
            onTap: () => _selectDate(context, _dateDeclarationController),
          ),
          const SizedBox(height: 20),

          _buildSectionTitle('9 FOR OFFICE USE/ATTESTATION'),
          _buildCheckboxGroup(
            '', // No specific title for this group
            {
              'Documents received': false, 'Self certified': false, 'True copies': false, 'Notary': false,
            },
            _officeUseDocuments,
                (String key, bool? value) {
              setState(() {
                if (value!) {
                  _officeUseDocuments.add(key);
                } else {
                  _officeUseDocuments.remove(key);
                }
              });
            },
          ),
          _buildRowOfCheckboxes(
            'Whether self-certification & documents received as part of account opening process have been verified and found correct YES/NO (Branch to proceed with opening only when verification is YES))',
            [
              _buildCheckbox('YES', _verificationCorrectYes, (bool? value) {
                setState(() {
                  _verificationCorrectYes = value!;
                  if (value) _verificationCorrectNo = false;
                });
              }),
              _buildCheckbox('NO', _verificationCorrectNo, (bool? value) {
                setState(() {
                  _verificationCorrectNo = value!;
                  if (value) _verificationCorrectYes = false;
                });
              }),
            ],
          ),
          _buildInfoText('Certified that the implications and conditions for the operation of the account have been explained to the depositor (only in case of illiterate applicant)'),
          _buildRadioGroup(
            'Depositor is',
            ['Illiterate', 'Blind', 'Staff'],
            _depositorType,
                (String? value) {
              setState(() {
                _depositorType = value;
              });
            },
            additionalWidget: _depositorType == 'Staff'
                ? Expanded(child: _buildTextField(controller: _staffPfNoDepositorController, labelText: 'PF No.'))
                : null,
          ),
          _buildRadioGroup(
            'Risk Category*',
            ['High', 'Medium', 'Low'],
            _riskCategory,
                (String? value) {
              setState(() {
                _riskCategory = value;
              });
            },
          ),
          _buildInfoText('Details of one or two identification marks, if any, such as a mole or scar (mandatory for illiterate applicant)'),
          _buildTextField(controller: _identificationMarksOfficeUseController, labelText: 'Identification Marks'),
          _buildInfoText('In person verification carried out and Signature/LTI of the applicant verified by:'),
          _buildTextField(controller: _officialNameController, labelText: 'Official Name:'),
          _buildTextField(controller: _pfNoController, labelText: 'PF No.'),
          _buildTextField(controller: _designationController, labelText: 'Designation'),
          _buildTextField(controller: _signatureOfficeUseController, labelText: 'Signature'),
          _buildTextField(
            controller: _officeUseDateController, // Using a dedicated controller
            labelText: 'Date',
            readOnly: true,
            onTap: () => _selectDate(context, _officeUseDateController),
          ),
          _buildTextField(controller: _ssNoController, labelText: 'SS No.'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Helper Widgets (Copied from page1.dart to make page2.dart self-contained for now)
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

  Widget _buildRadioGroup(String title, List<String> options, String? selectedOption, ValueChanged<String?> onChanged, {Widget? additionalWidget}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              ...options.map((option) {
                return Expanded(
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
              if (additionalWidget != null) additionalWidget,
            ],
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
