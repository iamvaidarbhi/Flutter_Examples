import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation flipanim;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    flipanim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.5, curve: Curves.linear)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flip Animation"),
      ),
      body: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) {
            return Center(
                child: InkWell(
              onTap: () {
                controller.repeat();
              },
              child: Container(
                  height: 200.0,
                  width: 200.0,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.005)
                      ..rotateX(2 * pi * flipanim.value),
                    alignment: Alignment.center,
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.green.withOpacity(0.2),
                      child: Center(
                          child: Text(
                        "This flips",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      )),
                    ),
                  )),
            ));
          }),
    );
  }
}
