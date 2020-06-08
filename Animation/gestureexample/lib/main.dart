import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestures"),
        centerTitle: true,
      ),
      body: Center(
          child: GestureDetector(
        onLongPress: () {
          print("Clicked");
        },
        child: Container(
          height: 70.0,
          width: 100.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(17.0),
          ),
          child: Text("Click me"),
        ),
      )),
    );
  }
}
