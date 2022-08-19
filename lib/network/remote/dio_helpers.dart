import 'package:dio/dio.dart';
class DioHelper{
  static Dio? dio ;
  static init(){
    dio=Dio(BaseOptions(
      baseUrl:'https://newsapi.org/' ,
      receiveDataWhenStatusError: true,
    ),);
    Future<Response> getdata({
      required url,
      required query,
    })async{
      return await dio!.get(url,queryParameters: query);

    }
  }

}






// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca