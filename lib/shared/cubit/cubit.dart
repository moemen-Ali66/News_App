import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/moduels/business/business_screen.dart';
import 'package:news_app/moduels/science/science_screen.dart';
import 'package:news_app/moduels/setting/setting_screen.dart';
import 'package:news_app/moduels/sports/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() :super(NewsIntialStates());
  static NewsCubit get(context) => BlocProvider.of(context);
 int curentindex=0;
  List<Widget> Screens =[
   BusinessScrren(),
   SportsScrren(),
   ScienceScrren(),
    SettingScrren(),
 ];
  List<BottomNavigationBarItem>bottomItem=[
    BottomNavigationBarItem(icon:Icon(Icons.business),label:'Business',),
    BottomNavigationBarItem(icon:Icon(Icons.sports),label:'Sports',),
    BottomNavigationBarItem(icon:Icon(Icons.science),label:'Science',),
    BottomNavigationBarItem(icon:Icon(Icons.settings),label:'Setting',),
  ];
  void ChangeBottomNav(index){
    curentindex=index;
    emit(NewsBottomNavStates());
  }

}