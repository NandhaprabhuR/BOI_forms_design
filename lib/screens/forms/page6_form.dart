// lib/screens/forms/page6_form.dart

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../model/form_data_model.dart';
import 'form_helper.dart';

class Page6Form extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page6Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page6Form> createState() => _Page6FormState();
}

class _Page6FormState extends State<Page6Form> {
  // Controllers for Acknowledgement DA-1
  late TextEditingController _nomineeNameController;
  late TextEditingController _nomineeAgeController;
  late TextEditingController _nomineeYearsController;
  late TextEditingController _accountNumberController;
  late TextEditingController _registrationNoController;
  late TextEditingController _acknowledgementDateController;

  // Image paths for signatures
  String? _bsbdSignaturePath;
  String? _ackApplicantSignaturePath;
  String? _ackBankOfficialSignaturePath;

  @override
  void initState() {
    super.initState();
    _nomineeNameController = TextEditingController();
    _nomineeAgeController = TextEditingController();
    _nomineeYearsController = TextEditingController();
    _accountNumberController = TextEditingController();
    _registrationNoController = TextEditingController();
    _acknowledgementDateController = TextEditingController();

    FormHelper.addListeners([
      _nomineeNameController,
      _nomineeAgeController,
      _nomineeYearsController,
      _accountNumberController,
      _registrationNoController,
      _acknowledgementDateController,
    ], _notifyChange);
  }

  void _notifyChange() {
    widget.onDataChanged(widget.initialData);
  }

  Future<void> _pickImage(Function(String?) setPath) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        setPath(image.path);
        _notifyChange();
      });
    }
  }

  @override
  void dispose() {
    FormHelper.disposeControllers([
      _nomineeNameController,
      _nomineeAgeController,
      _nomineeYearsController,
      _accountNumberController,
      _registrationNoController,
      _acknowledgementDateController,
    ]);
    super.dispose();
  }

  Widget _buildSignatureBox(
    String label,
    String? imagePath,
    Function(String?) setPath,
  ) {
    return GestureDetector(
      onTap: () => _pickImage(setPath),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.shade50,
        ),
        child: imagePath != null
            ? Stack(
                children: [
                  Center(
                    child: Image.file(File(imagePath), fit: BoxFit.contain),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 16),
                      onPressed: () {
                        setState(() {
                          setPath(null);
                          _notifyChange();
                        });
                      },
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.gesture, color: Colors.grey.shade600),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Tap to add',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue.shade700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

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
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'SAVINGS BANK RULES (ABRIDGED)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          // Know Your Customer Guidelines
          const Text(
            'Know Your Customer Guidelines',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Any person fulfilling account opening requirements may, upon agreeing to comply with the prescribed rules, open a Savings Bank Account, provided she/he furnishes proof of identity and proof of address as required by the Bank.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Nomination & Survivorship Facility
          const Text(
            'Nomination & Survivorship Facility',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'The nomination facility is available on Savings Bank Accounts and the account holders are advised to avail of this facility for smooth settlement of claim by legal heirs in unforeseen circumstances. Nomination can be made in favour of only one nominee. In case they do not wish to make a nomination, the fact should be recorded on the account opening form under their full signature. Joint account with survivorship benefit can be operated by the survivor, in such circumstances.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Types of Accounts, Balance Stipulation & Service Charges
          const Text(
            'Types of Accounts, Balance Stipulation & Service Charges',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'The applicants can open an account either with chequebook facility or without chequebook. The current monthly average balances prescribed for SB accounts and the charges prescribed for non maintenance of minimum balance, are available at the Banks website and Contact Centre. The information can also be obtained from Branches. There is no ceiling on maximum balance in Savings Bank account, except for Minors account.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Minors Accounts
          const Text(
            'Minors Accounts',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Minors who can adhere to uniform signature and are not less than ten years old can open accounts in their single name and joint accounts with their guardians.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // How To Open An Account?
          const Text(
            'How To Open An Account?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'In ordinary course, applicant(s)should attend the Bank personally for completion of formalities for opening the account. They will duly fill in and sign the prescribed application form.Applicant(s) should submit KYC documents, declaration as applicable for RBI/CBDT and two copies of his/her/ their recently taken passport size photographs. Applicants can also apply for opening an account online.Account holders signatures must be legible and well formed. Signatures should not be in capital or block letters. Each account will be given a distinctive account number. While dealing with the Bank,this number should be invariably quoted by the account holder(s). The account holders, in their self-interest, are expected to adhere to uniform signature as per specimen recorded with the Bank while operating the accounts and addressing any correspondence to the Bank.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Pass Book
          const Text(
            'Pass Book',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'The pass book and cheque book supplied to the account holder should be kept in a safe place. The Bank will not be responsible for any loss or incorrect payment attributable to the account holders\' neglect in this regard. For withdrawing cash by means of a withdrawal form, the pass book must be presented. Withdrawals using cheque forms and Debit card can be effected without pass book. Deposits may be made without production of the pass book. Pass book should be got updated regularly. The pass book will be returned to the account holder immediately after completion of the transaction duly updated. In case it is not collected within a weeks time, it will be returned to them by Registered A.D. post/ Courier at their cost.\n\nThe account holders should carefully examine the entries in their pass book and draw the Banks attention to errors or omissions, if any.\n\nDuplicate in lieu of the lost or mutilated pass book may be issued on receipt of a written request from the account holder after necessary enquiries, completion of formalities and recovery of prescribed charges. The current charges prescribed for this are available at the Banks website and Contact Centre. This information can also be obtained from Branches.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Cheque Book
          const Text(
            'Cheque Book',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'The Bank will issue the first cheque book after completion of all formalities with regard to opening of the account. Bank shall issue Cheque Book subject to recovery of charges as applicable. The current charges prescribed for this are available at the Banks website and Contact Centre.This information can also be obtained from Branches.\n\nThe account holders must use only the cheques from the cheque books issued to them by the Bank. The Bank reserves the right to refuse payment of any cheques drawn otherwise. Ordinarily, Bank will not issue more than one cheque book at a time or before exhausting all or nearly all cheque leaves issued previously. Cheques must be written legibly. Stop payment instructions in respect of cheques issued or lost can be registered with the Bank on payment of a prescribed service charge. The current charges prescribed for this are available at the Banks website. This information can also be obtained from Branches.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // General
          const Text(
            'General',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Savings Bank account is essentially a facility to build up savings and hence must not be used as a Current Account. Bank may close an account should it have any reason to believe that the account holder has used her/his account for a purpose for which it is not allowed.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Deposits
          const Text(
            'Deposits',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Free cash deposit transactions in the account will be decided by the Bank from time to time (information available on bank website). No restrictions on cash deposit at Non Home branch. No deposit in cash for less than Rs 10/- will be accepted. Cheques, drafts or other instruments drawn only in favour of the account holder will be accepted for credit of the account. Third party instruments endorsed in favour of the account holder will NOT be accepted. No advance against uncleared instruments will be normally permitted until these are realized. In suitably conducted accounts, immediate credit will be afforded for outstation / local instruments upto the value laid down from time to time. The normal collection and out of pocket charges will be recovered. The service and charges for the are available at the Banks website and Contact Centre. This information can also be obtained from Branches. Overdue interest will be recovered for instruments subsequently returned unpaid.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Withdrawals
          const Text(
            'Withdrawals',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'The account holder can withdraw money personally from her/his ordinary Savings Bank Account by using Banks standard withdrawal form. The pass book must accompany the withdrawal form. The withdrawal form can be used only for receiving payments by the accountholder himself/ herself. ATM cum Debit card can also be used in ATMs for cash withdrawal. The account holder cannot withdraw an amount less than Rs. 50/-. All withdrawals must be in round Rupees only. Third party payments through withdrawal forms are not permitted. A letter of authority as per the prescribed format, along with the pass book holder is with the Bank through an authorized representative to receive payment in case the account holder is unable to attend the Bank to withdraw cash from her/his account. The minimum drawing permitted per cheque form is limited to Rs. 50. The maximum number of free debit entries permitted in an account is 50 per half year other than alternate channels (ATM and POS). Charges as decided by the Bank from time to time thereafter a charge of Rs 10/- or as decided by the Bank from time to time. Charges prescribed for exceeding this limit are available at the Banks website and Contact Centre. This information can also be obtained from Branches. Cash withdrawal can be made from the accounts of the sick, old or incapacitated account holders who are unable to attend the Bank and/or also not able to put their signature or thumb impression for withdrawing cash by completing the laid down formalities.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Overdrafts
          const Text(
            'Overdrafts',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Overdrafts in Savings Bank accounts may be permitted under exceptional circumstances with prior arrangements only. Cheques drawn in excess of the balance in the account will be returned unpaid. Service charge will be recovered each time a cheque is returned unpaid for want of sufficient funds. Charges prescribed for this are available at the Banks website and Contact Centre.This information can also be obtained from Branches.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Inoperative Accounts
          const Text(
            'Inoperative Accounts',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Account holders are advised to operate their accounts regularly. Accounts not operated are classified as Inoperative after the stipulated time period of 24 months since last operation. The current prescribed charges for this are available at the Banks website and Contact Centre. This information can also be obtained from Branches.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Standing Instructions
          const Text(
            'Standing Instructions',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'The account holder can request the Bank for effecting periodical payment of insurance premium, membership fees, etc. by debit to her/ his account on payment of service charges. The current prescribed charges for Standing Instruction are available at the Banks website. This information can also be obtained from Branches.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Payment of Interest
          const Text(
            'Payment of Interest',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'As per RBI guidelines applicable from time to time. Interest will be calculated on a daily product basis. Interest will be credited to the account at quarterly intervals. Interest will be paid only if it works out to Re.1/- or more. There after thirty days and memo will be rounded off to the next higher rupee and anything less will be ignored. In case of accounts frozen by the enforcement authorities, Bank shall continue to credit the interest to the account on a regular basis.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Transfer & Closure Of Account
          const Text(
            'Transfer & Closure Of Account',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Accounts may be transferred between branches of the Bank at the request of the account holder(s). Request for closure of account should state the reason for closure. The pass book must accompany such request. Joint accounts can be closed only at the request of all such joint signatories. Service charge at prescribed rate will be recovered if an account is closed after 14 days upto one year of its opening. The current charges prescribed for this are available at the Bank\'s website. This information can also be obtained from Branches. Accounts can be transferred ONLINE also.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Change in Rules
          const Text(
            'Change in Rules',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'The Bank reserves the right to alter, delete or add to any of these Rules and service charges for which the customer will be duly notified through Bank\'s website and/or branch notice board.',
            style: TextStyle(fontSize: 12, height: 1.5),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),

          // FEATURES OF BSBD ACCOUNT
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border.all(color: Colors.blue.shade700, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'FEATURES OF BSBD ACCOUNT',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            'i. Zero balance – No minimum balance required to be maintained.',
            style: TextStyle(fontSize: 12, height: 1.5),
          ),
          const SizedBox(height: 8),

          const Text(
            'ii. Zero charges – No charges for non-maintenance of minimum balance.',
            style: TextStyle(fontSize: 12, height: 1.5),
          ),
          const SizedBox(height: 8),

          const Text(
            'iii. Withdrawals – Maximum 4 withdrawals per month (including ATM withdrawals) would be permitted.',
            style: TextStyle(fontSize: 12, height: 1.5),
          ),
          const SizedBox(height: 8),

          const Text(
            'iv. Deposits – There will be no restrictions on number of deposits that can be made in a month.',
            style: TextStyle(fontSize: 12, height: 1.5),
          ),
          const SizedBox(height: 8),

          const Text(
            'v. BSBD Account holder will be provided ATM Card free of cost.',
            style: TextStyle(fontSize: 12, height: 1.5),
          ),
          const SizedBox(height: 16),

          // Signature box for BSBD
          const Text(
            'Signature',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          _buildSignatureBox(
            'BSBD Signature',
            _bsbdSignaturePath,
            (path) => _bsbdSignaturePath = path,
          ),
          const SizedBox(height: 24),

          // ACKNOWLEDGEMENT DA-1
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              border: Border.all(color: Colors.orange.shade700, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'ACKNOWLEDGEMENT DA-1',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),

          // Nominee Name
          FormHelper.buildTextField(
            'Name of the Nominee',
            _nomineeNameController,
            maxLines: 1,
          ),
          const SizedBox(height: 12),

          // Age
          FormHelper.buildTextField('Age', _nomineeAgeController, maxLines: 1),
          const SizedBox(height: 12),

          // Years
          FormHelper.buildTextField(
            'Years',
            _nomineeYearsController,
            maxLines: 1,
          ),
          const SizedBox(height: 12),

          // Account Number
          FormHelper.buildTextField(
            'Account Number',
            _accountNumberController,
            maxLines: 1,
          ),
          const SizedBox(height: 12),

          // Registration No
          FormHelper.buildTextField(
            'Registration No',
            _registrationNoController,
            maxLines: 1,
          ),
          const SizedBox(height: 12),

          // Date
          FormHelper.buildTextField(
            'Date',
            _acknowledgementDateController,
            maxLines: 1,
          ),
          const SizedBox(height: 16),

          // Yours faithfully
          const Text(
            'Yours faithfully,',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          _buildSignatureBox(
            'Applicant Signature',
            _ackApplicantSignaturePath,
            (path) => _ackApplicantSignaturePath = path,
          ),
          const SizedBox(height: 16),

          // Bank Official Signature
          const Text(
            'Signature of Bank Official with Seal',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          _buildSignatureBox(
            'Bank Official Signature',
            _ackBankOfficialSignaturePath,
            (path) => _ackBankOfficialSignaturePath = path,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
