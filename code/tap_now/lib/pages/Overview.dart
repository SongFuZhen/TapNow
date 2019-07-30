import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

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
        height: double.infinity,
        width: double.infinity,
        child: Wrap(
          children: <Widget>[
            Container(
                height: 170,
                child: InAppWebView(
                  initialFile: 'assets/weather.html',
                  onWebViewCreated: (InAppWebViewController controller) {
                    webViewController = controller;
                  },
                )),
          ],
        ));
  }
}
