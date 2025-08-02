import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Page6Form extends StatefulWidget {
  const Page6Form({super.key});

  @override
  State<Page6Form> createState() => _Page6FormState();
}

class _Page6FormState extends State<Page6Form> {
  // ACKNOWLEDGEMENT DA-1 fields
  final TextEditingController _nomineeNameAckController = TextEditingController();
  final TextEditingController _nomineeAgeAckController = TextEditingController();
  final TextEditingController _nomineeYearsAckController = TextEditingController();
  final TextEditingController _accountNumberAckController = TextEditingController();
  final TextEditingController _registrationNoAckController = TextEditingController();
  final TextEditingController _dateAckController = TextEditingController(text: DateFormat('ddMMyyyy').format(DateTime.now()));
  final TextEditingController _bankOfficialSignatureController = TextEditingController();

  @override
  void dispose() {
    _nomineeNameAckController.dispose();
    _nomineeAgeAckController.dispose();
    _nomineeYearsAckController.dispose();
    _accountNumberAckController.dispose();
    _registrationNoAckController.dispose();
    _dateAckController.dispose();
    _bankOfficialSignatureController.dispose();
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
          _buildSectionTitle('SAVINGS BANK RULES (ABRIDGED)'),
          _buildSectionTitle('Know Your Customer Guidelines'),
          _buildInfoText('Any person fulfilling account opening requirements may, upon agreeing to comply with the prescribed rules, open a Savings Bank account, provided she/he furnishes proof of Identity and proof of address as required by the Bank'),
          _buildSectionTitle('Nomination & Survivorship Facility'),
          _buildInfoText('The nomination facility is available on Savings Bank accounts and the account holders are advised to avail of this facility for smooth settlement of claim by legal heirs in unforeseen circumstances. Nomination can be made in favour of only one nominee. In case they do not wish to make a nomination, the fact should be recorded on the account opening form under their full signature. Joint account with survivorship benefit can be operated by the survivor, in such circumstances.'),
          _buildSectionTitle('Types of Accounts, Balance Stipulation & Service Charges'),
          _buildInfoText('The applicants can open an account either with chequebook facility or without chequebook. The current monthly average balances prescribed for SB accounts and the charges prescribed for non maintenance of minimum balance, are available at the Banks website and Contact Centre. The information can also be obtained from Branches. There is no ceiling on maximum balance in Savings Bank Account, except for Minors account.'),
          _buildSectionTitle('Minors Accounts'),
          _buildInfoText('Minors who can adhere to uniform signature and are not less than ten years old can open accounts in their single name. Minors may open joint accounts with their guardians.'),
          _buildSectionTitle('How To Open An Account?'),
          _buildInfoText('In ordinary course, applicant(s) should attend the Bank personally for completion of formalities for opening the account. They will duly fill in and sign the prescribed application form. Applicant(s) should submit KYC documents, declaration as applicable for RBI/CBDT and two copies of his/her their recently taken passport size photographs.'),
          _buildInfoText('Account holders signatures must be legible and well formed. Signatures should not be in capital or block letters. Each account will be given a distinctive account number. While dealing with the Bank,this number should be invariably quoted by the account holder(s). The account holders, in their self-interest, are expected to adhere to uniform signature as per specimen recorded with the Bank while operating the accounts and addressing any correspondence to the Bank'),
          _buildSectionTitle('Pass Book'),
          _buildInfoText('The pass book and cheque book supplied to the account holder should be kept in a safe place. The Bank will not be responsible for any loss or incorrect payment attributable to the pass book/ cheque book neglect in this regard. For withdrawing cash by means of a withdrawal form, the pass book must be presented. Withdrawals using cheque forms and Debit card can be effected without pass book. Deposits may be made without production of the pass book. Pass book should be got updated regularly. The pass book will be returned to the account holder immediately after completion of the transaction duly updated. In case it is not collected within a weeks time, it will be returned to them by Registered A.D. post/Courier at their cost.'),
          _buildInfoText('The account holders should carefully examine the entries in their pass books and draw the Banks attention to errors or omissions, if any.'),
          _buildInfoText('Duplicate in lieu of the lost or mutilated pass book may be issued on receipt of a written request from the account holder after necessary enquiries, completion of formalities and recovery of prescribed charges. The current charges prescribed for this are available at the Banks website and Contact Centre. This information can also be obtained from Branches.'),
          _buildSectionTitle('Cheque Book'),
          _buildInfoText('The Bank will issue the first cheque book after completion of all formalities with regard to opening of the account. Bank shall issue Cheque Book subject to recovery of charges as applicable. The current charges prescribed for this are available at the Banks website and Contact Centre. This information can also be obtained from Branches.'),
          _buildInfoText('The account holders must use only the cheques from the cheque books issued to them by the Bank. The Bank reserves the right to refuse payment of any cheques drawn otherwise. Ordinarily, Bank will not issue more than one cheque book at a time or before exhausting all or nearly all cheque leaves issued previously. Cheques must be written legibly. Stop payment instructions in respect of cheques issued or lost can be registered with the Bank on payment of a prescribed service charge. The current charges prescribed for this is available at the Banks website. This information can also be obtained from Branches.'),
          _buildSectionTitle('General'),
          _buildInfoText('Savings Bank account is essentially a facility to build up savings and hence must not be used as a Current Account. Bank may close an account should it have any reason to believe that the account holder has used her/his account for a purpose for which it is not allowed.'),
          _buildSectionTitle('Deposits'),
          _buildInfoText('Free cash deposit transaction in the account will be decided by the Bank from time to time (information available on bank website). No restrictions on cash deposit at Non Home branch. No deposit in cash for less than Rs. 10/- will be accepted. Cheques, drafts or other instruments drawn only in favour of the account holder will be accepted for credit of the account. Third party instruments endorsed in favour of the account holder will NOT be accepted. No drawings against accepted instruments will be normally permitted until these are realized. In satisfactorily conducted accounts, immediate credit will be afforded for outstation/local instruments upto the value laid down from time to time. The normal collection and out of pocket charges will be recovered. The current limit and charges prescribed for this are available at the Banks website and Contact Centre. This information can also be obtained from Branches. Overdue interest will be recovered for instruments subsequently returned unpaid.'),
          _buildSectionTitle('Withdrawals'),
          _buildInfoText('The account holder can withdraw money personally from her/his ordinary Savings Bank Account by using Banks standard withdrawal form. The pass book must accompany the withdrawal form. The withdrawal form can be used only for receiving payments by the account holder himself/herself. ATM cum Debit card can also be used in ATMs for cash withdrawal. The account holder cannot withdraw an amount less than Rs. 50/-. All withdrawals must be in round Rupees only. Third party payments through withdrawal forms are not permitted. A letter of authority as per the prescribed format, along with the pass book should be sent to the Bank through an authorized representative to receive payment. In case the account holder is unable to attend personally to withdraw cash from her/his account. The minimum drawing permitted per cheque form is limited to Rs. 50/-. The maximum number of free debit entries permitted in an account is 50 per half year other than alternate deliver channel or fixed from time to time thereafter a charge of Rs.10/- per entry or as decided by Bank time to time. Charges prescribed for exceeding this limit are available at the Banks website and Contact Centre. This information can also be obtained from Branches. Cash withdrawal can be made from the accounts of the sick, old or incapacitated account holders who are unable to attend the Bank and/or not able to put their signature or thumb impression for withdrawing cash by completing the laid down formalities.'),
          _buildSectionTitle('Overdrafts'),
          _buildInfoText('Overdrafts in Savings Bank accounts may be permitted under exceptional circumstances with prior arrangements only. Cheques drawn in excess of the balance in the account will be returned unpaid. Service charge will be recovered each time a cheque is returned unpaid for want of sufficient funds. Charges prescribed for this are available at the Banks website and Contact Centre. This information can also be obtained from Branches.'),
          _buildSectionTitle('Inoperative Accounts'),
          _buildInfoText('Account holders are advised to operate their accounts regularly. Accounts not operated are classified as inoperative after the stipulated time period of 24 months since last operation. The current prescribed charges in this regard are available at the Banks website and Contact Centre. This information can also be obtained from Branches.'),
          _buildSectionTitle('Standing Instructions'),
          _buildInfoText('The account holder can request the Bank for effecting periodical payment of insurance premium, membership fees, etc. by debit to her/his account on payment of service charges. The current prescribed charges for Standing Instruction are available at the Banks website and Contact Centre. This information can also be obtained from Branches.'),
          _buildSectionTitle('Payment of Interest'),
          _buildInfoText('As per RBI guidelines applicable from time to time. Interest will be calculated on a daily product basis. Interest will be credited to the account at quarterly intervals. Interest will be paid only if it works out to Re 1/- or more. There after fifty paise and more will be ignored. In case of accounts frozen by the enforcement authorities, Bank shall continue to credit the interest to the account on a regular basis.'),
          _buildSectionTitle('Transfer & Closure of Account'),
          _buildInfoText('Accounts may be transferred between Branches of the Bank at the request of the account holder(s). Request for closure of account should state the reason for closure. The pass book must accompany such request. Joint accounts can be closed only at the request of all such joint signatories. Service charge at prescribed rate will be recovered if an account is closed after 14 days upto one year of its opening. The current charges prescribed for this are available at the Banks website. This information can also be obtained from Branches. Account can be transferred ONLINE also.'),
          _buildSectionTitle('Change In Rules'),
          _buildInfoText('The Bank reserves the right to alter, delete or add to any of these Rules and service charges for which the customer will be duly notified through Bank\'s website and/or branch notice board.'),
          _buildSectionTitle('Features of BSBD account'),
          _buildInfoText('i. The deposit of cash at bank branch as well as ATMs/CDMs, issue of Cheque Books'),
          _buildInfoText('ii. Receipt / credit of money through any electronic channel or by means of deposit / collection of cheques drawn by Central / State Government agencies and departments.'),
          _buildInfoText('iii. No limit on number and value of deposits that can be made in month.'),
          _buildInfoText('iv. Maximum 4 withdrawals including ATM withdrawals'),
          _buildInfoText('v. ATM Card or ATM cum Debit Card'),
          const SizedBox(height: 20),

          _buildSectionTitle('ACKNOWLEDGEMENT DA-1'),
          _buildInfoText('We acknowledge receipt of nomination made by you in favour of:'),
          Row(
            children: [
              Expanded(child: _buildTextField(controller: _nomineeNameAckController, labelText: 'Name of the Nominee')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _nomineeAgeAckController, labelText: 'Age: _____')),
              const SizedBox(width: 10),
              Expanded(child: _buildTextField(controller: _nomineeYearsAckController, labelText: 'Years: _____')),
            ],
          ),
          _buildTextField(controller: _accountNumberAckController, labelText: 'With respect to your Account Number'),
          _buildTextField(controller: _registrationNoAckController, labelText: 'Registration No.'),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _dateAckController,
                  labelText: 'Date:',
                  readOnly: true,
                  onTap: () => _selectDate(context, _dateAckController),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(child: _buildInfoText('Yours Faithfully')),
            ],
          ),
          _buildTextField(controller: _bankOfficialSignatureController, labelText: 'Signature of Bank Official with Seal'),
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
