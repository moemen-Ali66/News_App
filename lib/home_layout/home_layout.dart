import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/moduels/Search/Search_Screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
class home_layout extends StatelessWidget {
  const home_layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(

      listener: (context,state){},
      builder: (context,state){
      var cubit = NewsCubit.get(context);
        return Scaffold(
        appBar: AppBar(
          title: Text('NewsApp'),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(BuildContext context){
                return  SearchScreen();
              }));
            }, icon: Icon(Icons.search)),
            IconButton(onPressed: (){
              cubit.Changemode();
            }, icon: Icon(Icons.brightness_4_outlined)),
          ],
        ),
          body: cubit.Screens[cubit.curentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.curentindex,
            items:cubit.bottomItem,
            onTap: (index){
              cubit.ChangeBottomNav(index);
          },),
        );},
    );
  }
}
