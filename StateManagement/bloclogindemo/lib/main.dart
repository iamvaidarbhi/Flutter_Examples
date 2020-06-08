import 'package:bloclogindemo/bloc.dart';
import 'package:bloclogindemo/pagetwo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _MyHomePageState(),
    );
  }
}

class _MyHomePageState extends StatelessWidget {
  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC Pattern"),
      ),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String>(
              stream: bloc.email,
              builder: (context, snapshot) => TextField(
                onChanged: (s) => bloc.emailChange.add(s),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter an Email",
                    labelText: "Email",
                    errorText: snapshot.error),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            StreamBuilder<String>(
              stream: bloc.password,
              builder: (context, snapshot) => TextField(
                onChanged: (s) => bloc.passwordChange.add(s),
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                    labelText: "Password",
                    errorText: snapshot.error),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            StreamBuilder<bool>(
              stream: bloc.submitCheck,
              builder: (context, snapshot) => RaisedButton(
                  color: Colors.purple[100],
                  onPressed:
                      snapshot.hasData ? () => changeThePage(context) : null,
                  child: Text("Submit")),
            )
          ],
        ),
      )),
    );
  }
}
