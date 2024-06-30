import 'package:flutter/material.dart';
import '../../../../core/constants/constantsColor.dart';

Widget  buildImage(){
  return Padding(
    padding: const EdgeInsets.only(top: 28.0),
    child: Center(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: darkBlue,width: 2),
          color: lightYellow,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 20),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: lightGreen,
            borderRadius: BorderRadius.circular(90),
          ),
          child: Image.asset("images/bear.png",scale: 4.6,),
        ),
      ),
    ),
  );
}
