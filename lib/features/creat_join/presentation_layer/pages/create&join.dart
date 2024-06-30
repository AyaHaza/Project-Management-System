import 'package:flutter/material.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/widgetsApp/widget_button.dart';

class CreateAndJoin extends StatelessWidget {
  const CreateAndJoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: darkBlue,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 60),
              height: 480, width:700,
              child: Image.asset("images/bigBear.png",fit: BoxFit.cover,)
            ),
            ButtonCustom(280,54,Text(create,style: TextStyle(fontSize: 30,color: darkBlue),),lightYellow,darkBlue,(){
              Navigator.pushNamed(context, '/CreateProject');
            })
          ],
        ),
      ),
    );
  }
}
