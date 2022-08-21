import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class DioHelper{
  static Dio? dio ;
  static init(){
    dio=Dio(
      BaseOptions(
      baseUrl:'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ),
    );
  }
  static Future<Response> getData(
      {
        required String url ,
        required Map<String,dynamic> ? query,
      })async{
    return await dio!.get(
        url,
        queryParameters: query);

  }
}
//*****************************************************************

// POST
// UPDATE
// DELETE
//
// GET
//
// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca
//*****************************************************************
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// class DioHelper {
//   static Dio ?dio;
//
//   static init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://newsapi.org/',
//         receiveDataWhenStatusError: true,
//       ),
//     );
//   }
//
//   static Future<Response> getData({
//     required String url,
//     Map<String, dynamic>? query,
//     // String lang = 'en',
//     // String ?token,
//   }) async
//   {
//     // dio?.options.headers =
//     // {
//     //   'lang':lang,
//     //   'Authorization': token??'',
//     //   'Content-Type': 'application/json',
//     // };
//     return await dio!.get(
//       url,
//       queryParameters: query,
//     );
//   }

//}


