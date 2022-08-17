import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/moduels/business/business_screen.dart';

import 'home_layout/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          titleTextStyle:TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 20) ,
          systemOverlayStyle:SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness:Brightness.dark,
          ) ,
          iconTheme:IconThemeData(color: Colors.black ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type:BottomNavigationBarType.fixed ,
          selectedItemColor: Colors.deepOrange,
        )),
      home: home_layout(),
    );

  }
}