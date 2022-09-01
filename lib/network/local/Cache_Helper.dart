import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences;

  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
   }
   static Future<bool> PutData ({
  required String Key,
  required bool value,
})async{
  return await  sharedPreferences!.setBool(Key, value);
   }
  static dynamic GetData ({
    required String Key,
  }){
    return sharedPreferences!.getBool(Key);

  }
}