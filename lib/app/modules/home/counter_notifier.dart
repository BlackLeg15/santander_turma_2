import 'package:flutter/foundation.dart';

class CounterNotifier extends ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }
}
