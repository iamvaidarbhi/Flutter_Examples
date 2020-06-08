import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.bars),
          onPressed: () {},
        ),
        title: Container(alignment: Alignment.center, child: Text("Tech Post")),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.newspaper,
                size: 20.0,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('post').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            const Text("Loading...!");
          } else {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot mypost = snapshot.data.documents[index];
                return Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 350.0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Material(
                              color: Colors.white,
                              elevation: 14.0,
                              shadowColor: Color(0x802196F3),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150.0,
                                        child: Image.network(
                                            '${mypost['image']}',
                                            fit: BoxFit.fill),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        '${mypost['title']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        '${mypost['subtitle']}',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.blueGrey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
