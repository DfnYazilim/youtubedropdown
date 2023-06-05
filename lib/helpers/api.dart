import 'package:dio/dio.dart';

class Api {
  static const baseUrl = 'https://youtube.kaposoft.site/api/';
  Future<Response?> dioGet({required String url})async{
    try{
      final result = await Dio().get(baseUrl + url);
      return result;
    } on DioError catch (err){
      return err.response;
    }
  }
}