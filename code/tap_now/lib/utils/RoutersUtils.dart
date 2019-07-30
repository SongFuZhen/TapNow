import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tap_now/pages/Me.dart';
import 'package:tap_now/pages/Overview.dart';
import 'package:tap_now/pages/Home.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String overview = "/overview";
  static String me = "/me";

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

    router.define(root, handler: rootHandler);
    router.define(home, handler: homeHandler);
    router.define(overview, handler: overviewHandle);
    router.define(me, handler: meHandler);
  }
}
