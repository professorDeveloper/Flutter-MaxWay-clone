
import 'package:dio/dio.dart';
import 'package:maxway_clone/di/di.dart';
import 'package:maxway_clone/models/Categories.dart';

class CategoryAndProductApi{
   final Dio _dio;

  CategoryAndProductApi(  this._dio);

 Future<List<Categories>> categoryList() async{
    await Future.delayed(Duration(seconds: 2));
    final response = await Dio().get("https://maxway.uz/_next/data/ch7KmKvJ5azfPmlISTmjb/uz.json");


    return (response.data["pageProps"]["categories"] as List).map((e) => Categories.fromJson(e)).toList();
}


}