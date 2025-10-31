import 'package:dio/dio.dart';
import 'package:marketnest/core/constants/ApiUrlConstants.dart';

import 'dio_client.dart';

class Services {
  DioClient? dioClient;

  Services() {
    var dio = Dio();
    dioClient = DioClient(dio);
  }

  Future getProducts(Map<String, dynamic> query) async {
    try {
      var url = ApiUrlConstants.getProducts;
      var response = await dioClient?.get(url, queryParameters: query);
      // debugPrint(response["message"]);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!;
      } else {
        throw Exception("An error occurred.");
      }
    }
  }
}
