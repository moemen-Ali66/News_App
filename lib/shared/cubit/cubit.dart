import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/moduels/business/business_screen.dart';
import 'package:news_app/moduels/science/science_screen.dart';
import 'package:news_app/moduels/setting/setting_screen.dart';
import 'package:news_app/moduels/sports/sports_screen.dart';
import 'package:news_app/network/remote/dio_helpers.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() :super(NewsIntialStates());
  static NewsCubit get(context) => BlocProvider.of(context);
 int curentindex=0;
  List<Widget> Screens =[
   BusinessScreen(),
   SportsScreen(),
   ScienceScreen(),
   SettingScreen(),
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

  List business=[];
  void getbusiness(){
    emit(NewsgetBusinessLoadingStates());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category':'business',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value){
    //  print(value.data["articles"][0]['title']);
      business=value.data['articles'];
      emit(NewsgetBusinessSuccessStates());
    }).catchError((error){
      print('moooooooo${error.toString()}');
    emit(NewsgetBusinessErrorStates());
    });
  }

}