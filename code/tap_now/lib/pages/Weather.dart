import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("天气预报"),
        ),
        body: Container(
          child: InAppWebView(
            initialUrl:
                "https://widget-page.heweather.net/h5/index.html?bg=1&md=0123456&lc=auto&key=d771865605bd43039a06f31aeb059ab0",
          ),
        ));
  }
}
