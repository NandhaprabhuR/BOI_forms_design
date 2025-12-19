// lib/data_importer.dart

import 'dart:io';
import 'dart:typed_data'; // <--- ADDED for web support
import 'dart:convert'; // <--- ADDED for Base64
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart'; // <--- CHANGED: Import the excel package
import 'package:path_provider/path_provider.dart';
import 'form_data_model.dart'; // Import the model

// Utility function to import data from an Excel file
// NOW SUPPORTS WEB!
Future<List<FormDataModel>> importBulkData() async {
  // Use file_picker to let the user select an Excel file
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['xlsx'], // <--- CHANGED: Now looks for .xlsx
  );

  if (result == null) {
    // User cancelled the picker
    return [];
  }

  try {
    // Get bytes - works for both web and mobile
    Uint8List? bytes;

    if (result.files.single.bytes != null) {
      // Web platform - use bytes directly
      bytes = result.files.single.bytes!;
      print('✅ Reading from web (bytes): ${bytes.length} bytes');
    } else if (result.files.single.path != null) {
      // Mobile/Desktop - read from file path
      final file = File(result.files.single.path!);
      bytes = file.readAsBytesSync();
      print('✅ Reading from file path: ${bytes.length} bytes');
    } else {
      print('❌ No bytes or path available');
      return [];
    }

    // Decode Excel file
    var excel = Excel.decodeBytes(bytes);

    // 2. Get the first sheet from the Excel file
    var sheetName = excel.tables.keys.first;
    var sheet = excel.tables[sheetName];

    if (sheet == null || sheet.rows.length < 2) {
      // File is empty or has only headers
      print('⚠️ Excel file is empty or has no data rows');
      return [];
    }

    // 3. Extract Headers and Data
    // Get headers from the first row (index 0)
    // We convert each 'Data' cell to a String.
    final headers = sheet.rows[0]
        .map((cell) => cell?.value?.toString() ?? '')
        .toList();

    print('📋 Excel headers: $headers');

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

      // 5. Convert the map into your strongly-typed data model
      modelList.add(FormDataModel.fromMap(rowMap));
    }

    print('✅ Successfully imported ${modelList.length} records from Excel');
    return modelList;
  } catch (e) {
    print("❌ Error importing data from Excel: $e");
    return [];
  }
}

// Utility function to save the PDF to the device
// Works on mobile/desktop, not on web (web uses browser download)
Future<void> savePdf(List<int> bytes, String fileName) async {
  try {
    final output = await getApplicationDocumentsDirectory();
    final file = File('${output.path}/$fileName.pdf');
    await file.writeAsBytes(bytes);
    print('✅ PDF saved to: ${file.path}');
  } catch (e) {
    print('⚠️ Could not save PDF to file system (normal on web): $e');
  }
}

// NEW: Utility function to pick a signature image and convert to Base64
// This works on ALL platforms (mobile, web, desktop)
Future<String?> pickSignatureImageAsBase64() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.bytes != null) {
      // For web - use bytes directly
      final bytes = result.files.single.bytes!;
      final base64String = base64Encode(bytes);
      print(
        '✅ Signature image converted to Base64: ${base64String.length} characters',
      );
      return base64String;
    } else if (result != null && result.files.single.path != null) {
      // For mobile/desktop - read from file
      final file = File(result.files.single.path!);
      final bytes = await file.readAsBytes();
      final base64String = base64Encode(bytes);
      print(
        '✅ Signature image converted to Base64: ${base64String.length} characters',
      );
      return base64String;
    } else {
      print('❌ No image selected');
      return null;
    }
  } catch (e) {
    print('❌ Error converting signature image to Base64: $e');
    return null;
  }
}

// NEW: Utility function to pick a signature image and get its path
// This version copies the image to permanent storage (for mobile/desktop only)
Future<String?> pickSignatureImage() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      String originalPath = result.files.single.path!;
      print('🔍 Original picked path: $originalPath');

      // Copy the file to permanent app directory
      try {
        final directory = await getApplicationDocumentsDirectory();
        final fileName = result.files.single.name;
        final permanentPath = '${directory.path}/$fileName';

        final originalFile = File(originalPath);
        final newFile = await originalFile.copy(permanentPath);

        print('✅ Signature image copied to permanent storage: $permanentPath');
        return newFile.path;
      } catch (e) {
        print(
          '⚠️ Could not copy to permanent storage, using original path: $e',
        );
        return originalPath;
      }
    } else {
      print('❌ No image selected');
      return null;
    }
  } catch (e) {
    print('❌ Error picking signature image: $e');
    return null;
  }
}
