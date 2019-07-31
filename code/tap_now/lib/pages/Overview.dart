import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:tap_now/utils/ApplicationUtils.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  InAppWebViewController webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("reload");
          webViewController.reload();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildPage() {
    return Container(
        child: Wrap(
      children: <Widget>[
        Container(
            child: Row(
          children: <Widget>[
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 100,
              child: InAppWebView(
                initialFile: 'assets/min_weather.html',
                onWebViewCreated: (InAppWebViewController controler) {
                  webViewController = controler;
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Application.router.navigateTo(context, '/weather');
              },
              child: Text("Detail"),
            )
          ],
        )),
      ],
    ));
  }
}
