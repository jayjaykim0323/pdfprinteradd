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
    //html 출력
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => await Printing.convertHtml(
              format: format,
              html: //예제 html작성
                  '<html><head> <title>example 1-2</title></head> <body> <H2>example 1-2</H2> <HR>example 1-2</body></html>',
            ));
    //로컬 pdf파일출력
    /*
    String filepath = "pdf/test.pdf";
    final pdf = await rootBundle.load(filepath);
    await Printing.layoutPdf(onLayout: (_) => pdf.buffer.asUint8List());
     */
    //Text 출
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
