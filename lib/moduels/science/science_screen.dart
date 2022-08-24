import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/remote/dio_helpers.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit= NewsCubit.get(context);
          dynamic list= NewsCubit.get(context).Science;
          return ConditionalBuilder(
            condition: true,
            builder:(context)=>ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder:(context,index){
                  return buildItem(list[index]);},
                separatorBuilder:(context,index) {
                  return myDivider();} ,
                itemCount: list.length),
            fallback:(context)=>Center(child: CircularProgressIndicator(backgroundColor: Colors.deepOrange,)),
          );
        },
      ),
    );
  }
}
