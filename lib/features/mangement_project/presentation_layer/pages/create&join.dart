import 'package:flutter/material.dart';
import 'package:project_management/core/constants/contantsVarApp.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/widgetsApp/widget_button.dart';

class CreateAndJoin extends StatelessWidget {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: darkBlue,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(right: 60),
              height: 480, width:700,
              child: Image.asset("images/bigBear.png",fit: BoxFit.cover,)
            ),
            ButtonCustom(280,54,Text(create,style: TextStyle(fontSize: 30,color: darkBlue),),lightYellow,darkBlue,(){
              Navigator.pushNamed(context, '/CreateProject');
            }),
            ButtonCustom(280,54,Text(join,style: TextStyle(fontSize: 30,color: darkBlue),),lightYellow,darkBlue,(){
              // Navigator.pushNamed(context, '/JoinProject');
              showModalBottomSheet(
                backgroundColor: darkBlue,
                  context: context,
                  builder: (builder){
                    return Container(
                      height: 400.0,
                      decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Text(EnterprojectID,textScaleFactor: 2 ,style: TextStyle(color: darkBlue,fontWeight: FontWeight.bold)),
                                ),
                                Image.asset("images/tree.png")
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0,left: 40,right: 40),
                              child: TextFormField(
                                style: const TextStyle(color:black),
                                onSaved: (value){
                                  controller.text=value!;
                                },
                                controller: controller,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: white,
                                  enabledBorder:OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: white)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: darkBlue,width: 1.5)
                                  ),
                                ),
                              ),
                            ),
                            ButtonCustom(240,60,
                                 Text(confirm,style: TextStyle(fontSize: 30,color: white),)
                                ,darkBlue,darkBlue,(){
                                  idProject=int.parse(controller.text);
                                  Navigator.pushReplacementNamed(context, '/ProjectHome');
                                }),
                          ],
                        ),
                      ),
                    );
                  }
              );
            })
          ],
        ),
      ),
    );
  }
}
