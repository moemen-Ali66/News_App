import 'package:flutter/material.dart';

Widget buildItem()=> Padding(
  padding: const EdgeInsets.all(10.0),
  child: Row(
    children: [
      Container(
        height: 140,
        width: 120,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20.0) ,
          image:DecorationImage(
            image: NetworkImage("https://g.foolcdn.com/editorial/images/697217/man-in-specs-holding-a-smartphone.jpg"),
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
                child: Text('title',
                  style:
                  TextStyle(fontSize: 20,fontWeight: FontWeight.w700)
                  ,maxLines: 3,
                  overflow:TextOverflow.ellipsis,),
              ),
              Text('2022-08-21T13:15:01Z',style: TextStyle(color: Colors.grey),)
            ],
          ),
        ),
      ),
    ],
  ),
);