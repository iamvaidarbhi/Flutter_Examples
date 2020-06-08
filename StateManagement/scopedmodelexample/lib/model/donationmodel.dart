import 'package:scoped_model/scoped_model.dart';

class DonationModel extends Model {
  int _count = 0;
  bool _donateClicked = false;

  get count => _count;
  get donClicked => _donateClicked;

  set donClicked(bool donate) {
    if (donate == null) {
      throw new ArgumentError();
    }
    _donateClicked = donate;
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
