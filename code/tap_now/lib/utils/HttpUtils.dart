import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tap_now/utils/ApplicationUtils.dart';

class HttpUtils {
  static HttpUtils instance;
  static String token;
  static Dio _dio = Application.dio;

  static HttpUtils getInstance() {
    print("getInstance");
    if (instance == null) {
      instance = new HttpUtils();
    }

    return instance;
  }

  HttpUtils() {
    // 初始化 Options
    _dio.options.connectTimeout = 300000;
    _dio.options.receiveTimeout = 300000;
    _dio.options.contentType =
        ContentType.parse("application/json; charset=utf-8");

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // get token
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // options.headers["Authorization"] =
      //     await prefs.get(SharedPreUtils.loginToken);
      print(options.baseUrl);
      return options;
    }, onResponse: (Response response) {
      print(response.statusCode);

      return response; // continue
    }, onError: (DioError e) {
      print(e);
      return e; //continue
    }));

    _dio.interceptors.add(LogInterceptor(responseBody: true)); //开启请求日志
  }

  // get 请求封装
  get(url, {options, cancelToken, data = Null}) async {
    print('post请求::: url：$url ,body: $data, 开始时间: ' +
        new DateTime.now().toString());

    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: data != Null ? data : {}, cancelToken: cancelToken);

      print('post请求结束, $response, 结束时间: ' + new DateTime.now().toString());
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      } else {
        print('get请求发生错误：$e');
      }
    }
    return response;
  }

  // post请求封装
  post(url, {options, cancelToken, data = Null}) async {
    print(
        '---------------------------------post请求::: url：$url ,body: $data, 开始时间: ' +
            new DateTime.now().toString());

    Response response;

    try {
      response = await _dio.post(url,
          data: data != Null ? data : {}, cancelToken: cancelToken);

      print('----------------------------------post请求结束, $response, 结束时间: ' +
          new DateTime.now().toString());
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      } else {
        print('post请求发生错误：$e');
      }
    }

    return response;
  }
}
