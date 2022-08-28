import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/moduels/business/business_screen.dart';
import 'package:news_app/network/remote/dio_helpers.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'home_layout/home_layout.dart';
import 'network/local/Cache_Helper.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();// when fun main is async..
  DioHelper.init();
  await CacheHelper.init();
  bool? isdark=CacheHelper.GetData(Key: 'isdark');
  runApp( MyApp(isdark!));
}

class MyApp extends StatelessWidget {
  final bool isdark;
  MyApp(this.isdark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(BuildContext context)=>NewsCubit()..getbusiness()..getSports()..getScience()..Changemode(fromshared: isdark),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
    builder: (context,state){
          return MaterialApp(
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
      themeMode:NewsCubit.get(context).isdark? ThemeMode.dark:ThemeMode.light,
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
      color: Colors.white,) )
      ),
            home: home_layout(),
          );
    },
    ),
    );


  }
}