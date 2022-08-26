import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/moduels/business/business_screen.dart';
import 'package:news_app/network/remote/dio_helpers.dart';
import 'home_layout/home_layout.dart';

void main() {
DioHelper.init();
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
        appBarTheme: const AppBarTheme(
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
            unselectedItemColor: Colors.grey,
            backgroundColor:Colors.white,
          ),
          textTheme:TextTheme(
              bodyText1: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,)

          )
      ) ,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(

          scaffoldBackgroundColor: HexColor("#333739"),
          appBarTheme:  AppBarTheme(
            color: HexColor("#333739"),
            elevation: 0.0,
            titleTextStyle:TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20) ,
            systemOverlayStyle:SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness:Brightness.light,
            ) ,
            iconTheme:IconThemeData(color: Colors.white ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type:BottomNavigationBarType.fixed ,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            backgroundColor:HexColor("#333739"),
          ),
        textTheme:TextTheme(
          bodyText1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,)

          )
        ) ,

      home: home_layout(),
    );

  }
}