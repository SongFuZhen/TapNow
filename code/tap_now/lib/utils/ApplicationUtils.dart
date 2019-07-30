import 'package:fluro/fluro.dart';
import 'package:dio/dio.dart';
import 'package:package_info/package_info.dart';

class Application {
  static Router router; // 全局路由
  static Dio dio; // 全局网络

  static PackageInfo packageInfo; //全局 package info
}
