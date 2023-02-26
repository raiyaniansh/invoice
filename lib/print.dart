import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invoice/main.dart';
import 'package:invoice/pdf.dart';
import 'package:invoice/share.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'Modal.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  GlobalKey Img=GlobalKey();
  @override
  Widget build(BuildContext context) {
    List<Data> product = ModalRoute.of(context)!.settings.arguments as List<Data>;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },child: Icon(Icons.arrow_back,size: 25,)),
                    SizedBox(height: 10,),
                    Text("Your invoice",style: TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold,fontSize: 35)),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0,2.5),
              child: Container(
                height: 750,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: RepaintBoundary(
                        key: Img,
                        child: Container(
                          width: double.infinity,
                          height: 500,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15,),
                                Align(alignment: Alignment.center,child: Text("${product[0].coname}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                                SizedBox(height: 10,),
                                Align(alignment: Alignment.center,child: Text("${product[0].coadd}",style: TextStyle(fontSize: 18),textAlign: TextAlign.center)),
                                SizedBox(height: 10,),
                                Container(height: 1,width: double.infinity,color: Colors.black,),
                                SizedBox(height: 10,),
                                Text("Name: ${product[0].cname}",style: TextStyle(fontSize: 18)),
                                SizedBox(height: 10,),
                                Container(height: 1,width: double.infinity,color: Colors.black,),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",style: TextStyle(fontSize: 16)),
                                    Text("Time: ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text("Bill no: ${product[0].billno}",style: TextStyle(fontSize: 16)),
                                SizedBox(height: 10,),
                                Container(height: 1,width: double.infinity,color: Colors.black,),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Text('Item',style: TextStyle(fontSize: 16),),
                                    Expanded(child: SizedBox()),
                                    Text('Qty',style: TextStyle(fontSize: 16),),
                                    SizedBox(width: 15,),
                                    Text('Price',style: TextStyle(fontSize: 16),),
                                    SizedBox(width: 15,),
                                    Text('Amount',style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(height: 1,width: double.infinity,color: Colors.black,),
                                SizedBox(height: 5,),
                                Container(
                                  height: 100,
                                  child: ListView.builder(itemCount: product.length,itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Text("${product[index].pname}",style: TextStyle(fontSize: 16),),
                                        Expanded(child: SizedBox()),
                                        Container(
                                          width: 122,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${product[index].spqua}",style: TextStyle(fontSize: 16),),
                                              Text("${product[index].spprice}",style: TextStyle(fontSize: 16),),
                                              Text("${product[index].pamont}.00",style: TextStyle(fontSize: 16),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },),
                                ),
                                SizedBox(height: 10,),
                                Container(height: 1,width: double.infinity,color: Colors.black,),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Sub Total",style: TextStyle(fontSize: 16)),
                                    Text("Rs. $sum.00",style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(height: 1,width: double.infinity,color: Colors.black,),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Tex",style: TextStyle(fontSize: 16)),
                                    Text("$tex%",style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(height: 1,width: double.infinity,color: Colors.black,),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Grand Total",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                    Text("Rs. $total",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(height: 1,width: double.infinity,color: Colors.black,),
                                SizedBox(height: 10,),
                                Align(alignment: Alignment.center,child: Text("Thanks, Visit Again...",style: TextStyle(fontSize: 16),)),
                                SizedBox(height: 5,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      captureImage();
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text("Save as image",style: TextStyle(color: Colors.white,fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Pdf(product);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text("Save as Pdf",style: TextStyle(color: Colors.white,fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      Sharepdf(product);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text("Share Pdf",style: TextStyle(color: Colors.white,fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void captureImage()async{
    RenderRepaintBoundary? bountary=Img.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    ui.Image image = await bountary!.toImage(pixelRatio: 10);
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byedata = await image.toByteData(format: ui.ImageByteFormat.png);
    var pngbytes = byedata!.buffer.asUint8List();

  final result = ImageGallerySaver.saveImage(pngbytes,name: "Invoice.png",quality: 50);
  }
}
