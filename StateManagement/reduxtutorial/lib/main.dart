import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  runApp(MyApp());
}

@immutable
class AppState {
  final counter;
  AppState(this.counter);
}

enum Actions { Increment }

AppState reducer(AppState prev, action) {
  if (action == Actions.Increment) {
    return AppState(prev.counter + 1);
  }
  return prev;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MyHomePageState(),
    );
  }
}

class _MyHomePageState extends StatelessWidget {
  final store = Store(reducer, initialState: AppState(0));
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Redux Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StoreConnector(
                  converter: (store) => store.state.counter,
                  builder: (context, counter) => Text(
                        "$counter",
                        style: Theme.of(context).textTheme.display1,
                      ))
            ],
          ),
        ),
        floatingActionButton: StoreConnector<int, VoidCallback>(
          converter: (store) {
            return () => store.dispatch(Actions.Increment);
          },
          builder: (context, callback) => FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
