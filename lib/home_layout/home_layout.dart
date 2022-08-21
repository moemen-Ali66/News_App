import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
class home_layout extends StatelessWidget {
  const home_layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getbusiness(),
      child: BlocConsumer<NewsCubit,NewsStates>(

        listener: (context,state){},
        builder: (context,state){
        var cubit = NewsCubit.get(context);
          return Scaffold(
          appBar: AppBar(
            title: Text('NewsApp'),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search))
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
      ),
    );
  }
}
