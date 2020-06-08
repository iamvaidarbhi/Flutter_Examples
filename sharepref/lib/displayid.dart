import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayID extends StatefulWidget {
  @override
  _DisplayIDState createState() => _DisplayIDState();
}

class _DisplayIDState extends State<DisplayID> {
  var db = SharedPreferences.getInstance();
  int id;

  Future<int> getID() async {
    var pref = await db;
    var id = pref.getInt("id");
    return id;
  }

  @override
  void initState() {
    getID().then((value) {
      setState(() {
        id = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(id.toString(), style: TextStyle(fontSize: 30))),
    );
  }
}
