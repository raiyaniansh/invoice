import 'package:flutter/material.dart';

Widget textfiled(String a, TextEditingController b) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 5, bottom: 3),
        child:
        Text("$a", style: TextStyle(color: Colors.white, fontSize: 15)),
      ),
      TextFormField(
        controller: b,
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
          if(value!.isEmpty)
          {
            return "Enter the data";
          }
          return null;
        },
      ),
    ],
  );
}
Widget textfiled2(String a, TextEditingController b) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 5, bottom: 3),
        child:
        Text("$a", style: TextStyle(color: Colors.white, fontSize: 15)),
      ),
      TextFormField(
        controller: b,
        keyboardType: TextInputType.number,
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
          if(value!.isEmpty)
          {
            return "Enter the data";
          }
          return null;
        },
      ),
    ],
  );
}

