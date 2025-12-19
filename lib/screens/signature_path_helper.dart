// lib/screens/signature_path_helper.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/data-importer.dart';

class SignaturePathHelper extends StatefulWidget {
  const SignaturePathHelper({super.key});

  @override
  State<SignaturePathHelper> createState() => _SignaturePathHelperState();
}

class _SignaturePathHelperState extends State<SignaturePathHelper> {
  String? signature1Path;
  String? signature2Path;
  String? signature1Base64;
  String? signature2Base64;
  bool useBase64 = true; // Default to Base64 for cross-platform

  Future<void> _pickSignature(int signatureNumber) async {
    if (useBase64) {
      // Pick and convert to Base64 (works on all platforms)
      String? base64 = await pickSignatureImageAsBase64();
      if (base64 != null) {
        setState(() {
          if (signatureNumber == 1) {
            signature1Base64 = base64;
            signature1Path = null;
          } else {
            signature2Base64 = base64;
            signature2Path = null;
          }
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Signature $signatureNumber converted to Base64!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      // Pick as file path (mobile/desktop only)
      String? path = await pickSignatureImage();
      if (path != null) {
        setState(() {
          if (signatureNumber == 1) {
            signature1Path = path;
            signature1Base64 = null;
          } else {
            signature2Path = path;
            signature2Base64 = null;
          }
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Signature $signatureNumber path obtained!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  void _copyToClipboard(String? path) {
    if (path != null) {
      Clipboard.setData(ClipboardData(text: path));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('📋 Path copied to clipboard!'),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Widget _buildPathCard(
    String title,
    String? path,
    String? base64Data,
    int signatureNumber,
  ) {
    final displayData = useBase64 ? base64Data : path;
    final dataType = useBase64 ? 'Base64' : 'Path';

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _pickSignature(signatureNumber),
                  icon: const Icon(Icons.image),
                  label: const Text('Pick Image'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (displayData != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[400]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$dataType:',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      constraints: const BoxConstraints(maxHeight: 100),
                      child: SingleChildScrollView(
                        child: SelectableText(
                          displayData,
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () => _copyToClipboard(displayData),
                icon: const Icon(Icons.copy),
                label: Text('Copy $dataType'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ] else
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: const Center(
                  child: Text(
                    'No image selected yet',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Signature Paths'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '📝 Instructions:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1. Tap "Pick Image" button\n'
                      '2. Select your signature image\n'
                      '3. Tap "Copy Path" button\n'
                      '4. Paste the path into your Excel file\n'
                      '   under "signature1Text" or "signature2Text" column',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildPathCard('Signature 1', signature1Path, signature1Base64, 1),
            _buildPathCard('Signature 2', signature2Path, signature2Base64, 2),
            const SizedBox(height: 24),
            const Card(
              color: Colors.orange,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Example Path:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      '/storage/emulated/0/Pictures/signature.jpg',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'monospace',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
