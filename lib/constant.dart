import 'package:flutter/material.dart';

import 'package:flutter/material.dart' show Color, Colors;

// var validateKey = GlobalKey<FormState>();

class Styles {
  static Color primary = Colors.black;
  static Color grey = Colors.grey;
  static Color greyshad700 = Colors.grey.shade700;
  static Color textcolor = Colors.white;
  static Color white = Colors.white;
  static Color lightwhite = Colors.white60;
}

Widget hsize() {
  return SizedBox(
    height: 10.0,
  );
}

Widget wsize() {
  return SizedBox(
    width: 6.0,
  );
}

Widget custom_textformsield(
    String name, String htext, var ic, var valid, TextEditingController con) {
  return TextFormField(
    controller: con,
    validator: (value) {
      if (value!.isEmpty) {
        return "PLease Enter Your $valid";
      } else {
        return null;
      }
    },
    cursorColor: Styles.textcolor,
    style: TextStyle(color: Styles.textcolor),
    decoration: InputDecoration(
      labelText: '$name',
      labelStyle: TextStyle(color: Styles.grey),
      hintText: '$htext',
      hintStyle: TextStyle(color: Styles.grey),
      prefixIcon: ic,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Styles.grey),
        borderRadius: BorderRadius.circular(15.0),
      ),
      border: new OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: new BorderSide(color: Styles.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(
          width: 1,
          color: Styles.greyshad700,
        ),
      ),
    ),
  );
}
