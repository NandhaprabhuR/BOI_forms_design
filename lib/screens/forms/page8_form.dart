// lib/screens/forms/page8_form.dart

import 'package:flutter/material.dart';
import '../model/form_data_model.dart';

class Page8Form extends StatelessWidget {
  final FormDataModel initialData;
  final Function(FormDataModel) onDataChanged;

  const Page8Form({
    Key? key,
    required this.initialData,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Page 8 - Checkboxes Only',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'This page contains only checkboxes and static content in the PDF.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            'No form fields to fill.',
            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
