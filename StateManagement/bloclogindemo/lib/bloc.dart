import 'dart:async';

import 'package:bloclogindemo/validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators implements BaseBloc {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  StreamSink<String> get emailChange => _emailController.sink;
  StreamSink<String> get passwordChange => _passwordController.sink;
  Stream<String> get email => _emailController.stream.transform(emailValiator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValiator);

  Stream<bool> get submitCheck =>
      Rx.combineLatest2(email, password, (e, p) => true);

  submit() {}

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
