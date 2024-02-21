import 'package:flutter/material.dart';

class AllProvider extends ChangeNotifier {
  int point = 0;
  int count = 30;

  setStart() {
    point = 0;
    count = 30;
    notifyListeners();
  }

  addPoint() {
    point += 1;
    notifyListeners();
  }

  minusCount() {
    count -= 1;
    notifyListeners();
  }
}
