// lib/data/data_importer.dart

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'form_data_model.dart';

// IMPORTANT: Define the column headers expected in your Excel/CSV file.
// These must match the keys used in FormDataModel.fromMap.
const List<String> EXPECTED_HEADERS = [
  'Branch Name', 'Customer First Name', 'Mobile No.', 'Aadhar No.',
  // Add all ~25 keys matching your FormDataModel fields here
];

Future<List<FormDataModel>> importBulkData() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['csv'], // We target CSV files exported from Excel
  );

  if (result == null || result.files.single.path == null) {
    // User cancelled the picker
    return [];
  }

  // 1. Read the CSV file content as a string
  final file = File(result.files.single.path!);
  final csvString = await file.readAsString();

  // 2. Parse the CSV data
  List<List<dynamic>> rowsAsList = const CsvToListConverter().convert(csvString);

  if (rowsAsList.isEmpty || rowsAsList.length < 2) {
    // File is empty or has only headers
    return [];
  }

  // 3. Extract Headers (assuming the first row is the header)
  final headers = rowsAsList[0].map((e) => e.toString()).toList();
  // Quick validation can be added here: if (!headers.containsAll(EXPECTED_HEADERS)) throw error.

  List<FormDataModel> modelList = [];

  // 4. Iterate over data rows (starting from index 1)
  for (int i = 1; i < rowsAsList.length; i++) {
    Map<String, dynamic> rowMap = {};
    for (int j = 0; j < headers.length; j++) {
      rowMap[headers[j]] = rowsAsList[i][j].toString(); // Map header to data value
    }
    // 5. Convert the map into your strongly-typed data model
    modelList.add(FormDataModel.fromMap(rowMap));
  }

  return modelList;
}