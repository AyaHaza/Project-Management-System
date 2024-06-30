import 'package:flutter/material.dart';
import '../constants/constantsColor.dart';

Widget TextFiledCustom(double paddingHorizontel,String text ,Color?textFiedColor,Color? textColor ,int maxLines, TextEditingController controller){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 38.0,bottom: 4),
        child: Text(text,style:  TextStyle(fontSize: 15,color: textColor),),
      ),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: paddingHorizontel),
        child: TextFormField(
          maxLines: maxLines,
          style: const TextStyle(color:darkBlue),
          onSaved: (value){
            controller.text=value!;
          },
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: textFiedColor,
            enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: darkBlue,width: 1.4)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: darkBlue,width: 1.4)
            ),
          ),
        ),
      ),
    ],
  );}

