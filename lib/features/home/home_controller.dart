import 'package:flutter/foundation.dart';

class HomeController extends ChangeNotifier {
  bool isTile = false;

  void toggleView() {
    isTile = !isTile;
    notifyListeners();
  }
}
