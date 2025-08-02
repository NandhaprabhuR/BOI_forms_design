import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Page3Form extends StatefulWidget {
  const Page3Form({super.key});

  @override
  State<Page3Form> createState() => _Page3FormState();
}

class _Page3FormState extends State<Page3Form> {
  // Top section fields
  final TextEditingController _dateController = TextEditingController(text: DateFormat('ddMMyyyy').format(DateTime.now()));
  final TextEditingController _firstApplicantCustomerIDController = TextEditingController();
  final TextEditingController _secondApplicantCustomerIDController = TextEditingController();
  final TextEditingController _accountNoTopController = TextEditingController(); // Renamed to avoid conflict

  // Section 1: Type of Account
  String? _selectedAccountType = 'SAVINGS BANK ACCOUNT'; // Default as per image
  Set<String> _selectedAccountModes = {}; // For Former or Survivor, Any one or Survivor, Jointly Operated, Other

  // Section 3: Services Required
  bool _atmCumDebitCard = false;
  String? _atmCumDebitCard1stApplicantOption = 'No'; // Changed to String? for radio
  String? _atmCumDebitCard2ndApplicantOption = 'No'; // Changed to String? for radio
  final TextEditingController _atmCardNameController = TextEditingController();
  String? _chequeBookOption = 'No'; // Changed to String? for radio
  String? _smsAlertsOption = 'No'; // Changed to String? for radio
  final TextEditingController _smsAlertsMobileNoController = TextEditingController();
  bool _internetBankingRequired = false;
  String? _internetBanking1stApplicantOption = 'No'; // Changed to String? for radio
  String? _internetBanking2ndApplicantOption = 'No'; // Changed to String? for radio
  String? _phoneBankingOption = 'No'; // Changed to String? for radio
  String? _mobileBankingOption = 'No'; // Changed to String? for radio
  String? _passbookRequiredOption = 'No'; // Changed to String? for radio
  String? _statementOption = 'Not Required'; // Changed to String? for radio

  // Section 4: Fixed Deposit
  Set<String> _selectedFixedDepositTypes = {}; // For multiple selections
  final TextEditingController _fdAmountController = TextEditingController();
  final TextEditingController _fdAmountInWordsController = TextEditingController(); // Added missing field
  final TextEditingController _fdPeriodYearsController = TextEditingController();
  final TextEditingController _fdPeriodMonthsController = TextEditingController();
  final TextEditingController _fdPeriodDaysController = TextEditingController();
  String? _maturityInterestPayableOption = 'Monthly'; // Radio group for interest payable
  Set<String> _maturityInstructions = {}; // For multiple selections
  final TextEditingController _autoRenewalPartAmountController = TextEditingController();
  bool _paymentInstructionByCreditToMyBankAccount = false;
  final TextEditingController _paymentInstructionAccountNoController = TextEditingController();

  // Section 5: Multi-Option Deposit Scheme / Auto Sweep
  bool _termDepositType = false; // Checkbox for Term Deposit
  bool _termDepositReinvestmentType = false; // Checkbox for Term Deposit (Reinvestment)
  final TextEditingController _modPeriodYearsController = TextEditingController();
  final TextEditingController _modPeriodMonthsController = TextEditingController();
  bool _consentForServiceCharges = false; // Checkbox for "I/We hereby give consent for debiting my/our account for recovering service charges"
  bool _consentForAutoSweep = false; // Checkbox for "I/We hereby give consent for debiting my/our Savings Bank/Current Account for creating/AUTO SWEEP"
  final TextEditingController _modLinkedSavingBankCurrentAccountNoController = TextEditingController(); // Changed to TextEditingController
  String? _modUnderReverseSweep = 'Last in first out'; // Default as per image

  // Section 6: Recurring Deposit
  final TextEditingController _rdMonthlyCoreInstallmentController = TextEditingController();
  final TextEditingController _rdMonthlyCoreInstallmentWordsController = TextEditingController();
  final TextEditingController _rdPeriodYearsController = TextEditingController();
  final TextEditingController _rdPeriodMonthsController = TextEditingController();
  bool _rdStandingInstruction = false; // Checkbox for Standing instruction
  final TextEditingController _rdDebitAccountNoController = TextEditingController();
  bool _rdOnMaturityCreditProceeds = false; // Checkbox for On Maturity, credit proceeds
  final TextEditingController _rdMaturityCreditAccountController = TextEditingController();
  final TextEditingController _rdTdsFromController = TextEditingController();


  @override
  void dispose() {
    _dateController.dispose();
    _firstApplicantCustomerIDController.dispose();
    _secondApplicantCustomerIDController.dispose();
    _accountNoTopController.dispose();
    _atmCardNameController.dispose();
    _smsAlertsMobileNoController.dispose();
    _fdAmountController.dispose();
    _fdAmountInWordsController.dispose();
    _fdPeriodYearsController.dispose();
    _fdPeriodMonthsController.dispose();
    _fdPeriodDaysController.dispose();
    _autoRenewalPartAmountController.dispose();
    _paymentInstructionAccountNoController.dispose();
    _modPeriodYearsController.dispose();
    _modPeriodMonthsController.dispose();
    _modLinkedSavingBankCurrentAccountNoController.dispose();
    _rdMonthlyCoreInstallmentController.dispose();
    _rdMonthlyCoreInstallmentWordsController.dispose();
    _rdPeriodYearsController.dispose();
    _rdPeriodMonthsController.dispose();
    _rdDebitAccountNoController.dispose();
    _rdMaturityCreditAccountController.dispose();
    _rdTdsFromController.dispose();
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
          _buildSectionTitle('ACCOUNT OPENING FORM FOR INDIVIDUAL (PART -II)'),
          _buildInfoText('(SAVING BANK, CURRENT ACCOUNT AND TERM DEPOSITS)'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildTextField(
                controller: _dateController,
                labelText: 'Date',
                readOnly: true,
                onTap: () => _selectDate(context, _dateController),
                width: 150, // Smaller width for date field
              ),
            ],
          ),
          _buildInfoText('Fields marked asterisk (*) are mandatory. Please fill up in BLOCK letters only and use black ink for signature.'),
          _buildTextField(controller: _firstApplicantCustomerIDController, labelText: 'First Applicant Customer ID'),
          _buildTextField(controller: _secondApplicantCustomerIDController, labelText: 'Second Applicant Customer ID'),
          _buildTextField(controller: _accountNoTopController, labelText: 'Account No.'),
          const SizedBox(height: 10),

          _buildInfoText('I/We request you to open my/our deposit account with your branch/bank as under: (Tick (✓) relevant type of account)'),
          const SizedBox(height: 20),

          // Section 1: Type of Account
          _buildSectionTitle('1 Type of Account'),
          _buildRadioGroup(
            '',
            ['SAVINGS BANK ACCOUNT', 'BSBDA', 'SMALL ACCOUNT', 'CURRENT ACCOUNT', 'FIXED DEPOSIT/RD', 'CAPS GAIN (SB)'],
            _selectedAccountType,
                (String? value) {
              setState(() {
                _selectedAccountType = value;
              });
            },
            // Adjusted item width to ensure text is not cut off
            itemWidth: MediaQuery.of(context).size.width / 2 - 20,
          ),
          _buildRowOfCheckboxes(
            'Mode of Operation',
            [
              _buildCheckbox('Self / Either or Survivor', _selectedAccountModes.contains('Self / Either or Survivor'), (bool? value) {
                setState(() {
                  if (value!) _selectedAccountModes.add('Self / Either or Survivor'); else _selectedAccountModes.remove('Self / Either or Survivor');
                });
              }),
              _buildCheckbox('Former or Survivor', _selectedAccountModes.contains('Former or Survivor'), (bool? value) {
                setState(() {
                  if (value!) _selectedAccountModes.add('Former or Survivor'); else _selectedAccountModes.remove('Former or Survivor');
                });
              }),
              _buildCheckbox('Any one or Survivor', _selectedAccountModes.contains('Any one or Survivor'), (bool? value) {
                setState(() {
                  if (value!) _selectedAccountModes.add('Any one or Survivor'); else _selectedAccountModes.remove('Any one or Survivor');
                });
              }),
              _buildCheckbox('Jointly Operated', _selectedAccountModes.contains('Jointly Operated'), (bool? value) {
                setState(() {
                  if (value!) _selectedAccountModes.add('Jointly Operated'); else _selectedAccountModes.remove('Jointly Operated');
                });
              }),
              _buildCheckbox('Other', _selectedAccountModes.contains('Other'), (bool? value) {
                setState(() {
                  if (value!) _selectedAccountModes.add('Other'); else _selectedAccountModes.remove('Other');
                });
              }),
            ],
          ),
          const SizedBox(height: 20),

          // Section 3: Services Required
          _buildSectionTitle('3 Services Required'),
          _buildInfoText('1. ATM-CUM-DEBIT CARD'),
          _buildRowOfRadioButtons(
            '',
            [
              _buildRadioOption('1st Applicant', ['Yes', 'No'], _atmCumDebitCard1stApplicantOption, (value) {
                setState(() { _atmCumDebitCard1stApplicantOption = value; });
              }),
              _buildRadioOption('2nd Applicant', ['Yes', 'No'], _atmCumDebitCard2ndApplicantOption, (value) {
                setState(() { _atmCumDebitCard2ndApplicantOption = value; });
              }),
            ],
          ),
          _buildTextField(controller: _atmCardNameController, labelText: 'Name as would appear on the card'),
          _buildInfoText('(Mobile no. is mandatory for services 2 to 8)'),

          _buildInfoText('2. CHEQUE BOOK'),
          _buildRadioGroup(
            '',
            ['Yes', 'No'],
            _chequeBookOption,
                (String? value) {
              setState(() {
                _chequeBookOption = value;
              });
            },
          ),
          _buildInfoText('(Only for Regular SB/Current Accounts/Caps Gain (SB))'),
          _buildInfoText('(Not available for Regular BSBD/Small Accounts)'),

          _buildInfoText('4. SMS ALERTS (Charges Applicable)'),
          _buildRadioGroup(
            '',
            ['Yes', 'No'],
            _smsAlertsOption,
                (String? value) {
              setState(() {
                _smsAlertsOption = value;
              });
            },
          ),
          _buildTextField(controller: _smsAlertsMobileNoController, labelText: 'SMS Alerts on Registered Mobile Number'),

          _buildInfoText('3. INTERNET BANKING REQUIRED'),
          _buildInfoText('Transaction rights required'),
          _buildRowOfRadioButtons(
            '',
            [
              _buildRadioOption('1st Applicant', ['Yes', 'No'], _internetBanking1stApplicantOption, (value) {
                setState(() { _internetBanking1stApplicantOption = value; });
              }),
              _buildRadioOption('2nd Applicant', ['Yes', 'No'], _internetBanking2ndApplicantOption, (value) {
                setState(() { _internetBanking2ndApplicantOption = value; });
              }),
            ],
          ),

          _buildInfoText('5. PHONE BANKING SERVICES'),
          _buildRadioGroup(
            '',
            ['Yes', 'No'],
            _phoneBankingOption,
                (String? value) {
              setState(() {
                _phoneBankingOption = value;
              });
            },
          ),

          _buildInfoText('6. MOBILE BANKING'),
          _buildRadioGroup(
            '',
            ['Yes', 'No'],
            _mobileBankingOption,
                (String? value) {
              setState(() {
                _mobileBankingOption = value;
              });
            },
          ),

          _buildInfoText('7. PASSBOOK REQUIRED'),
          _buildRadioGroup(
            '',
            ['Yes', 'No'],
            _passbookRequiredOption,
                (String? value) {
              setState(() {
                _passbookRequiredOption = value;
              });
            },
          ),
          _buildInfoText('For Savings Bank Account'),

          _buildInfoText('8. e-Statement (at monthly intervals), in lieu of paper copy:'),
          _buildRadioGroup(
            '',
            ['Required', 'Not Required'],
            _statementOption,
                (String? value) {
              setState(() {
                _statementOption = value;
              });
            },
          ),
          _buildInfoText('(Available only for singly operated accounts and joint accounts operated by Either or Survivor mode. In case of accounts operated as Former or Survivor mode (NB facility is available to 1st applicant only)'),
          const SizedBox(height: 20),

          // Section 4: Fixed Deposit
          _buildSectionTitle('4 Fixed Deposit : For the following products/facilities, please furnish options/details:'),
          _buildCheckboxGroup(
            '', // No title for this group of checkboxes
            {
              'Recurring Deposit': false, 'Double Benefit Deposit': false, 'MIC/QIC': false,
              'Short / Fixed Deposit': false, 'Tax Saving Scheme': false, 'Capital Gain (TDR)': false,
            },
            _selectedFixedDepositTypes,
                (String key, bool? value) {
              setState(() {
                if (value!) {
                  _selectedFixedDepositTypes.add(key);
                } else {
                  _selectedFixedDepositTypes.remove(key);
                }
              });
            },
          ),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _fdAmountController, labelText: 'Amount: Rs.')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _fdAmountInWordsController, labelText: 'Rs. (in words)')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _fdPeriodYearsController, labelText: 'Period: _____ Year(s)')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _fdPeriodMonthsController, labelText: '_____ month(s)')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _fdPeriodDaysController, labelText: '_____ days')),
            ],
          ),
          _buildInfoText('In case of Term Deposit, interest payable#:'),
          _buildRadioGroup(
            '',
            ['Monthly', 'Quarterly', 'Calendar Quarter', 'Half Yearly', 'Yearly'],
            _maturityInterestPayableOption,
                (String? value) {
              setState(() {
                _maturityInterestPayableOption = value;
              });
            },
          ),
          _buildInfoText('Maturity Instruction@'),
          _buildCheckboxGroup(
            '', // No title for this group
            {
              'Auto renew* principal & payback interest': false,
              'Auto renew* principal & interest': false,
              'Pay principal & interest': false, // This seems to be a duplicate or misinterpretation in the image
              'Pay principal only': false,
              'Auto Renew* with part amount for Rs.': false,
            },
            _maturityInstructions,
                (String key, bool? value) {
              setState(() {
                if (value!) {
                  _maturityInstructions.add(key);
                } else {
                  _maturityInstructions.remove(key);
                }
              });
            },
          ),
          if (_maturityInstructions.contains('Auto Renew* with part amount for Rs.'))
            _buildTextField(controller: _autoRenewalPartAmountController, labelText: 'Part Amount for Auto Renewal Rs.'),
          _buildInfoText('*Auto Renewal will be for the similar term at the prevailing interest rate on the date of renewal.'),
          _buildInfoText('@# (All Interest payable and Maturity Instructions options will be offered bt all Banks Contact respective Banks for the options available) Proceeds/Residual amount)'),
          _buildInfoText('Payment instruction (Maturity Proceeds/Residual amount):'),
          _buildCheckbox('By credit to my Bank Account No.', _paymentInstructionByCreditToMyBankAccount, (bool? value) {
            setState(() {
              _paymentInstructionByCreditToMyBankAccount = value!;
            });
          }),
          if (_paymentInstructionByCreditToMyBankAccount)
            _buildTextField(controller: _paymentInstructionAccountNoController, labelText: 'Account No.'),
          const SizedBox(height: 20),

          // Section 5: Multi-Option Deposit Scheme / Auto Sweep
          _buildSectionTitle('5 MULTI-OPTION DEPOSIT SCHEME / AUTO SWEEP'),
          _buildRowOfCheckboxes(
            'Type of Deposit',
            [
              _buildCheckbox('Term Deposit', _termDepositType, (bool? value) {
                setState(() {
                  _termDepositType = value!;
                });
              }),
              _buildCheckbox('Term Deposit (Reinvestment)', _termDepositReinvestmentType, (bool? value) {
                setState(() {
                  _termDepositReinvestmentType = value!;
                });
              }),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _modPeriodYearsController, labelText: 'Period of Deposit _____ Year(s)')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _modPeriodMonthsController, labelText: '_____ Months')),
            ],
          ),
          _buildInfoText('I/We hereby give consent for debiting my/our account for recovering service charges as normally applicable to Savings Bank and Current Account.'),
          _buildCheckbox('I/We hereby give consent for debiting my/our Savings Bank/Current Account for creating/AUTO SWEEP as per the Terms and Conditions.', _consentForAutoSweep, (bool? value) {
            setState(() {
              _consentForAutoSweep = value!;
            });
          }),
          _buildTextField(controller: _modLinkedSavingBankCurrentAccountNoController, labelText: 'Linked Saving Bank/Current Account No.'),
          _buildInfoText('Under reverse sweep facility for breaking the MOD to be broken by'),
          _buildRadioGroup(
            '',
            ['Last in first out'], // Only one option visible in the image
            _modUnderReverseSweep,
                (String? value) {
              setState(() {
                _modUnderReverseSweep = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Section 6: Recurring Deposit
          _buildSectionTitle('6 RECURRING DEPOSIT'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _rdMonthlyCoreInstallmentController, labelText: 'Monthly / Core Monthly installment: Rs.')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _rdMonthlyCoreInstallmentWordsController, labelText: '(In words)')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _rdPeriodYearsController, labelText: 'Period: Years')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _rdPeriodMonthsController, labelText: 'Month(s)')),
            ],
          ),
          _buildCheckbox('Standing instruction (if any)', _rdStandingInstruction, (bool? value) {
            setState(() {
              _rdStandingInstruction = value!;
            });
          }),
          if (_rdStandingInstruction)
            _buildTextField(controller: _rdDebitAccountNoController, labelText: 'Debit Account No.'),
          _buildCheckbox('On Maturity, credit proceeds to Account No.', _rdOnMaturityCreditProceeds, (bool? value) {
            setState(() {
              _rdOnMaturityCreditProceeds = value!;
            });
          }),
          if (_rdOnMaturityCreditProceeds)
            _buildTextField(controller: _rdMaturityCreditAccountController, labelText: 'Account No.'),
          _buildInfoText('For the above Term Deposit account, please deduct applicable TDS from'),
          _buildTextField(controller: _rdTdsFromController, labelText: '(SB/CA Account No.)'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Helper Widgets (Copied from page1.dart/page2.dart to make page3.dart self-contained for now)
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
    double? width, // Added width parameter
    bool readOnly = false,
    VoidCallback? onTap,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox( // Wrap in SizedBox to apply width
      width: width,
      child: Padding(
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
      ),
    );
  }

  Widget _buildCheckbox(String title, bool value, ValueChanged<bool?> onChanged) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 20, // Adjusted width for better responsiveness
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

  Widget _buildRadioGroup(String title, List<String> options, String? selectedOption, ValueChanged<String?> onChanged, {Widget? additionalWidget, double? itemWidth}) {
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
                width: itemWidth ?? MediaQuery.of(context).size.width / options.length - 10, // Use itemWidth if provided, else distribute evenly
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
          if (additionalWidget != null) additionalWidget,
        ],
      ),
    );
  }

  // New helper for rows of radio buttons (e.g., 1st Applicant Yes/No)
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
