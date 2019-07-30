import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingUtils extends StatefulWidget {
  final bool loading;
  final Widget child;
  LoadingUtils({Key key, @required this.loading, @required this.child})
      : assert(child != null),
        assert(loading != null),
        super(key: key);

  @override
  _LoadingUtilsState createState() => _LoadingUtilsState();
}

class _LoadingUtilsState extends State<LoadingUtils>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    animationController.forward(); //启动动画
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(widget.child);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reset();
        animationController.forward();
      }
    });

    if (widget.loading) {
      widgetList.add(Container(
          color: Color.fromRGBO(255, 255, 255, 0.8),
          child: Center(
              child: RotationTransition(
            turns: animationController,
            child: Image.asset('assets/loading.png'),
          ))));
    }

    return Stack(
      children: widgetList,
    );
  }
}
