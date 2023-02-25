import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'main.dart';

Pdf(product) async {
  var pdf = pw.Document();
  pw.EdgeInsets.all(10);
  pw.PageOrientation.portrait;
  pdf.addPage(pw.Page(
    pageFormat: PdfPageFormat.a4,
    margin: pw.EdgeInsets.all(0),
    build: (context) {
      return pw.Container(
        width: double.infinity,
        color: PdfColors.white,
        child: pw.Padding(
          padding: const pw.EdgeInsets.all(10),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(height: 15,),
              pw.Align(alignment: pw.Alignment.center,child: pw.Text("${product[0].coname}",style: pw.TextStyle(fontSize: 25,fontWeight: pw.FontWeight.bold),)),
              pw.SizedBox(height: 10,),
              pw.Align(alignment: pw.Alignment.center,child: pw.Text("${product[0].coadd}",style: pw.TextStyle(fontSize: 18),textAlign: pw.TextAlign.center)),
              pw.SizedBox(height: 10,),
              pw.Container(height: 1,width: double.infinity,color: PdfColors.black,),
              pw.SizedBox(height: 10,),
              pw.Text("Name: ${product[0].cname}",style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 10,),
              pw.Container(height: 1,width: double.infinity,color: PdfColors.black,),
              pw.SizedBox(height: 10,),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",style: pw.TextStyle(fontSize: 16)),
                  pw.Text("Time: ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",style: pw.TextStyle(fontSize: 16)),
                ],
              ),
              pw.SizedBox(height: 10,),
              pw.Text("Bill no: ${product[0].billno}",style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 10,),
              pw.Container(height: 1,width: double.infinity,color: PdfColors.black,),
              pw.SizedBox(height: 10,),
              pw.Row(
                children: [
                  pw.Text('Item',style: pw.TextStyle(fontSize: 16),),
                  pw.Expanded(child: pw.SizedBox()),
                  pw.Text('Qty',style: pw.TextStyle(fontSize: 16),),
                  pw.SizedBox(width: 15,),
                  pw.Text('Price',style: pw.TextStyle(fontSize: 16),),
                  pw.SizedBox(width: 15,),
                  pw.Text('Amount',style: pw.TextStyle(fontSize: 16),),
                ],
              ),
              pw.SizedBox(height: 10,),
              pw.Container(height: 1,width: double.infinity,color: PdfColors.black,),
              pw.SizedBox(height: 5,),
              pw.Container(
                height: 100,
                child: pw.ListView.builder(itemCount: product.length,itemBuilder: (context, index) {
                  return pw.Row(
                    children: [
                      pw.Text("${product[index].pname}",style: pw.TextStyle(fontSize: 16),),
                      pw.Expanded(child: pw.SizedBox()),
                      pw.Container(
                        width: 122,
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text("${product[index].spqua}",style: pw.TextStyle(fontSize: 16),),
                            pw.Text("${product[index].spprice}",style: pw.TextStyle(fontSize: 16),),
                            pw.Text("${product[index].pamont}.00",style: pw.TextStyle(fontSize: 16),),
                          ],
                        ),
                      ),
                    ],
                  );
                },),
              ),
              pw.SizedBox(height: 10,),
              pw.Container(height: 1,width: double.infinity,color: PdfColors.black,),
              pw.SizedBox(height: 10,),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Sub Total",style: pw.TextStyle(fontSize: 16)),
                  pw.Text("Rs. $sum.00",style: pw.TextStyle(fontSize: 16)),
                ],
              ),
              pw.SizedBox(height: 10,),
              pw.Container(height: 1,width: double.infinity,color: PdfColors.black,),
              pw.SizedBox(height: 10,),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Total Tex",style: pw.TextStyle(fontSize: 16)),
                  pw.Text("$tex%",style: pw.TextStyle(fontSize: 16)),
                ],
              ),
              pw.SizedBox(height: 10,),
              pw.Container(height: 1,width: double.infinity,color: PdfColors.black,),
              pw.SizedBox(height: 10,),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Grand Total",style: pw.TextStyle(fontSize: 16,fontWeight: pw.FontWeight.bold)),
                  pw.Text("Rs. $total",style: pw.TextStyle(fontSize: 16,fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 10,),
              pw.Container(height: 1,width: double.infinity,color: PdfColors.black,),
              pw.SizedBox(height: 10,),
              pw.Align(alignment: pw.Alignment.center,child: pw.Text("Thanks, Visit Again...",style: pw.TextStyle(fontSize: 16),)),
              pw.SizedBox(height: 5,)
            ],
          ),
        ),
      );
    },
  ));

  Directory? output = await getExternalStorageDirectory();
  final file = File("${output!.path}/inovice.pdf");
  print(file);
  await file.writeAsBytes(await pdf.save());
}
