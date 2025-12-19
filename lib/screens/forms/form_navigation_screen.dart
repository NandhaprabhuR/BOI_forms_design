// lib/screens/forms/form_navigation_screen.dart

import 'package:flutter/material.dart';
import 'package:boiforms/screens/pdfdesign1.dart';
import '../model/form_data_model.dart';
import '../model/data-importer.dart';
import 'page1_form.dart';
import 'page2_form.dart';
import 'page3_form_enhanced.dart';
import 'page4_form.dart';
import 'page5_form.dart';
import 'page6_form.dart';
import 'page7_form.dart';
import 'page8_form.dart';
import 'page9_form.dart';
import 'page10_form.dart';

class FormNavigationScreen extends StatefulWidget {
  const FormNavigationScreen({Key? key}) : super(key: key);

  @override
  State<FormNavigationScreen> createState() => _FormNavigationScreenState();
}

class _FormNavigationScreenState extends State<FormNavigationScreen> {
  int _currentPage = 0;
  FormDataModel _formData = FormDataModel();
  final PageController _pageController = PageController();

  final List<String> _pageTitles = [
    'Part-I: CIF Data',
    'Part-I Continuation',
    'Part-II: Account Opening',
    'Nomination (DA-1)',
    'Page 5',
    'Page 6',
    'Form 60',
    'Page 8',
    'Annexure-2: PEP',
    'Page 10',
  ];

  void _onDataChanged(FormDataModel newData) {
    setState(() {
      _formData = newData;
    });
  }

  void _nextPage() {
    if (_currentPage < 9) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _importFromExcel() async {
    try {
      List<FormDataModel> importedData = await importBulkData();
      if (importedData.isNotEmpty) {
        setState(() {
          _formData = importedData.first;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data imported successfully!')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error importing data: $e')));
      }
    }
  }

  Future<void> _generatePDF() async {
    // Show confirmation dialog
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Generate PDF'),
        content: const Text(
          'You have completed all form pages. Would you like to generate the PDF now?\n\n'
          'You can review and save the PDF in the next screen.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('Generate PDF'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      // Show loading indicator
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Generating PDF...'),
                  ],
                ),
              ),
            ),
          ),
        );
      }

      // Small delay to show loading
      await Future.delayed(const Duration(milliseconds: 500));

      // Close loading dialog
      if (mounted) {
        Navigator.pop(context);
      }

      // Navigate to PDF preview screen
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfDesignPage(
              formData: _formData,
              autoPreview: true, // Automatically show PDF preview
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitles[_currentPage]),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.upload_file),
            onPressed: _importFromExcel,
            tooltip: 'Import from Excel',
          ),
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: _generatePDF,
            tooltip: 'Generate PDF',
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Indicator
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue.shade50,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Page ${_currentPage + 1} of 10',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${((_currentPage + 1) / 10 * 100).toStringAsFixed(0)}% Complete',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (_currentPage + 1) / 10,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ],
            ),
          ),
          // Form Pages
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Page1Form(
                  initialData: _formData,
                  onDataChanged: _onDataChanged,
                ),
                Page2Form(
                  initialData: _formData,
                  onDataChanged: _onDataChanged,
                ),
                Page3FormEnhanced(
                  initialData: _formData,
                  onDataChanged: _onDataChanged,
                ),
                Page4Form(
                  initialData: _formData,
                  onDataChanged: _onDataChanged,
                ),
                Page5Form(
                  initialData: _formData,
                  onDataChanged: _onDataChanged,
                ),
                Page6Form(
                  initialData: _formData,
                  onDataChanged: _onDataChanged,
                ),
                Page7Form(
                  initialData: _formData,
                  onDataChanged: _onDataChanged,
                ),
                Page8Form(
                  initialData: _formData,
                  onDataChanged: _onDataChanged,
                ),
                Page9Form(
                  initialData: _formData,
                  onDataChanged: _onDataChanged,
                ),
                Page10Form(
                  initialData: _formData,
                  onDataChanged: _onDataChanged,
                ),
              ],
            ),
          ),
          // Navigation Buttons
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _currentPage > 0 ? _previousPage : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
                // Page Indicators
                Expanded(
                  child: Center(
                    child: Wrap(
                      spacing: 8,
                      children: List.generate(10, (index) {
                        return Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == _currentPage
                                ? Colors.blue
                                : Colors.grey.shade300,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _currentPage < 9 ? _nextPage : _generatePDF,
                  icon: Icon(
                    _currentPage < 9 ? Icons.arrow_forward : Icons.check,
                  ),
                  label: Text(_currentPage < 9 ? 'Next' : 'Finish'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentPage < 9 ? null : Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
