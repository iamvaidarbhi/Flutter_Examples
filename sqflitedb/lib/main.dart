import 'package:flutter/material.dart';
import 'package:sqflitedb/Emp.dart';
import 'package:sqflitedb/db.dart';
import 'package:sqflitedb/shownotes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SqFlite Database Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  var db;

  @override
  void initState() {
    db = DBHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: name,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    db.saveData(Emp(name: name.text));
                    name.text = '';
                  },
                  child: Text("Add"),
                ),
                SizedBox(
                  width: 20,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ShowNotes()));
                  },
                  child: Text('Show Notes'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
