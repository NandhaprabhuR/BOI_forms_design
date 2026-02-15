import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

// Helper for character boxes
pw.Widget charBoxes(
  String data,
  int count, {
  double width = 12,
  double height = 14,
}) {
  List<pw.Widget> boxes = [];
  for (int i = 0; i < count; i++) {
    boxes.add(
      pw.Container(
        width: width,
        height: height,
        margin: const pw.EdgeInsets.symmetric(horizontal: 0.5),
        alignment: pw.Alignment.center,
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 1)),
        child: data.length > i
            ? pw.Text(
                data[i],
                style: const pw.TextStyle(fontSize: 9, lineSpacing: 1),
              )
            : pw.SizedBox(),
      ),
    );
  }
  return pw.Row(children: boxes);
}

// Helper for a checkbox with a label
pw.Widget labeledCheckbox(String label, {bool checked = false}) {
  return pw.Row(
    mainAxisSize: pw.MainAxisSize.min,
    children: [
      checkBox(checked: checked),
      pw.SizedBox(width: 2),
      pw.Text(label, style: const pw.TextStyle(fontSize: 8)),
    ],
  );
}

// Helper for a simple checkbox
pw.Widget checkBox({bool checked = false}) {
  return pw.Container(
    width: 10,
    height: 10,
    margin: const pw.EdgeInsets.symmetric(horizontal: 4),
    decoration: pw.BoxDecoration(border: pw.Border.all(width: 1)),
    child: checked
        ? pw.Center(
            child: pw.CustomPaint(
              size: const PdfPoint(8, 8),
              painter: (PdfGraphics canvas, PdfPoint size) {
                canvas
                  ..moveTo(1, size.y / 2)
                  ..lineTo(size.x / 3, 1)
                  ..lineTo(size.x - 1, size.y - 1)
                  ..setStrokeColor(PdfColors.black)
                  ..setLineWidth(1.0)
                  ..strokePath();
              },
            ),
          )
        : null,
  );
}

// Helper for a single character box with a sub-label (for dates)
pw.Widget charBoxWithLabel(String char, String label) {
  return pw.Column(
    children: [
      charBoxes(char, 1, width: 14, height: 14),
      pw.SizedBox(height: 1),
      pw.Text(label, style: const pw.TextStyle(fontSize: 7)),
    ],
  );
}

// Helper for a radio button with a label
pw.Widget labeledRadio(String label, {bool checked = false}) {
  return pw.Row(
    mainAxisSize: pw.MainAxisSize.min,
    children: [
      radioButton(checked: checked),
      pw.SizedBox(width: 2),
      pw.Text(label, style: const pw.TextStyle(fontSize: 8)),
    ],
  );
}

// Helper for a simple radio button (circle)
pw.Widget radioButton({bool checked = false}) {
  return pw.Container(
    width: 10,
    height: 10,
    margin: const pw.EdgeInsets.symmetric(horizontal: 4),
    decoration: pw.BoxDecoration(
      shape: pw.BoxShape.circle,
      border: pw.Border.all(width: 1),
    ),
    child: checked
        ? pw.Center(
            child: pw.Container(
              width: 5,
              height: 5,
              decoration: const pw.BoxDecoration(
                shape: pw.BoxShape.circle,
                color: PdfColors.black,
              ),
            ),
          )
        : null,
  );
}
