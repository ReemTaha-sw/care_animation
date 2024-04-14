import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int selectedIndex = 0;
  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isTopDoorLock = true;
  bool isBackDoorLock = true;

  void onSelecte(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void updateTopDoorLock() {
    isTopDoorLock = !isTopDoorLock;
    notifyListeners();
  }

  void updateBAckDoorLock() {
    isBackDoorLock = !isBackDoorLock;
    notifyListeners();
  }
}
