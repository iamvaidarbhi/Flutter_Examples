import 'package:flutter/material.dart';
import 'package:sharepref/displayid.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var db = SharedPreferences.getInstance();

  saveID(int c) async {
    var pref = await db;
    pref.setInt("id", c);
  }

  var id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: id,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.yellow,
                onPressed: () {
                  saveID(int.parse(id.text));
                  id.text = '';
                },
                child: Text("Save"),
              ),
              SizedBox(
                width: 10,
              ),
              FlatButton(
                  color: Colors.yellow,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => DisplayID()));
                  },
                  child: Text("Display"))
            ],
          )
        ],
      ),
    );
  }
}
