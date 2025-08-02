import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

// MyApp is now a StatefulWidget in main.dart to handle page navigation.
// This file defines Page1Form only.

class Page1Form extends StatefulWidget {
  const Page1Form({super.key});

  @override
  State<Page1Form> createState() => _Page1FormState();
}

class _Page1FormState extends State<Page1Form> {
  // Section 1 Controllers and State
  final TextEditingController _dateController = TextEditingController(text: DateFormat('ddMMyyyy').format(DateTime.now()));
  final TextEditingController _branchNameController = TextEditingController(text: 'GANAPATHYPALAYAM');
  final TextEditingController _branchCodeController = TextEditingController();
  final TextEditingController _customerIDController = TextEditingController();
  final TextEditingController _accountNoController = TextEditingController();
  final TextEditingController _ckycNoController = TextEditingController();
  bool _isNewApplication = true;
  bool _isUpdateApplication = false;
  bool _isNormalAccount = true;
  bool _isSmallAccount = false;

  // Section 2 Controllers and State
  final TextEditingController _existingCustomerIDController = TextEditingController();
  final TextEditingController _namePrefixController = TextEditingController(text: 'Mr.'); // Added for Name prefix
  final TextEditingController _nameFirstNameController = TextEditingController(text: 'Arunkumar'); // Split from _nameController
  final TextEditingController _nameMiddleNameController = TextEditingController(); // Split from _nameController
  final TextEditingController _nameSurnameController = TextEditingController(); // Split from _nameController
  bool _isSameAsIDProof = false;
  final TextEditingController _maidenNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController(text: '15032000');
  String? _selectedGender = 'Male';
  String? _selectedMaritalStatus = 'Married'; // Changed to String? for radio group
  final TextEditingController _fatherNameController = TextEditingController(text: 'BALASUBRAMANIYAM');
  final TextEditingController _motherNameController = TextEditingController(text: 'GOWRI');
  final TextEditingController _spouseNameController = TextEditingController(text: 'KRITHIKA');
  final TextEditingController _noOfDependentsController = TextEditingController();
  bool _isIlliterateYes = false; // Added for Illiterate
  bool _isIlliterateNo = true; // Added for Illiterate
  final TextEditingController _identificationMarksController = TextEditingController(); // Added for Identification Marks
  final TextEditingController _guardianPrefixController = TextEditingController(); // Added for Guardian prefix
  final TextEditingController _guardianNameController = TextEditingController();
  final TextEditingController _relationshipWithGuardianController = TextEditingController();
  String? _selectedNationality = 'In-Indian'; // Changed to String? for radio group
  final TextEditingController _countryNameNationalityController = TextEditingController(); // Added for Country Name if Other Nationality
  String? _selectedResidentStatus = 'Resident Individual';
  Set<String> _selectedOccupationTypes = {};
  final TextEditingController _occupationSpecifyController = TextEditingController();
  final TextEditingController _monthlyIncomeController = TextEditingController(text: '50000');
  final TextEditingController _netWorthController = TextEditingController();
  String? _selectedReligion = 'Hindu';
  String? _selectedCategory = 'General';
  String? _selectedCustomerType = 'General';
  final TextEditingController _staffPfNoController = TextEditingController();
  final TextEditingController _customerTypeSpecifyController = TextEditingController();
  bool _isPersonWithDisabilityYes = false;
  bool _isPersonWithDisabilityNo = true;
  bool _isVisuallyImpaired = false;
  bool _isDifferentlyAbled = false;
  Set<String> _selectedEducationalQualifications = {};
  final TextEditingController _organizationNameController = TextEditingController();
  final TextEditingController _designationProfessionController = TextEditingController();
  final TextEditingController _natureOfBusinessController = TextEditingController();
  String? _politicallyExposedStatus = 'None'; // Radio group for Politically Exposed
  final TextEditingController _countryCodeResidenceController = TextEditingController();
  final TextEditingController _placeCityOfBirthController = TextEditingController();
  final TextEditingController _countryCodeBirthController = TextEditingController();
  final TextEditingController _citizenshipController = TextEditingController();
  String? _taxResidenceIndiaOnly = 'Yes'; // Radio group for Tax Residence
  final TextEditingController _panTinController = TextEditingController();
  bool _isForm60Submitted = false;

  // Section 3 Contact Details
  final TextEditingController _mobileNoController = TextEditingController(text: '+919999999999');
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _alternateMobNoController = TextEditingController();
  final TextEditingController _telOffController = TextEditingController();
  final TextEditingController _telResController = TextEditingController();

  // Section 4 Proof of Identity/Address
  Set<String> _selectedIdProofs = {'D-Proof of possession of AADHAAR'};
  final TextEditingController _documentNoController = TextEditingController(text: '2222222222');
  final TextEditingController _issueDateController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free up resources
    _dateController.dispose();
    _branchNameController.dispose();
    _branchCodeController.dispose();
    _customerIDController.dispose();
    _accountNoController.dispose();
    _ckycNoController.dispose();
    _existingCustomerIDController.dispose();
    _namePrefixController.dispose(); // Dispose new controller
    _nameFirstNameController.dispose(); // Dispose new controller
    _nameMiddleNameController.dispose(); // Dispose new controller
    _nameSurnameController.dispose(); // Dispose new controller
    _maidenNameController.dispose();
    _dobController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _spouseNameController.dispose();
    _noOfDependentsController.dispose();
    _identificationMarksController.dispose(); // Dispose new controller
    _guardianPrefixController.dispose(); // Dispose new controller
    _guardianNameController.dispose();
    _relationshipWithGuardianController.dispose();
    _countryNameNationalityController.dispose(); // Dispose new controller
    _occupationSpecifyController.dispose();
    _monthlyIncomeController.dispose();
    _netWorthController.dispose();
    _staffPfNoController.dispose();
    _customerTypeSpecifyController.dispose();
    _organizationNameController.dispose();
    _designationProfessionController.dispose();
    _natureOfBusinessController.dispose();
    _countryCodeResidenceController.dispose();
    _placeCityOfBirthController.dispose();
    _countryCodeBirthController.dispose();
    _citizenshipController.dispose();
    _panTinController.dispose();
    _mobileNoController.dispose();
    _emailIdController.dispose();
    _alternateMobNoController.dispose();
    _telOffController.dispose();
    _telResController.dispose();
    _documentNoController.dispose();
    _issueDateController.dispose();
    _expiryDateController.dispose();
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
          // Bank of India Header - Replaced Image.network with a simple Text for reliability
          Center(
            child: Text(
              'BANK OF INDIA',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Section 1: ACCOUNT OPENING FORM FOR RESIDENT INDIVIDUAL (PART-I)
          _buildSectionTitle('ACCOUNT OPENING FORM FOR RESIDENT INDIVIDUAL (PART-I)'),
          _buildInfoText('CUSTOMER INFORMATION SHEET (CIF Creation/Amendment)'),
          _buildInfoText('(In case of joint accounts, Part-II/CIF Sheet to be taken for each customer)'),
          const SizedBox(height: 10),

          _buildTextField(
            controller: _dateController,
            labelText: 'Date',
            readOnly: true,
            onTap: () => _selectDate(context, _dateController),
          ),
          _buildTextField(controller: _branchNameController, labelText: 'Branch Name *'),
          _buildTextField(controller: _branchCodeController, labelText: 'Branch Code *'),
          _buildInfoText('Fields marked asterisk (*) are mandatory. Please fill up in BLOCK letters only and use black ink for signature.'),
          _buildTextField(controller: _customerIDController, labelText: 'Customer ID'),
          _buildTextField(controller: _accountNoController, labelText: 'Account No.'),

          _buildRowOfCheckboxes(
            'Application Type:',
            [
              _buildCheckbox('New', _isNewApplication, (bool? value) {
                setState(() {
                  _isNewApplication = value!;
                  if (value) _isUpdateApplication = false;
                });
              }),
              _buildCheckbox('Update', _isUpdateApplication, (bool? value) {
                setState(() {
                  _isUpdateApplication = value!;
                  if (value) _isNewApplication = false;
                });
              }),
            ],
          ),
          _buildTextField(controller: _ckycNoController, labelText: 'CKYC No. (Mandatory for CKYC update request)'),
          _buildRowOfCheckboxes(
            'Account Type:',
            [
              _buildCheckbox('Normal', _isNormalAccount, (bool? value) {
                setState(() {
                  _isNormalAccount = value!;
                  if (value) _isSmallAccount = false;
                });
              }),
              _buildCheckbox('Small (For low risk customers)', _isSmallAccount, (bool? value) {
                setState(() {
                  _isSmallAccount = value!;
                  if (value) _isNormalAccount = false;
                });
              }),
            ],
          ),
          const SizedBox(height: 20),

          // Section 2: Personal Details
          _buildSectionTitle('2 Personal Details'),
          _buildTextField(controller: _existingCustomerIDController, labelText: 'Existing Customer ID (If applicable)'),
          _buildNameRow(
            'Name*:',
            _namePrefixController,
            _nameFirstNameController,
            _nameMiddleNameController,
            _nameSurnameController,
          ),
          _buildCheckbox('Same as ID Proof', _isSameAsIDProof, (bool? value) {
            setState(() {
              _isSameAsIDProof = value!;
            });
          }),
          _buildTextField(controller: _maidenNameController, labelText: 'Maiden Name'),
          _buildTextField(
            controller: _dobController,
            labelText: 'Date of Birth*',
            readOnly: true,
            onTap: () => _selectDate(context, _dobController),
          ),
          _buildRadioGroup(
            'Gender*',
            ['Male', 'Female', 'Transgender'],
            _selectedGender,
                (String? value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
          _buildRadioGroup(
            'Marital Status*',
            ['Married', 'Unmarried', 'Others'],
            _selectedMaritalStatus,
                (String? value) {
              setState(() {
                _selectedMaritalStatus = value;
              });
            },
          ),
          _buildTextField(controller: _fatherNameController, labelText: 'Name of Father*'),
          _buildTextField(controller: _motherNameController, labelText: 'Name of Mother*'),
          _buildTextField(controller: _spouseNameController, labelText: 'Name of Spouse* (Please Tick One)'),
          _buildInfoText('(Father\'s name is mandatory if PAN is not provided)'),
          _buildTextField(controller: _noOfDependentsController, labelText: 'No. of Dependents'),
          _buildRowOfCheckboxes(
            'Illiterate',
            [
              _buildCheckbox('Yes', _isIlliterateYes, (bool? value) {
                setState(() {
                  _isIlliterateYes = value!;
                  if (value) _isIlliterateNo = false;
                });
              }),
              _buildCheckbox('No', _isIlliterateNo, (bool? value) {
                setState(() {
                  _isIlliterateNo = value!;
                  if (value) _isIlliterateYes = false;
                });
              }),
            ],
          ),
          if (_isIlliterateYes)
            _buildTextField(controller: _identificationMarksController, labelText: 'If yes : Identification Marks :'),
          _buildNameRow(
            'Name of Guardian (In Case of Minor)*',
            _guardianPrefixController,
            _guardianNameController,
            TextEditingController(), // No middle name for guardian in image
            TextEditingController(), // No surname for guardian in image
          ),
          _buildTextField(controller: _relationshipWithGuardianController, labelText: 'Relationship with Guardian'),
          _buildRadioGroup(
            'Nationality*',
            ['In-Indian', 'Others'],
            _selectedNationality,
                (String? value) {
              setState(() {
                _selectedNationality = value;
              });
            },
            additionalWidget: _selectedNationality == 'Others'
                ? Expanded(child: _buildTextField(controller: _countryNameNationalityController, labelText: 'Country Name'))
                : null,
          ),
          _buildRadioGroup(
            'Resident Status',
            ['Resident Individual', 'Non-Resident Indian', 'Foreign national', 'PIO', 'OCI'],
            _selectedResidentStatus,
                (String? value) {
              setState(() {
                _selectedResidentStatus = value;
              });
            },
          ),
          _buildInfoText('(If NRI, please obtain annexure III)'),
          _buildCheckboxGroup(
            'Occupation Type*',
            {
              'S-Service': false, 'Private Sector': false, 'Public Sector': false,
              'Government Sector': false, 'O-Others': false, 'Professional': false,
              'Self employed': false, 'Retired': false, 'House Wife': false,
              'Student': false, 'B-Business': false, 'Agriculture': false,
              'X-Not categorised': false,
            },
            _selectedOccupationTypes,
                (String key, bool? value) {
              setState(() {
                if (value!) {
                  _selectedOccupationTypes.add(key);
                } else {
                  _selectedOccupationTypes.remove(key);
                }
              });
            },
          ),
          _buildTextField(controller: _occupationSpecifyController, labelText: 'X-Not categorised - Please specify'),
          _buildTextField(controller: _monthlyIncomeController, labelText: 'Monthly Income* Rs.'),
          _buildTextField(controller: _netWorthController, labelText: 'Net Worth(approx value) Rs.'),
          _buildRadioGroup(
            'Religion:',
            ['Hindu', 'Muslim', 'Christian', 'Sikh', 'Others'],
            _selectedReligion,
                (String? value) {
              setState(() {
                _selectedReligion = value;
              });
            },
          ),
          _buildRadioGroup(
            'Category:',
            ['General', 'OBC', 'SC', 'ST', 'Minority'],
            _selectedCategory,
                (String? value) {
              setState(() {
                _selectedCategory = value;
              });
            },
          ),
          _buildRadioGroup(
            'Customer Type:',
            ['General', 'Sr.Citizen', 'Pensioner', 'Minor', 'Staff/Ex. Staff', 'Others (Specify)'],
            _selectedCustomerType,
                (String? value) {
              setState(() {
                _selectedCustomerType = value;
              });
            },
          ),
          if (_selectedCustomerType == 'Staff/Ex. Staff')
            _buildTextField(controller: _staffPfNoController, labelText: 'PF No.'),
          if (_selectedCustomerType == 'Others (Specify)')
            _buildTextField(controller: _customerTypeSpecifyController, labelText: 'Specify Customer Type'),
          _buildRowOfCheckboxes(
            'Person with disability:',
            [
              _buildCheckbox('Yes', _isPersonWithDisabilityYes, (bool? value) {
                setState(() {
                  _isPersonWithDisabilityYes = value!;
                  if (value) _isPersonWithDisabilityNo = false;
                });
              }),
              _buildCheckbox('No', _isPersonWithDisabilityNo, (bool? value) {
                setState(() {
                  _isPersonWithDisabilityNo = value!;
                  if (value) {
                    _isPersonWithDisabilityYes = false;
                    _isVisuallyImpaired = false;
                    _isDifferentlyAbled = false;
                  }
                });
              }),
            ],
          ),
          if (_isPersonWithDisabilityYes)
            _buildRowOfCheckboxes(
              'If yes:',
              [
                _buildCheckbox('i. Visually impaired', _isVisuallyImpaired, (bool? value) {
                  setState(() {
                    _isVisuallyImpaired = value!;
                  });
                }),
                _buildCheckbox('ii. Differently abled', _isDifferentlyAbled, (bool? value) {
                  setState(() {
                    _isDifferentlyAbled = value!;
                  });
                }),
              ],
            ),
          _buildCheckboxGroup(
            'Educational Qualification:',
            {
              'Below SSC': false, 'SSC': false, 'HSC': false, 'Graduate': false,
              'Post Graduate': false, 'Professional': false, 'Others': false,
            },
            _selectedEducationalQualifications,
                (String key, bool? value) {
              setState(() {
                if (value!) {
                  _selectedEducationalQualifications.add(key);
                } else {
                  _selectedEducationalQualifications.remove(key);
                }
              });
            },
          ),
          _buildTextField(controller: _organizationNameController, labelText: 'Organization\'s Name'),
          _buildTextField(controller: _designationProfessionController, labelText: 'Designation/Profession'),
          _buildTextField(controller: _natureOfBusinessController, labelText: 'Nature of Business'),
          _buildRadioGroup(
            'Please Tick the Applicable box:',
            ['Politically exposed Person', 'Related to Politically Exposed Person', 'None'],
            _politicallyExposedStatus,
                (String? value) {
              setState(() {
                _politicallyExposedStatus = value;
              });
            },
          ),
          _buildTextField(controller: _countryCodeResidenceController, labelText: 'ISO 3166 Country Code of Jurisdiction of Residence* (Code for India is IN)'),
          _buildTextField(controller: _placeCityOfBirthController, labelText: 'Place/City of Birth*'),
          _buildTextField(controller: _countryCodeBirthController, labelText: 'ISO 3166 Country Code of Birth*'),
          _buildTextField(controller: _citizenshipController, labelText: 'Citizenship'),
          _buildRadioGroup(
            'Country of Tax Residence in India only and not in any other country or territory outside India*',
            ['Yes', 'No'],
            _taxResidenceIndiaOnly,
                (String? value) {
              setState(() {
                _taxResidenceIndiaOnly = value;
              });
            },
          ),
          _buildTextField(controller: _panTinController, labelText: 'PAN/Tax Identification Number or equivalent (If issued by jurisdiction)'),
          _buildCheckbox('(If PAN is not submitted, submit Form 60 - Annexure I)', _isForm60Submitted, (bool? value) {
            setState(() {
              _isForm60Submitted = value!;
            });
          }),
          const SizedBox(height: 20),

          // Section 3: Contact Details
          _buildSectionTitle('3 Contact Details (All communications will be sent on provided Mobile No./Email-ID)'),
          _buildTextField(controller: _mobileNoController, labelText: 'Mobile No. * +91'),
          _buildTextField(controller: _emailIdController, labelText: 'Email ID'),
          _buildTextField(controller: _alternateMobNoController, labelText: 'Alternate Mob. No.'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _telOffController, labelText: 'Tel (Off)')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _telResController, labelText: 'Tel (Res)')),
            ],
          ),
          const SizedBox(height: 20),

          // Section 4: Proof of Identity/Address
          _buildSectionTitle('4 Proof of Identity/Address (Please tick the appropriate Box (any one ID type) and give details)*'),
          _buildCheckboxGroup(
            '', // No specific title for this group
            {
              'A-PASSPORT': false, 'B-VOTER\'S IDENTITY CARD': false, 'C-DRIVING LICENCE': false,
              'D-Proof of possession of AADHAAR': true, // Default checked as per image
              'E-NREGA Job Card': false,
              'F-Letter issued by NATIONAL POPULATION REGISTER containing DETAILS OF NAME & ADDRESS': false,
            },
            _selectedIdProofs,
                (String key, bool? value) {
              setState(() {
                if (value!) {
                  // If single selection, clear others first
                  _selectedIdProofs.clear();
                  _selectedIdProofs.add(key);
                } else {
                  _selectedIdProofs.remove(key);
                }
              });
            },
            isSingleSelection: true, // Only one ID proof can be selected
          ),
          _buildTextField(controller: _documentNoController, labelText: 'Document No/Identification Number*'),
          _buildTextField(
            controller: _issueDateController,
            labelText: 'Issue Date*',
            readOnly: true,
            onTap: () => _selectDate(context, _issueDateController),
          ),
          _buildTextField(
            controller: _expiryDateController,
            labelText: 'Expiry Date (If applicable)*',
            readOnly: true,
            onTap: () => _selectDate(context, _expiryDateController),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // Helper Widgets
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

  Widget _buildNameRow(
      String label,
      TextEditingController prefixController,
      TextEditingController firstNameController,
      TextEditingController middleNameController,
      TextEditingController surnameController) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: 60, // Fixed width for prefix
                child: _buildTextField(controller: prefixController, labelText: 'Prefix'),
              ),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: firstNameController, labelText: 'First Name')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: middleNameController, labelText: 'Middle Name')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: surnameController, labelText: 'Surname')),
            ],
          ),
        ],
      ),
    );
  }
}
