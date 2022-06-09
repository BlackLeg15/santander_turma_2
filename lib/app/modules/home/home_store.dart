import 'package:flutter/foundation.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, int> {
  HomeStore() : super(0);

  void increment() {
    update(state + 1);
  }
}

class HomeChangeNotifier extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}
