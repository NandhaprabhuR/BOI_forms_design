// lib/screens/signature_helper.dart

import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Helper class to load signature images for PDF generation
class SignatureHelper {
  /// Load signature image from file path
  /// Returns a PDF Image widget if successful, null otherwise
  static Future<pw.Widget?> loadSignatureFromPath(
    String imagePath, {
    double width = 150,
    double height = 50,
  }) async {
    if (imagePath.isEmpty) {
      print('⚠️ Signature image path is empty');
      return null;
    }

    try {
      print('🔍 Attempting to load signature from: $imagePath');

      final file = File(imagePath);

      // Check if file exists
      final exists = await file.exists();
      print('📁 File exists: $exists');

      if (!exists) {
        print('❌ Signature image not found at: $imagePath');
        print('💡 Make sure the file path is correct and accessible');
        return null;
      }

      // Read file bytes
      print('📖 Reading image bytes...');
      final imageBytes = await file.readAsBytes();
      print('✅ Successfully read ${imageBytes.length} bytes');

      final image = pw.MemoryImage(imageBytes);

      return pw.Container(
        width: width,
        height: height,
        child: pw.Image(image, fit: pw.BoxFit.contain),
      );
    } catch (e) {
      print('❌ Error loading signature image from $imagePath');
      print('❌ Error details: $e');
      return null;
    }
  }

  /// Create a signature box with image or fallback text
  static Future<pw.Widget> buildSignatureBox({
    String? imagePath,
    String? fallbackText,
    String label = 'Signature',
    double width = 150,
    double height = 50,
  }) async {
    pw.Widget? signatureWidget;

    print('🖼️ Building signature box with path: $imagePath');

    // Try to load image first
    if (imagePath != null && imagePath.isNotEmpty) {
      signatureWidget = await loadSignatureFromPath(
        imagePath,
        width: width,
        height: height,
      );

      if (signatureWidget != null) {
        print('✅ Signature image loaded successfully');
      } else {
        print('⚠️ Failed to load signature image, falling back to text');
      }
    }

    // If no image, use text signature
    if (signatureWidget == null &&
        fallbackText != null &&
        fallbackText.isNotEmpty) {
      print('📝 Using text signature: $fallbackText');
      signatureWidget = pw.Center(
        child: pw.Text(
          fallbackText,
          style: pw.TextStyle(fontSize: 20, fontStyle: pw.FontStyle.italic),
        ),
      );
    }

    // If still null, show placeholder
    if (signatureWidget == null) {
      print('⚠️ No signature image or text available, showing placeholder');
      signatureWidget = pw.Center(
        child: pw.Text(
          'Signature',
          style: pw.TextStyle(fontSize: 12, color: PdfColors.grey),
        ),
      );
    }

    return pw.Container(
      width: width,
      height: height,
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.black, width: 0.5),
      ),
      padding: const pw.EdgeInsets.all(4),
      child: signatureWidget,
    );
  }
}
