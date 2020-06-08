import 'package:flutter/material.dart';
import 'db.dart';

class ShowNotes extends StatefulWidget {
  @override
  _ShowNotesState createState() => _ShowNotesState();
}

class _ShowNotesState extends State<ShowNotes> {
  var db;
  @override
  void initState() {
    db = DBHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter SQFlite CRUD Demo"),
        ),
        body: FutureBuilder(
          future: db.getEmp(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].name),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            db.delEmp(snapshot.data[index].id);
                            setState(() {
                              db.getEmp();
                            });
                          }),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
