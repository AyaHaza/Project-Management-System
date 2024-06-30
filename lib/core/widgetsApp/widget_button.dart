import 'package:flutter/material.dart';

Widget ButtonCustom(double width, double height,Widget widget,Color buttonColor,Color textColor,Function()?function){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 30.0,top: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            fixedSize: Size(width, height),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: function,
        child: widget

      ),
    ),
  );
}

