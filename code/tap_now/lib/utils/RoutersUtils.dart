import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tap_now/pages/Me.dart';
import 'package:tap_now/pages/Overview.dart';
import 'package:tap_now/pages/Home.dart';
import 'package:tap_now/pages/Weather.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String overview = "/overview";
  static String me = "/me";
  static String weather = "/weather";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");

      return;
    });

    var rootHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Overview();
    });

    var homeHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Home();
    });

    var overviewHandle = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Overview();
    });

    var meHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Me();
    });

    var weatherHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Weather();
    });

    router.define(root, handler: rootHandler);
    router.define(home, handler: homeHandler);
    router.define(overview, handler: overviewHandle);
    router.define(me, handler: meHandler);
    router.define(weather, handler: weatherHandler);
  }
}
