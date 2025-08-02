import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class Page9Form extends StatefulWidget {
  const Page9Form({super.key});

  @override
  State<Page9Form> createState() => _Page9FormState();
}

class _Page9FormState extends State<Page9Form> {
  // Details of Related Person (To be filled for minor) fields
  final TextEditingController _relatedCustomerIDController = TextEditingController();
  final TextEditingController _relatedAccountNoController = TextEditingController();
  final TextEditingController _relatedCKYCNoController = TextEditingController();
  final TextEditingController _relatedPrefixController = TextEditingController();
  final TextEditingController _relatedFirstNameController = TextEditingController(text: 'KANAGARAJ');
  final TextEditingController _relatedMiddleNameController = TextEditingController();
  final TextEditingController _relatedSurnameController = TextEditingController();
  bool _addRelatedPerson = false;
  bool _deleteRelatedPerson = false;
  bool _guardianOfMinor = false;
  bool _assignee = false;
  bool _authorisedRepresentative = false;
  final TextEditingController _relatedPersonPrefixController = TextEditingController(text: 'Mr');
  final TextEditingController _relatedPersonFirstNameController = TextEditingController(text: 'KANAGARAJ');
  final TextEditingController _relatedPersonMiddleNameController = TextEditingController();
  final TextEditingController _relatedPersonSurnameController = TextEditingController();
  Set<String> _relatedPersonIdProofs = {}; // For POI of Related Person
  final TextEditingController _relatedPersonDocNoController = TextEditingController(text: '2222222222');
  final TextEditingController _relatedPersonIssueDateController = TextEditingController();
  final TextEditingController _relatedPersonExpiryDateController = TextEditingController();
  final TextEditingController _relatedPersonRemarksController = TextEditingController();

  // FATCA Declaration Form fields
  final TextEditingController _customerIDFATCAController = TextEditingController();
  final TextEditingController _accountNoFATCAController = TextEditingController();
  final TextEditingController _ckycNoFATCAController = TextEditingController();
  final TextEditingController _prefixFATCAController = TextEditingController(); // Added for FATCA Name row
  final TextEditingController _firstNameFATCAController = TextEditingController();
  final TextEditingController _middleNameFATCAController = TextEditingController();
  final TextEditingController _surnameFATCAController = TextEditingController();
  String? _citizenship = 'IN-India'; // Radio group for citizenship
  final TextEditingController _countryNameController = TextEditingController();
  final TextEditingController _placeCityOfBirthController = TextEditingController();
  final TextEditingController _countryOfBirthController = TextEditingController();
  final TextEditingController _addressFATCAController = TextEditingController();
  final TextEditingController _cityVillageFATCAController = TextEditingController();
  final TextEditingController _stateFATCAController = TextEditingController();
  final TextEditingController _districtFATCAController = TextEditingController();
  final TextEditingController _pinFATCAController = TextEditingController();

  // Address for Tax Purposes (outside India) fields
  final TextEditingController _addressForeignController = TextEditingController();
  final TextEditingController _cityVillageForeignController = TextEditingController();
  final TextEditingController _subDistrictForeignController = TextEditingController();
  final TextEditingController _countryNameForeignController = TextEditingController();
  final TextEditingController _districtForeignController = TextEditingController();
  final TextEditingController _stateForeignController = TextEditingController();
  final TextEditingController _zipPostCodeForeignController = TextEditingController();
  final TextEditingController _placeForeignController = TextEditingController();
  final TextEditingController _dateForeignController = TextEditingController();

  // For the table within FATCA Declaration Form
  final List<Map<String, TextEditingController>> _taxResidencyDetails = [
    {'country': TextEditingController(), 'taxId': TextEditingController(), 'idType': TextEditingController()},
    {'country': TextEditingController(), 'taxId': TextEditingController(), 'idType': TextEditingController()},
    {'country': TextEditingController(), 'taxId': TextEditingController(), 'idType': TextEditingController()},
  ];

  @override
  void dispose() {
    // Dispose for Related Person fields
    _relatedCustomerIDController.dispose();
    _relatedAccountNoController.dispose();
    _relatedCKYCNoController.dispose();
    _relatedPrefixController.dispose();
    _relatedFirstNameController.dispose();
    _relatedMiddleNameController.dispose();
    _relatedSurnameController.dispose();
    _relatedPersonPrefixController.dispose();
    _relatedPersonFirstNameController.dispose();
    _relatedPersonMiddleNameController.dispose();
    _relatedPersonSurnameController.dispose();
    _relatedPersonDocNoController.dispose();
    _relatedPersonIssueDateController.dispose();
    _relatedPersonExpiryDateController.dispose();
    _relatedPersonRemarksController.dispose();

    // Dispose for FATCA Declaration Form fields
    _customerIDFATCAController.dispose();
    _accountNoFATCAController.dispose();
    _ckycNoFATCAController.dispose();
    _prefixFATCAController.dispose(); // Dispose the new controller
    _firstNameFATCAController.dispose();
    _middleNameFATCAController.dispose();
    _surnameFATCAController.dispose();
    _countryNameController.dispose();
    _placeCityOfBirthController.dispose();
    _countryOfBirthController.dispose();
    _addressFATCAController.dispose();
    _cityVillageFATCAController.dispose();
    _stateFATCAController.dispose();
    _districtFATCAController.dispose();
    _pinFATCAController.dispose();

    // Dispose for Address for Tax Purposes fields
    _addressForeignController.dispose();
    _cityVillageForeignController.dispose();
    _subDistrictForeignController.dispose();
    _countryNameForeignController.dispose();
    _districtForeignController.dispose();
    _stateForeignController.dispose();
    _zipPostCodeForeignController.dispose();
    _placeForeignController.dispose();
    _dateForeignController.dispose();

    // Dispose for Tax Residency Table controllers
    for (var row in _taxResidencyDetails) {
      row['country']!.dispose();
      row['taxId']!.dispose();
      row['idType']!.dispose();
    }
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
        controller.text = DateFormat('dd.MM.yyyy').format(picked);
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
          _buildSectionTitle('Annexure-2'),
          _buildSectionTitle('Details of Related Person (To be filled for minor)'),
          _buildInfoRow(
            'Customer ID:',
            _relatedCustomerIDController,
            'Account No.:',
            _relatedAccountNoController,
            'CKYC No.:',
            _relatedCKYCNoController,
          ),
          _buildNameRow(
            'Name:',
            _relatedPrefixController,
            _relatedFirstNameController,
            _relatedMiddleNameController,
            _relatedSurnameController,
          ),
          _buildRowOfCheckboxes(
            'KYC of Related Person (If Available)*',
            [
              _buildCheckbox('Addition of Related Person', _addRelatedPerson, (bool? value) {
                setState(() {
                  _addRelatedPerson = value!;
                  if (value) _deleteRelatedPerson = false;
                });
              }),
              _buildCheckbox('Deletion of Related Person', _deleteRelatedPerson, (bool? value) {
                setState(() {
                  _deleteRelatedPerson = value!;
                  if (value) _addRelatedPerson = false;
                });
              }),
            ],
          ),
          _buildRowOfCheckboxes(
            'Related Person type*',
            [
              _buildCheckbox('Guardian of Minor', _guardianOfMinor, (bool? value) {
                setState(() {
                  _guardianOfMinor = value!;
                  if (value) {
                    _assignee = false;
                    _authorisedRepresentative = false;
                  }
                });
              }),
              _buildCheckbox('Assignee', _assignee, (bool? value) {
                setState(() {
                  _assignee = value!;
                  if (value) {
                    _guardianOfMinor = false;
                    _authorisedRepresentative = false;
                  }
                });
              }),
              _buildCheckbox('Authorised Representative', _authorisedRepresentative, (bool? value) {
                setState(() {
                  _authorisedRepresentative = value!;
                  if (value) {
                    _guardianOfMinor = false;
                    _assignee = false;
                  }
                });
              }),
            ],
          ),
          _buildNameRow(
            'Name*:',
            _relatedPersonPrefixController,
            _relatedPersonFirstNameController,
            _relatedPersonMiddleNameController,
            _relatedPersonSurnameController,
          ),
          _buildInfoText('(If KYC Number and name are provided, below details are optional)'),
          _buildSectionTitle('PROOF OF IDENTITY(POI) OF RELATED PERSON*'),
          _buildCheckboxGroup(
            '', // No specific title for this group
            {
              'A-PASSPORT': false, 'B-VOTER\'S IDENTITY CARD': false, 'C-DRIVING LICENCE': false,
              'D-UID(AADHAR)': true, // Default checked as per image
              'E-NREGA JOB CARD': false,
              'F-LETTER ISSUED BY NATIONAL POPULATION REGISTER CONTAINING DETAILS OF NAME & ADDRESS': false,
              'G-OTHERS (Any Document notified by the Central Government/RBI)': false,
            },
            _relatedPersonIdProofs,
                (String key, bool? value) {
              setState(() {
                if (value!) {
                  // Single selection logic for these POI types
                  _relatedPersonIdProofs.clear();
                  _relatedPersonIdProofs.add(key);
                } else {
                  _relatedPersonIdProofs.remove(key);
                }
              });
            },
            isSingleSelection: true,
          ),
          _buildTextField(controller: _relatedPersonDocNoController, labelText: 'Document No/Identification Number*'),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _relatedPersonIssueDateController,
                  labelText: 'Issue date:*',
                  readOnly: true,
                  onTap: () => _selectDate(context, _relatedPersonIssueDateController),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTextField(
                  controller: _relatedPersonExpiryDateController,
                  labelText: 'Expiry Date(If Applicable):*',
                  readOnly: true,
                  onTap: () => _selectDate(context, _relatedPersonExpiryDateController),
                ),
              ),
            ],
          ),
          _buildTextField(controller: _relatedPersonRemarksController, labelText: 'Remarks'),
          const SizedBox(height: 20),

          // FATCA Declaration Form
          _buildSectionTitle('FATCA Declaration Form'),
          _buildInfoRow(
            'Customer ID:',
            _customerIDFATCAController,
            'Account No.:',
            _accountNoFATCAController,
            'CKYC No.:',
            _ckycNoFATCAController,
          ),
          _buildNameRow( // Fixed: Added _prefixFATCAController
            'Name:',
            _prefixFATCAController,
            _firstNameFATCAController,
            _middleNameFATCAController,
            _surnameFATCAController,
          ),
          _buildRadioGroup(
            'Citizenship*',
            ['IN-India', 'Others'],
            _citizenship,
                (String? value) {
              setState(() {
                _citizenship = value;
              });
            },
            additionalWidget: _citizenship == 'Others'
                ? Expanded(child: _buildTextField(controller: _countryNameController, labelText: 'Country Name'))
                : null,
          ),
          _buildTextField(controller: _placeCityOfBirthController, labelText: 'Place/City of Birth*'),
          _buildTextField(controller: _countryOfBirthController, labelText: 'Country of Birth*'),
          _buildTextField(controller: _addressFATCAController, labelText: 'Address*'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _cityVillageFATCAController, labelText: 'City/Village*')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _districtFATCAController, labelText: 'District*')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _stateFATCAController, labelText: 'State*')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _pinFATCAController, labelText: 'Pin*')),
            ],
          ),
          const SizedBox(height: 15),
          _buildInfoText('Multiple Tax Residency: Details of Country of Tax Residency in India, and/or in USA@ And /or in any other Country or Territory Outside India as Under:'),
          _buildTaxResidencyTable(),
          _buildSmallInfoText('# In case, country of tax residence is Indian, PAN is treated as TIN'),
          _buildSmallInfoText('@ A citizen of US including individual born in US but resident in another country (who has not given up US citizenship'),
          _buildSmallInfoText('* A person residing in US including US green card holder'),
          _buildSmallInfoText('* Certain persons who spend more than 180 days in US each year'),
          const SizedBox(height: 20),

          _buildSectionTitle('Address in the Jurisdiction/Country -where the Applicant is Resident outside India for Tax Purposes'),
          _buildTextField(controller: _addressForeignController, labelText: 'Address*'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _cityVillageForeignController, labelText: 'City/Village*')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _districtForeignController, labelText: 'District*')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _subDistrictForeignController, labelText: 'Sub-District:')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _stateForeignController, labelText: 'State*')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _countryNameForeignController, labelText: 'Country Name*')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _zipPostCodeForeignController, labelText: 'ZIP/Post Code*')),
            ],
          ),
          _buildTextField(controller: _placeForeignController, labelText: 'Place:'),
          _buildTextField(
            controller: _dateForeignController,
            labelText: 'Date:',
            readOnly: true,
            onTap: () => _selectDate(context, _dateForeignController),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 80,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(child: Text('Signature/thumb impression of the Applicant/Applicants')),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
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

  Widget _buildSmallInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 4.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 10, fontStyle: FontStyle.italic, color: Colors.grey),
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

  Widget _buildInfoRow(
      String label1, TextEditingController controller1,
      String label2, TextEditingController controller2,
      String label3, TextEditingController controller3) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: _buildTextField(controller: controller1, labelText: label1),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildTextField(controller: controller2, labelText: label2),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildTextField(controller: controller3, labelText: label3),
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

  Widget _buildRadioGroup(
      String title, List<String> options, String? selectedOption, ValueChanged<String?> onChanged,
      {Widget? additionalWidget}) {
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

  Widget _buildTaxResidencyTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: const {
        0: FlexColumnWidth(1.5), // Country of Tax Residence#
        1: FlexColumnWidth(2),  // Tax Identification number or equivalent if issued by jurisdiction
        2: FlexColumnWidth(1.5), // Identification type (TIN or Other, please specify)
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.blue[100]),
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Country of Tax Residence#', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Tax Identification number or equivalent if issued by jurisdiction', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Identification type (TIN or Other, please specify)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ],
        ),
        ..._taxResidencyDetails.map((rowControllers) {
          return TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: _buildTextField(controller: rowControllers['country']!, labelText: ''),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: _buildTextField(controller: rowControllers['taxId']!, labelText: ''),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: _buildTextField(controller: rowControllers['idType']!, labelText: ''),
              ),
            ],
          );
        }).toList(),
      ],
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
