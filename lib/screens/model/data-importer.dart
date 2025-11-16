// lib/data_importer.dart

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart'; // <--- CHANGED: Import the excel package
import 'package:path_provider/path_provider.dart';
import 'form_data_model.dart'; // Import the model

// Utility function to import data from an Excel file
Future<List<FormDataModel>> importBulkData() async {
  // Use file_picker to let the user select an Excel file
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['xlsx'], // <--- CHANGED: Now looks for .xlsx
  );

  if (result == null || result.files.single.path == null) {
    // User cancelled the picker
    return [];
  }

  try {
    // 1. Read the Excel file bytes
    final file = File(result.files.single.path!);
    var bytes = file.readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    // 2. Get the first sheet from the Excel file
    var sheetName = excel.tables.keys.first;
    var sheet = excel.tables[sheetName];

    if (sheet == null || sheet.rows.length < 2) {
      // File is empty or has only headers
      return [];
    }

    // 3. Extract Headers and Data
    // Get headers from the first row (index 0)
    // We convert each 'Data' cell to a String.
    final headers = sheet.rows[0]
        .map((cell) => cell?.value?.toString() ?? '')
        .toList();

    print('===== EXCEL IMPORT DEBUG =====');
    print('Headers found: $headers');

    List<FormDataModel> modelList = [];

    // 4. Iterate over data rows (starting from index 1)
    for (int i = 1; i < sheet.rows.length; i++) {
      Map<String, dynamic> rowMap = {};
      var row = sheet.rows[i]; // Get the current row

      for (int j = 0; j < headers.length && j < row.length; j++) {
        // Map header to data value
        // Also convert this cell's 'Data' to a String
        rowMap[headers[j]] = row[j]?.value?.toString() ?? '';
      }

      print('Row $i data: $rowMap');

      // 5. Convert the map into your strongly-typed data model
      final model = FormDataModel.fromMap(rowMap);
      print(
        'Converted model - Branch: ${model.branchName}, Name: ${model.customerFirstName}, Mobile: ${model.mobileNo}, Aadhar: ${model.aadharDocNo}',
      );
      modelList.add(model);
    }

    print('Total models created: ${modelList.length}');
    print('===== END DEBUG =====');

    return modelList;
  } catch (e) {
    print("Error importing data from Excel: $e");
    return [];
  }
}

// Utility function to save the PDF to the device (This is unchanged)
Future<void> savePdf(List<int> bytes, String fileName) async {
  final output = await getApplicationDocumentsDirectory();
  final file = File('${output.path}/$fileName.pdf');
  await file.writeAsBytes(bytes);
  print('PDF saved to: ${file.path}');
}
