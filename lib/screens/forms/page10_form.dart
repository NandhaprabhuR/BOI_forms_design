// lib/screens/forms/page10_form.dart

import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/form_data_model.dart';

class Page10Form extends StatefulWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page10Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<Page10Form> createState() => _Page10FormState();
}

class _Page10FormState extends State<Page10Form> {
  // Signature paths for 3 applicants
  String? _signature1Path;
  String? _signature2Path;
  String? _signature3Path;

  @override
  void initState() {
    super.initState();
    _signature1Path = widget.initialData.signature1Text.isNotEmpty ? widget.initialData.signature1Text : null;
    _signature2Path = widget.initialData.signature2Text.isNotEmpty ? widget.initialData.signature2Text : null;
    _signature3Path = widget.initialData.signature3Text.isNotEmpty ? widget.initialData.signature3Text : null;
  }

  void _notifyChange() {
    widget.initialData.signature1Text = _signature1Path ?? '';
    widget.initialData.signature2Text = _signature2Path ?? '';
    widget.initialData.signature3Text = _signature3Path ?? '';
    widget.onDataChanged(widget.initialData);
  }

  Future<void> _pickSignature(int applicantNumber) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      final base64String = 'data:image/png;base64,${base64Encode(bytes)}';

      setState(() {
        switch (applicantNumber) {
          case 1:
            _signature1Path = base64String;
            break;
          case 2:
            _signature2Path = base64String;
            break;
          case 3:
            _signature3Path = base64String;
            break;
        }
        _notifyChange();
      });
    }
  }

  void _clearSignature(int applicantNumber) {
    setState(() {
      switch (applicantNumber) {
        case 1:
          _signature1Path = null;
          break;
        case 2:
          _signature2Path = null;
          break;
        case 3:
          _signature3Path = null;
          break;
      }
      _notifyChange();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              '(Annexure III)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'DECLARATION FROM NRI CUSTOMERS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          // Declaration Text
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'I/We hereby declare that I am/we are non-resident(s) of Indian origin. I/we understand that the account(s) are being opened on the basis of the statements declarations made by me /us and I/we also agree that if any statements / declarations made herein is found to be not correct in material particulars, you are not bound to pay any interest on deposit made by me/us. I/we agree that no claim will be made by me/us for any interest on deposit/s for any period after the date/s maturity of the deposit/s. I/we agree to abide by the provisions of the foreign currency (Non-Resident Account / Non-Resident (external) Account/ Non Resident (Ordinary) account and Resident Foreign Currency account schemes. I/we hereby undertake to intimate you about my/our return to India for permanent residence immediately on arrival. I/we further understand that on my/our return to India my/our intimating you the same, My/our FCNR deposit will be converted into Rupee and thereafter account will be designated as Resident Account and If the deposit is kept for further term, interest will be payable on the Rupee deposit at the rate originally fixed. I/we agree that the premature withdrawal is permitted at my/our request, the payment of the interest on the deposit may be allowed in accordance with the prevailing stipulations laid down by Reserve Bank of India, Bank of India in this regards. I/we further understand that the interest payable on renewals will be at the applicable ruling rates on the date of maturity, and that the deposit receipt will be renewed on my /our presenting the matured receipt on the maturity date. You may at your own option but at my/our risk and responsibility in all respect, appoint an agent, who shall be my /our agent to collect and transmission of any cheque, bills, hundies or other instruments or share certificates or other documents or goods or the instruments received in exchange or payments thereof, and the advices and correspondence relating thereto, whether by post or otherwise and whether by land, sea or air or by telegram or cables shall be entirely at my/our risk and responsibility and any loss, damage or delay however occasioned shall be on my/our account and be wholly borne by me/us.',
              style: TextStyle(fontSize: 11, height: 1.6),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 20),

          // Second paragraph
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'I/we undertake that I/we shall not make available to any person resident in India foreign currency against reimbursement in rupees or any other manner in India. I/we further undertake that in case of debits to the accounts for the purpose of investing in India and credits representing sale proceeds of investments. I/we shall ensure that such investments/ disinvestments would be covered by either general or special permission of Reserve Bank.',
              style: TextStyle(fontSize: 11, height: 1.6),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 30),

          // Signature Section
          const Text(
            'Signatures of Applicants',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: _buildSignatureBox(
                      'Signature of Applicant 1', 1, _signature1Path)),
              const SizedBox(width: 8),
              Expanded(
                  child: _buildSignatureBox(
                      'Signature of Applicant 2', 2, _signature2Path)),
              const SizedBox(width: 8),
              Expanded(
                  child: _buildSignatureBox(
                      'Signature of Applicant 3', 3, _signature3Path)),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSignatureBox(
      String label, int applicantNumber, String? signaturePath) {
    bool isBase64 =
        signaturePath != null && signaturePath.startsWith('data:image');

    return Column(
      children: [
        GestureDetector(
          onTap: () => _pickSignature(applicantNumber),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4),
            ),
            child: signaturePath != null
                ? Stack(
                    children: [
                      Center(
                        child: isBase64
                            ? Image.memory(
                                base64Decode(signaturePath.split(',')[1]),
                                fit: BoxFit.contain,
                              )
                            : (kIsWeb
                                ? Image.network(
                                    signaturePath,
                                    fit: BoxFit.contain,
                                  )
                                : Image.file(
                                    File(signaturePath),
                                    fit: BoxFit.contain,
                                  )),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () => _clearSignature(applicantNumber),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              size: 14,
                              color: Colors.red.shade700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.draw, size: 28, color: Colors.grey.shade400),
                      const SizedBox(height: 4),
                      Text(
                        'Tap to add',
                        style: TextStyle(
                            fontSize: 10, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
