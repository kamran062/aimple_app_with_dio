import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';


import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';

import '../../utils/app_urls.dart';



abstract class BaseAPIService {
  // var globalContext = navigatorKey;
  String? accToken;
  String? refresh;

  /// instance of Dio
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrlsConstants.guestBaseUrl,
      //headers: {HttpHeaders.contentTypeHeader: 'application/json',HttpHeaders.authorizationHeader: "Bearer ${authUserModel?.token}"},
    ),
  );
  // final queue = Queue(delay: const Duration(milliseconds: 100));
  List<RequestOptions> futureCalls = [];

  initialize(String? access) {
    accToken = access;
    // dio.options.headers['Authorization'] = 'Bearer $access';
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer ${access}";
  }

  BaseAPIService() {
    var requestsLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    );
    /// add prettyDioLogger into dio interceptor
    dio.interceptors.add(
      requestsLogger,
    );


    // /// Interceptor wrappers
    // dio.interceptors.add(
    //     InterceptorsWrapper(
    //       onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    //         // Do something before request is sent.
    //         // If you want to resolve the request with custom data,
    //         // you can resolve a `Response` using `handler.resolve(response)`.
    //         // If you want to reject the request with a error message,
    //         // you can reject with a `DioError` using `handler.reject(dioError)`.
    //         return handler.next(options);
    //       },
    //       onResponse: ( response,  handler) {
    //         // Do something with response data.
    //         // If you want to reject the request with a error message,
    //         // you can reject a `DioError` object eg: `handler.reject(dioError)`.
    //         return handler.next(response);
    //       },
    //       /// On Dio Error
    //       onError: (error, handler) {
    //         print('on base services error handler: data: ${error.response?.data}, status: ${error.response?.statusCode}');
    //         if (error.response?.statusCode == 412) {
    //           Provider.of<AuthNotifier>(globalContext.currentContext!, listen: false)
    //               .setLoading(false);
    //
    //           if (error.response!.data["detail"]!.toString() == "Invalid code") {
    //             print("setting the pin code visibility to true");
    //             Provider.of<AuthNotifier>(globalContext.currentContext!, listen: false)
    //                 .setPinCodeVisible(true);
    //           }
    //         }
    //         /// 401 is thrown when access token is expired.
    //         else if (error.response?.statusCode == 401) {
    //           Utils.flutterErrorToastMessage(error.response?.data["message"]);
    //
    //         } else if (error.response?.statusCode == 400) {
    //           Provider.of<AuthNotifier>(globalContext.currentContext!, listen: false)
    //               .setLoading(false);
    //           print('on 400 error: ${error.response?.data["message"]}');
    //           Utils.flutterErrorToastMessage(error.response?.data["message"]);
    //         } else if (error.response?.statusCode == 409) {
    //           Provider.of<AuthNotifier>(globalContext.currentContext!, listen: false)
    //               .setLoading(false);
    //           Utils.flutterErrorToastMessage(error.response?.data["message"]);
    //         } else if (error.response?.statusCode == 403) {
    //           Provider.of<AuthNotifier>(globalContext.currentContext!, listen: false)
    //               .setLoading(false);
    //           Utils.flutterErrorToastMessage(error.response?.data["message"]);
    //         } else if (error.response?.statusCode == 500) {
    //           Provider.of<AuthNotifier>(globalContext.currentContext!, listen: false)
    //               .setLoading(false);
    //           Utils.flutterErrorToastMessage('Internal Server Error');
    //         }else if (error.response?.statusCode == 503) {
    //           Provider.of<AuthNotifier>(globalContext.currentContext!, listen: false)
    //               .setLoading(false);
    //           Utils.flutterErrorToastMessage('Internal Server Error');
    //         }
    //
    //         return handler.next(error);
    //       },
    //     ),
    // );
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    print('trying to retry the previous calls ');
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}



