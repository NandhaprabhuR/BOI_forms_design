// lib/screens/pdfdesign4.dart

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'pdf_helpers.dart';

// Main builder for the fourth page
pw.Widget buildFourthPage() {
  // CORRECTED: Removed pw.KeepTogether from this file.
  // It will be applied in pdfdesign1.dart
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      _buildNominationTitleBar(),
      _buildNominationForm(),
    ],
  );
}

// Helper for the "7 Nomination" title bar
pw.Widget _buildNominationTitleBar() {
  return pw.Container(
    width: double.infinity,
    padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    decoration: pw.BoxDecoration(
      color: PdfColors.grey200,
      border: pw.Border.all(width: 0.5),
    ),
    child: pw.Text('7 Nomination (If required fill Form DA-1)',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8.5)),
  );
}

// Helper for the main DA-1 form
pw.Widget _buildNominationForm() {
  // Helper for a simple underline
  pw.Widget underline(double width) {
    return pw.Container(
      width: width,
      height: 10,
      decoration: const pw.BoxDecoration(
        border: pw.Border(bottom: pw.BorderSide(width: 0.5)),
      ),
    );
  }

  return pw.Container(
    decoration: pw.BoxDecoration(
      border: pw.Border(
        left: const pw.BorderSide(width: 0.5),
        right: const pw.BorderSide(width: 0.5),
        bottom: const pw.BorderSide(width: 0.5),
      ),
    ),
    child: pw.Column(
      children: [
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.symmetric(vertical: 2),
          decoration: const pw.BoxDecoration(
            border: pw.Border(
                top: pw.BorderSide(width: 1.5),
                bottom: pw.BorderSide(width: 0.5)),
          ),
          child: pw.Center(
            child: pw.Text('FORM DA-1 (Nomination Form)',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold, fontSize: 8.5)),
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // --- Details of Nomination ---
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Details of Nomination:',
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 8)),
                  pw.Row(children: [
                    pw.Text('Registration No.',
                        style: const pw.TextStyle(fontSize: 8)),
                    pw.SizedBox(width: 4),
                    charBoxes('', 10)
                  ])
                ],
              ),
              pw.SizedBox(height: 3),
              pw.Text(
                  'Nomination under section 45ZA of the Banking Regulation Act, 1949 and Rules 1985 in respect of Bank Deposits.',
                  style: const pw.TextStyle(fontSize: 8)),
              pw.SizedBox(height: 5),

              // --- Main Nomination Sentence ---
              pw.RichText(
                text: pw.TextSpan(
                  style: const pw.TextStyle(
                      fontSize: 8, color: PdfColors.black, height: 1.5),
                  children: [
                    const pw.TextSpan(text: 'I/We '),
                    pw.TextSpan(
                      text: '      Arunkumar      ', // Spaces for padding
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        decoration: pw.TextDecoration.underline,
                      ),
                    ),
                    const pw.TextSpan(
                        text:
                        ' nominate the following person to whom in the event of my/minor\'s death the amount of this deposit, particulars of which are given below, may be returned by the Bank of India, '),
                    const pw.TextSpan(
                      text:
                      '                                                                      ', // Underlined space
                      style:
                      pw.TextStyle(decoration: pw.TextDecoration.underline),
                    ),
                    const pw.TextSpan(
                      text:
                      ' (name and address of the Branch / Office in which the deposit is held)',
                      style: pw.TextStyle(fontSize: 7),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 5),
              labeledCheckbox(
                  'I/We want the name of the nominee to be printed on the passbook',
                  checked: true),
              pw.SizedBox(height: 8),

              // --- Details of Deposit ---
              pw.Text('Details of Deposit',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 8)),
              pw.SizedBox(height: 4),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('Type of Deposit:',
                      style: const pw.TextStyle(fontSize: 8)),
                  pw.SizedBox(width: 4),
                  pw.Expanded(flex: 3, child: underline(0)),
                  pw.SizedBox(width: 20),
                  pw.Text('Account Number:',
                      style: const pw.TextStyle(fontSize: 8)),
                  pw.SizedBox(width: 4),
                  pw.Expanded(flex: 2, child: charBoxes('', 15)),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}