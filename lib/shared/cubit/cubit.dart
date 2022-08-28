import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/moduels/business/business_screen.dart';
import 'package:news_app/moduels/science/science_screen.dart';
import 'package:news_app/moduels/setting/setting_screen.dart';
import 'package:news_app/moduels/sports/sports_screen.dart';
import 'package:news_app/network/local/Cache_Helper.dart';
import 'package:news_app/network/local/Cache_Helper.dart';
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
  void getbusiness()
  {
    emit(NewsgetBusinessLoadingStates());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'business',
        'apiKey':'839f8b514c5644f496f9a60b15c0951f',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsgetBusinessSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsgetBusinessErrorStates());
    });
  }
  List Sports=[];
  void getSports()
  {
    emit(NewsgetSportsLoadingStates());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'sports',
        'apiKey':'839f8b514c5644f496f9a60b15c0951f',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      Sports = value.data['articles'];
      print(Sports[0]['title']);

      emit(NewsgetSportsSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsgetSportsErrorStates());
    });
  }
  List Science=[];
  void getScience()
  {
    emit(NewsgetScienceLoadingStates());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'science',
        'apiKey':'839f8b514c5644f496f9a60b15c0951f',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      Science = value.data['articles'];
      print(Science[0]['title']);

      emit(NewsgetScienceSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsgetScienceErrorStates());
    });
  }
  bool isdark=false;
  void Changemode({bool ? fromshared}){
    if(fromshared != null){
      isdark = fromshared;

    }
    else
    isdark = !isdark;
    CacheHelper.PutData(Key: 'isdark', value: isdark).then((value)
    => emit(ChangeModeStates()),
    );


}
}