import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() => runApp(const MyApp('Printing Demo'));

class MyApp extends StatelessWidget {
  const MyApp(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => _generatePdf(format, title),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    //로컬 pdf파일출
    String filepath = "pdf/test.pdf";
    final pdf = await rootBundle.load(filepath);
    await Printing.layoutPdf(onLayout: (_) => pdf.buffer.asUint8List());
    //Text 출력
    //final pdf = pw.Document();
/*
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Center(
            child: pw.Text(title),
          );
        },
      ),
    );

    return pdf.save();
    */
  }
}
