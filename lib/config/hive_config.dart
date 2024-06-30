import 'package:hive_flutter/hive_flutter.dart';

 Box? userHive;

setupHive()async{
  userHive= await Hive.openBox("tokenUser");

}

