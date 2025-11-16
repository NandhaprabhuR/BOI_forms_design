// main.dart

import 'package:boiforms/screens/model/form_data_model.dart';
import 'package:boiforms/screens/pdfdesign1.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Create the default model instance
    final formData = FormDataModel();

    return MaterialApp(
      title: 'Bank of India Account Opening Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      // 2. Pass the data model to the home widget
      home: PdfDesignPage(formData: formData),
    );
  }
}