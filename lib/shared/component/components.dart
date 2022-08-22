import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


Widget buildItem(article)=> Padding(
  padding: const EdgeInsets.all(10.0),
  child: Row(
    children: [
      Container(
        height: 140,
        width: 120,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20.0) ,
          image:DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit:BoxFit.cover,
          ),
        ),),
      SizedBox(width: 20,),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text('${article['title']}',
                  style:
                  TextStyle(fontSize: 20,fontWeight: FontWeight.w700)
                  ,maxLines: 3,
                  overflow:TextOverflow.ellipsis,),
              ),
              Text('${article['publishedAt']}',style: TextStyle(color: Colors.grey),)
            ],
          ),
        ),
      ),
    ],
  ),
);
Widget myDivider()=>Padding(
  padding: const EdgeInsets.only(left: 10),
  child:   Container(
    width:double.infinity,
    height: 1,
    color: Colors.grey,

  ),
);
