import 'package:dio/dio.dart';

import 'base_api_services.dart';


class NetworkApiService extends BaseAPIService {
  NetworkApiService._();
  static final NetworkApiService instance = NetworkApiService._();
  /// get simple api services
  Future getApiResponse(String url) async {
    try {
      var jsonResponse = await dio.get(url,);
      if (jsonResponse.statusCode == 200 || jsonResponse.statusCode == 201) {
        return jsonResponse.data;
      }
    } on DioError catch (error) {
      print('get data error: $error');
      // return jsonResponse;
    }
  }
  /// get query parameters api services
  Future getQueryApiResponse(String url, Map<String, dynamic> queryParameters) async {
    try {
      var jsonResponse = await dio.get(url,queryParameters: queryParameters);
      if (jsonResponse.statusCode == 200 || jsonResponse.statusCode == 201) {
        return jsonResponse.data;
      }
    } on DioError catch (error) {
      print('get query data error: $error');
      // return jsonResponse;
    }
  }

  Future postApiRequest(String url, body) async {
    try {
      // var postResponse = await call(wg, url, HttpMethods.POST.value, body);
      final postResponse = await dio.post(url, data: body);
      print('post response data: $postResponse');
      if (postResponse.statusCode == 200 || postResponse.statusCode == 201) {
        return postResponse.data;
      }
    } on DioError catch (error) {
      print('error occurred: $error');
    }
    // return jsonResponse;
  }

  Future postQueryApiRequest(String url, body, Map<String, dynamic> queryParameters) async {
    try {
      // var postResponse = await call(wg, url, HttpMethods.POST.value, body);
      final postResponse = await dio.post(url, data: body,queryParameters: queryParameters);
      print('post response data: $postResponse');
      if (postResponse.statusCode == 200 || postResponse.statusCode == 201) {
        return postResponse.data;
      }
    } on DioError catch (error) {
      print('error occurred: $error');
    }
    // return jsonResponse;
  }

  Future postWithOutBody(String url) async {
    try {
      final postResponse = await dio.post(url);
      print('sent email verification: $postResponse');

      if (postResponse.statusCode == 200 || postResponse.statusCode == 201) {
        return postResponse;
      }
    } catch (error) {
      print('post with out body error: $error');
    }
  }

  Future putApiRequest(String url, body) async {
    // try{
    final postResponse = await dio.put(
      url,
      data: body,
    );
    print('post response data: ${postResponse}');

    if (postResponse.statusCode == 200) {
      return postResponse.data;
    }
  }

  Future putApiRequestWithoutBody(String url) async {
    // try{
    final postResponse = await dio.put(
      url,
    );
    print('put without body response data: ${postResponse}');

    if (postResponse.statusCode == 200) {
      return postResponse.data;
    }
  }

  Future deleteApiRequest(String url) async {
    final postResponse = await dio.delete(
      url,
    );
    print('delete response data: ${postResponse}');

    if (postResponse.statusCode == 200 || postResponse.statusCode == 201) {
      return postResponse.data;
    }
  }

  Future patchApiRequest(String url, body) async {
    // try{
    final postResponse = await dio.patch(
      url,
      data: body,
    );
    if (postResponse.statusCode == 200 || postResponse.statusCode == 201) {
      return postResponse.data;
    }
  }
}