import 'package:dio/dio.dart';

class HomeServices{

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://flutter.prominaagency.com/api/',
    ),
  );


  Future<List<dynamic>> getMyGallery(String token) async {
    try {
      List<dynamic> data = [];
      dio.options.headers["Authorization"] = "Bearer $token" ;

      Response response = await dio.get('my-gallery');
      data = response.data["data"]['images'];
      print(data);
      return data ;
    }catch (e) {
      throw(e.toString());
    }
  }

}