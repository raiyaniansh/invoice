import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invoice/Modal.dart';
import 'package:invoice/main.dart';

import 'widget.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int i=0;
  int amont=0;
  TextEditingController txtpname = TextEditingController();
  TextEditingController txtpprice = TextEditingController();
  TextEditingController txtpqua = TextEditingController();
  TextEditingController txtptex = TextEditingController();
  TextEditingController txtptexname = TextEditingController();
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
                    Text("Your product",style: TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold,fontSize: 35)),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 2.5),
              child: Container(
                height: 750,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                    return Box("${product[index].pname}","${product[index].pqua}",index,product,"${product[index].pprice}","${product[index].ptexname}","${product[index].ptexrat}");
                  },),
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
                      setState(() {
                        txtpname.clear();
                        txtpqua.clear();
                        txtpprice.clear();
                        txtptexname.clear();
                        txtptex.clear();
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.grey.shade900,
                            insetPadding: EdgeInsets.all(10),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5,top: 10,bottom: 10),
                                  child: Text("Product details",
                                      style: TextStyle(color: Colors.white,fontSize: 18)),
                                ),
                                textfiled("Name", txtpname),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(width: 141,child: textfiled2("Price", txtpprice)),
                                    SizedBox(width: 10,),
                                    Container(width: 141,child: textfiled2("Quantity", txtpqua)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                textfiled("Tex name", txtptexname),
                                SizedBox(height: 10,),
                                textfiled2("Tex rate", txtptex),
                                SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    amont= int.parse(txtpprice.text)*int.parse(txtpqua.text);
                                    sum=sum+amont;
                                    tex=tex+int.parse(txtptex.text);
                                    Data d1=Data(
                                      pamont: amont,
                                      spprice: txtpprice.text,
                                      spqua: txtpqua.text,
                                      sptexrat: txtptex.text,
                                      pname: txtpname.text,
                                      pprice: int.parse(txtpprice.text),
                                      pqua: int.parse(txtpqua.text),
                                      ptexname: txtptexname.text,
                                      ptexrat: int.parse(txtptex.text),
                                    );
                                    setState(() {
                                      product.add(d1);
                                      Navigator.pop(context);
                                      txtpname.clear();
                                      txtpqua.clear();
                                      txtpprice.clear();
                                      txtptexname.clear();
                                      txtptex.clear();
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 20)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },);
                      });
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
                      child: Text("Add More",style: TextStyle(color: Colors.white,fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      totaltax=(sum*tex)/100;
                      total=totaltax+sum;
                      setState(() {
                        Navigator.pushNamed(context, 'bill',arguments: product);
                      });
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
                      child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 20)),
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

  Widget Box(String name,String qua,index,List<Data> product,String price,String texname,String texrate) {
    return ExpansionTile(
      onExpansionChanged: (value) {
        setState(() {
          txtpname= TextEditingController(text: name);
          txtpprice= TextEditingController(text: price);
          txtpqua= TextEditingController(text: qua);
          txtptexname= TextEditingController(text: texname);
          txtptex= TextEditingController(text: texrate);
        });
      },
      trailing: Text("$price",style: TextStyle(color: Colors.white)),
      title: Row(children: [
        Text("$name",style: TextStyle(color: Colors.white))
      ]),
      children: [
        textfiled("Name", txtpname),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(width: 165,child: textfiled2("Price", txtpprice)),
            Expanded(child: SizedBox()),
            Container(width: 165,child: textfiled2("Quantity", txtpqua)),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        textfiled("Tex name", txtptexname),
        SizedBox(height: 10,),
        textfiled2("Tex rate", txtptex),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            amont= int.parse(txtpprice.text)*int.parse(txtpqua.text);
            sum=sum+amont;
            tex=tex+int.parse(txtptex.text);
            Data d1=Data(
              pamont: amont,
              spprice: txtpprice.text,
              spqua: txtpqua.text,
              sptexrat: txtptex.text,
              pname: txtpname.text,
              pprice: int.parse(txtpprice.text),
              pqua: int.parse(txtpqua.text),
              ptexname: txtptexname.text,
              ptexrat: int.parse(txtptex.text),
            );
            print(price);
            setState(() {
              product[index]=d1;
            });
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
            child: Text("Update",style: TextStyle(color: Colors.white,fontSize: 20)),
          ),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              product.removeAt(index);
            });
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
            child: Text("Delete",style: TextStyle(color: Colors.white,fontSize: 20)),
          ),
        ),
      ],
    );
  }
}
