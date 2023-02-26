import 'package:flutter/material.dart';
import 'package:invoice/Modal.dart';
import 'package:invoice/main.dart';

import 'widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtconame = TextEditingController();
  TextEditingController txtconum = TextEditingController();
  TextEditingController txtcoadd = TextEditingController();
  TextEditingController txtcoemail = TextEditingController();
  TextEditingController txtcname = TextEditingController();
  TextEditingController txtcnum = TextEditingController();
  TextEditingController txtcadd = TextEditingController();
  TextEditingController txtcemail = TextEditingController();
  TextEditingController txtpname = TextEditingController();
  TextEditingController txtpprice = TextEditingController();
  TextEditingController txtpqua = TextEditingController();
  TextEditingController txtptex = TextEditingController();
  TextEditingController txtptexname = TextEditingController();
  TextEditingController txtbillno = TextEditingController();
  List<Data> data=[];
  var key1 = GlobalKey<FormState>();
  var key2 = GlobalKey<FormState>();
  int amont=0;
  @override
  Widget build(BuildContext context) {
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
                child: Text("Welcome,\nInvoice generator",style: TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold,fontSize: 35)),
              ),
            ),
            Align(
              alignment: Alignment(0, 1),
              child: Container(
                height: 710,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: textfiled2("Bill no", txtbillno),
                      ),
                      Form(
                        key: key1,
                        child: ExpansionTile(
                          maintainState: true,
                          title: Text("Company details",
                              style: TextStyle(color: Colors.white)),
                          childrenPadding: EdgeInsets.only(left: 10, right: 10),
                          collapsedIconColor: Colors.white,
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textfiled("Name", txtconame),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5, bottom: 3),
                                  child: Text("Mobile number",
                                      style: TextStyle(color: Colors.white, fontSize: 15)),
                                ),
                                TextFormField(
                                  controller: txtconum,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if(value!.length!=10)
                                    {
                                      return 'Enter the valide number....';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            textfiled("Email", txtcoemail),
                            SizedBox(
                              height: 10,
                            ),
                            textfiled("Address", txtcoadd),
                          ],
                        ),
                      ),
                      Form(
                        key: key2,
                        child: ExpansionTile(
                          maintainState: true,
                          title: Text("Customer details",
                              style: TextStyle(color: Colors.white)),
                          childrenPadding: EdgeInsets.only(left: 10, right: 10),
                          collapsedIconColor: Colors.white,
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textfiled("Name", txtcname),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5, bottom: 3),
                                  child: Text("Mobile number",
                                      style: TextStyle(color: Colors.white, fontSize: 15)),
                                ),
                                TextFormField(
                                  controller: txtcnum,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if(value!.length!=10)
                                    {
                                      return 'Enter the valide number....';
                                    }
                                    return null;
                                  },

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            textfiled("Email", txtcemail),
                            SizedBox(
                              height: 10,
                            ),
                            textfiled("Address", txtcadd),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
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
                                if(txtbillno.text.isNotEmpty)
                                {
                                  if(key1.currentState!.validate())
                                  {
                                    if(key2.currentState!.validate())
                                    {
                                      if(txtpname.text.isNotEmpty&&txtpqua.text.isNotEmpty&&txtpprice.text.isNotEmpty&&txtptexname.text.isNotEmpty&&txtptex.text.isNotEmpty)
                                      {
                                        amont= int.parse(txtpprice.text)*int.parse(txtpqua.text);
                                        sum=sum+amont;
                                        tex=tex+int.parse(txtptex.text);
                                        Data d1=Data(
                                          pamont: amont,
                                          spprice: txtpprice.text,
                                          spqua: txtpqua.text,
                                          sptexrat: txtptex.text,
                                          billno: txtbillno.text,
                                          pname: txtpname.text,
                                          pprice: int.parse(txtpprice.text),
                                          pqua: int.parse(txtpqua.text),
                                          ptexname: txtptexname.text,
                                          ptexrat: int.parse(txtptex.text),
                                          cname: txtcname.text,
                                          cnum: txtcnum.text,
                                          cadd: txtcadd.text,
                                          cemail: txtcemail.text,
                                          coname: txtconame.text,
                                          conum: txtconum.text,
                                          coadd: txtcoadd.text,
                                          coemail: txtcoemail.text,
                                        );
                                        setState(() {
                                          data.add(d1);
                                        });
                                        txtptex.clear();
                                        txtptexname.clear();
                                        txtpprice.clear();
                                        txtpqua.clear();
                                        txtpname.clear();
                                      }
                                      else
                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the product datails...")));
                                      }
                                    }
                                    else
                                    {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the customar datails...")));
                                    }
                                  }
                                  else
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the company datails...")));

                                  }
                                }
                                else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the bill no...")));
                                }
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
                      ),
                      SizedBox(height: 70,),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if(key1.currentState!.validate())
                      {
                        if(key2.currentState!.validate())
                          {
                            if(data.isNotEmpty)
                              {
                                Navigator.pushNamed(context, 'details',arguments: data);
                              }
                            else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the product datails...")));
                            }
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the customar datails...")));
                          }
                      }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the company datails...")));

                      }
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
            ),
          ],
        ),
      ),
    );
  }
}
