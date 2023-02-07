import 'package:flutter/foundation.dart';

class ExampleOneProvider with ChangeNotifier {
  double _value = 1.0;

  double get value => _value;

  //onchanged:(val)
// passsing to this parameter

  void setValue(double val) {
    _value = val;
    notifyListeners();
  }
}
