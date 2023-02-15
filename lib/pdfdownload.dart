import 'dart:io';

import 'package:demo11/constant.dart';
import 'package:demo11/dataModel.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';


void pdfCreate(DataModel Data) async {
  var pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.all(10),
      orientation: pw.PageOrientation.portrait,
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Row(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 300),
              child: pw.Container(
                height: 500,
                width: 150,
                // height: pw.MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width / 3,
                decoration: pw.BoxDecoration(
                  color: PdfColors.blue800,

                  // color: Color.fromARGB(255, 15, 86, 145),
                ),
                child: pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 15),
                  child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "${Data.name} ${Data.surname}",
                        style: pw.TextStyle(
                          color: PdfColors.white,
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        "${Data.post_name}",
                        style: pw.TextStyle(
                          color: PdfColors.white,
                          fontSize: 15,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "PROFILE",
                        style: pw.TextStyle(
                          color: PdfColors.white,
                          fontSize: 20,
                          decoration: pw.TextDecoration.underline,
                          decorationStyle: pw.TextDecorationStyle.double,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "Name",
                        style: pw.TextStyle(color: PdfColors.white),
                      ),
                      pw.Text(
                        "${Data.name} ${Data.surname}",
                        style:
                            pw.TextStyle(color: PdfColors.white, fontSize: 12),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "Date Of Birth",
                        style: pw.TextStyle(color: PdfColors.white),
                      ),
                      pw.Text(
                        "${Data.txtBirth}",
                        style:
                            pw.TextStyle(color: PdfColors.white, fontSize: 12),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "Phone Number",
                        style: pw.TextStyle(color: PdfColors.white),
                      ),
                      pw.Text(
                        "${Data.phone_number}",
                        style:
                            pw.TextStyle(color: PdfColors.white, fontSize: 12),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "Email",
                        style: pw.TextStyle(color: PdfColors.white),
                      ),
                      pw.Text(
                        "${Data.email}",
                        style:
                            pw.TextStyle(color: PdfColors.white, fontSize: 12),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "Gender",
                        style: pw.TextStyle(color: PdfColors.white),
                      ),
                      pw.Text(
                        "${Data.radio_button}",
                        style:
                            pw.TextStyle(color: PdfColors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.only(left: 12, right: 12, top: 20),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "OBJECTIVE",
                    style: pw.TextStyle(
                      decoration: pw.TextDecoration.underline,
                      decorationStyle: pw.TextDecorationStyle.double,
                      color: PdfColors.blue800,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    width: 200,
                    // width: pw.MediaQuery.of(context).size.width / 2,
                    child: pw.Text(
                      "To secure a challenging position in a reputable organization to expand learning, knowledge and skills",
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    "EDUCTION",
                    style: pw.TextStyle(
                      decoration: pw.TextDecoration.underline,
                      decorationStyle: pw.TextDecorationStyle.double,
                      color: PdfColors.blue800,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    // width: MediaQuery.of(context).size.width / 2,
                    child: pw.Text(
                      "${Data.eduction}",
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    "POST NAME",
                    style: pw.TextStyle(
                      decoration: pw.TextDecoration.underline,
                      decorationStyle: pw.TextDecorationStyle.double,
                      color: PdfColors.blue800,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    // width: MediaQuery.of(context).size.width / 2,
                    child: pw.Text(
                      "${Data.post_name}",
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    "HOBBIES",
                    style: pw.TextStyle(
                      decoration: pw.TextDecoration.underline,
                      decorationStyle: pw.TextDecorationStyle.double,
                      color: PdfColors.blue800,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    // width: MediaQuery.of(context).size.width / 2,
                    child: pw.Text(
                      "${Data.checkbox_data}",
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  Directory? dir = await getExternalStorageDirectory();
  print('=====================${dir!.path}');
  File file = File("${dir.path}/${Data.name} resume.pdf");
  await file.writeAsBytes(await pdf.save());
}
