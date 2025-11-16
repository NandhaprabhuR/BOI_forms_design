// lib/screens/pdfdesign10.dart

import 'dart:io';
import 'package:flutter/services.dart'; // Required for rootBundle
import 'package:path_provider/path_provider.dart'; // Add path_provider to your pubspec.yaml
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'model/form_data_model.dart'; // <--- ADDED: Import the data model

// -------------------------------------------------------------------
// NEW: Function to generate and save the PDF for this specific page.
// -------------------------------------------------------------------
/// Generates a PDF of the NRI Declaration page with a footer and saves it.
Future<File> generateTenthPagePdf(FormDataModel data) async { // <--- MODIFIED: Accepts data
  final doc = pw.Document();

  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,

      // The build method now uses the existing form builder function.
      build: (pw.Context context) => [
        _buildNriDeclarationForm(data), // <--- MODIFIED: Passes data
      ],

      // The footer is added here, at the document/page level.
      footer: (pw.Context context) {
        return pw.Column(
          mainAxisSize: pw.MainAxisSize.min,
          children: [
            pw.Divider(color: PdfColors.grey600, height: 1),
            pw.Container(
              alignment: pw.Alignment.center,
              margin: const pw.EdgeInsets.only(top: 8.0),
              child: pw.Text(
                // This dynamically gets the current page number.
                // In this single-page example, it will be '1'.
                '${context.pageNumber}',
                style: const pw.TextStyle(
                  fontSize: 10,
                  color: PdfColors.black,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );

  // Saves the document to the device.
  final output = await getApplicationDocumentsDirectory();
  final file = File('${output.path}/nri_declaration.pdf');
  await file.writeAsBytes(await doc.save());

  print('PDF saved to: ${file.path}');
  return file;
}


// -------------------------------------------------------------------
// UNCHANGED: The existing code to build the page's content.
// -------------------------------------------------------------------

/// Builds the tenth page of the document (Annexure III - NRI Declaration).
pw.Widget buildTenthPage(FormDataModel data) { // <--- MODIFIED: Accepts data
  // The main builder function simply returns the fully constructed form.
  return _buildNriDeclarationForm(data); // <--- MODIFIED: Passes data
}

/// Builds the entire NRI Declaration Form, including the border, text, and signature boxes.
pw.Widget _buildNriDeclarationForm(FormDataModel data) { // <--- MODIFIED: Accepts data
  const double headingFontSize = 12;
  const double bodyFontSize = 10.5;
  const double annexureFontSize = 11;
  const double signatureLabelFontSize = 9;

  // The main declaration text from the first image.
  const String declarationText =
      'I/We hereby declare that I am/we are non-resident(s) of Indian origin. I/we understand that the account(s) are being opened on the basis of the statements declarations made by me/us and I/we also agree that if any statements / declarations made herein is found to be not correct in material particulars, you are not bound to pay any interest on deposit made by me/us. I/we agree that no claim will be made by me/us for any interest on deposit/s for any period after the date/s maturity of the deposit/s. I/we agree to abide by the provisions of the foreign currency (Non-Resident Account / Non-Resident (external) Account/ Non Resident (Ordinary) account and Resident Foreign Currency account schemes. I/We hereby undertake to intimate you about my/our return to India for permanent residence immediately on arrival. I/we further understand that on my/our return to India my/our intimating you the same, My/our FCNR deposit will be converted into Rupee and thereafter account will be designated as Resident Account and if the deposit is kept for further term, interest will be payable on the Rupee deposit at the rate originally fixed. I/we agree that the premature withdrawal is permitted at my/our request, the payment of the interest on the deposit may be allowed in accordance with the prevailing stipulations laid down by Reserve Bank of India, Bank of India in this regards. I/we further understand that the interest payable on renewals will be at the applicable ruling rates on the date of maturity, and that the deposit receipt will be renewed on my /our presenting the matured receipt on the maturity date. You may at your own option but at my/our risk and responsibility in all respect, appoint an agent, who shall be my /our agent to collect and transmission of any cheque, bills, hundies or other instruments or share certificates or other documents or goods or the instruments received in exchange or payments thereof, and the advices and correspondence relating thereto, whether by post or otherwise and whether by land, sea or air or by telegram or cables shall be entirely at my/our risk and responsibility and any loss, damage or delay however occasioned shall be on my/our account and be wholly borne by me/us.';

  // The undertaking text from the second image.
  const String undertakingText =
      'I/we undertake that I/we shall not make available to any person resident in India foreign currency against reimbursement in rupees or any other manner in India I/we further undertake that in case of debits to the accounts for the purpose of investing in India and credits representing sale proceeds of investments. I/we shall ensure that such investments/disinvestments would be covered by either general or special permission of Reserve Bank.';

  // Helper widget for creating a signature box.
  pw.Widget _buildSignatureBox(String label, String signatureText) { // <--- MODIFIED: Accepts signatureText
    return pw.Container(
      width: 160,
      height: 70,
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.black, width: 0.5),
      ),
      child: pw.Padding(
        padding: const pw.EdgeInsets.only(bottom: 5),
        child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            if (signatureText.isNotEmpty) // Display signature text if available
              pw.Text(
                signatureText,
                style:  pw.TextStyle(fontSize: 10, fontStyle: pw.FontStyle.italic),
              ),
            pw.Text(
              label,
              style: const pw.TextStyle(fontSize: signatureLabelFontSize),
            ),
          ],
        ),
      ),
    );
  }

  // The main container that holds all content and provides the outer border.
  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.black, width: 1),
    ),
    padding: const pw.EdgeInsets.all(20), // Padding inside the border
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // "(Annexure III)" aligned to the top right.
        pw.Align(
          alignment: pw.Alignment.topRight,
          child: pw.Text(
            '(Annexure III)',
            style: const pw.TextStyle(fontSize: annexureFontSize),
          ),
        ),

        pw.SizedBox(height: 15),

        // Centered main heading with an underline.
        pw.Center(
          child: pw.Column(
            children: [
              pw.Text(
                'DECLARATION FROM NRI CUSTOMERS',
                style: pw.TextStyle(
                  fontSize: headingFontSize,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Container(
                width: 240, // Adjust width to match the text length
                child: pw.Divider(thickness: 1),
              ),
            ],
          ),
        ),

        pw.SizedBox(height: 20),

        // The main body of the declaration text, justified.
        pw.Text(
          declarationText,
          textAlign: pw.TextAlign.justify,
          style: const pw.TextStyle(fontSize: bodyFontSize, lineSpacing: 2),
        ),

        pw.SizedBox(height: 15),

        // The undertaking text from the second image, justified.
        pw.Text(
          undertakingText,
          textAlign: pw.TextAlign.justify,
          style: const pw.TextStyle(fontSize: bodyFontSize, lineSpacing: 2),
        ),

        pw.SizedBox(height: 25),

        // Row containing the three signature boxes.
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            _buildSignatureBox('Signature of Applicant 1', data.signature1Text), // <--- MODIFIED
            _buildSignatureBox('Signature of Applicant 2', data.signature2Text), // <--- MODIFIED
            _buildSignatureBox('Signature of Applicant 3', ''), // Retain original third signature (no model data)
          ],
        ),
      ],
    ),
  );
}