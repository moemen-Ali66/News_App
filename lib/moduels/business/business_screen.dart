import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/remote/dio_helpers.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class BusinessScrren extends StatelessWidget {
  const BusinessScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('NewsApp'),
      //   actions: [
      //     IconButton(onPressed: (){}, icon: Icon(Icons.search))
      //   ],
      // ),
      body:BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
         dynamic list= NewsCubit.get(context).business;
          return ConditionalBuilder(
              condition: list.length==0,
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
