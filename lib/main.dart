import 'package:flutter/material.dart';
import 'package:maps/HomeScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Maps',
     theme: ThemeData(
       primarySwatch: Colors.blueGrey,
     ),
 home: const homescreen(),
   );
  }

}