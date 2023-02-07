import 'package:flutter/foundation.dart';

//Changenotifier acts as a setstate for you and acts as a global context notifier

class CountProvider with ChangeNotifier {
  int _count = 50;
  int get count => _count;

  void setCount() {
    _count++;
    notifyListeners();
  }
}
