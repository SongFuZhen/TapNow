import 'package:catcher/catcher_plugin.dart';
import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tap_now/pages/Home.dart';

import 'package:tap_now/utils/ApplicationUtils.dart';
import 'package:tap_now/pages/Me.dart';
import 'package:tap_now/pages/Overview.dart';

import "package:tap_now/utils/RoutersUtils.dart";

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppPageState();
  }
}

class _AppPageState extends State<App> {
  void initState() {
    super.initState();
  }

  _AppPageState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    Application.dio = new Dio();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: Catcher.navigatorKey,
      // builder: (BuildContext context, Widget widget) {
      //   Catcher.addDefaultErrorWidget(
      //     showStacktrace: true,
      //     customTitle: "错误页面",
      //     customDescription: "错误啦",
      //   );

      //   return widget;
      // },
      theme: new ThemeData(
          brightness: Brightness.light, primaryColor: Colors.white),
      home: Home(),
      routes: {
        '/home': (BuildContext context) => new Home(),
        '/overview': (BuildContext context) => new Overview(),
        '/me': (BuildContext context) => new Me(),
      },
      onGenerateRoute: Application.router.generator,
      // localizationsDelegates: [
      //   FlutterI18nDelegate(
      //       useCountryCode: false, fallbackFile: 'zh', path: 'assets/locales'),
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate
      // ],
    );
  }
}
