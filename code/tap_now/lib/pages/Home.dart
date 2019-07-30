import 'package:flutter/material.dart';
import 'package:tap_now/pages/Me.dart';
import 'package:tap_now/pages/Overview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;
  int _tabIndex = 0;
  var _bodys;

  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    _bodys = [new Overview(), new Me()];

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text("一触即达"),
          centerTitle: true,
        ),
        body: _bodys[_tabIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("总览")),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我")),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      ),
    );
  }
}
