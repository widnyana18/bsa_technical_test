import 'package:flutter/material.dart';

class ArithmeticProvider extends ChangeNotifier {
  bool sumMode = true;
  bool multipleMode = false;
  double firstNum = 0;
  double secondNum = 0;
  double result = 0;

  bool get isInputValid => firstNum != 0 && secondNum != 0;

  void firstNumChanged(String? numberString) {
    if (numberString != null && numberString != '') {
      final number = double.tryParse(numberString);
      firstNum = number!;
    }
    notifyListeners();
  }

  void secondNumChanged(String? numberString) {
    if (numberString != null && numberString != '') {
      final number = double.tryParse(numberString);
      secondNum = number!;
    }
    notifyListeners();
  }

  void sumModeChanged(bool? state) {
    sumMode = state!;
    multipleMode = false;
    notifyListeners();
  }

  void multipleModeChanged(bool? state) {
    multipleMode = state!;
    sumMode = false;
    notifyListeners();
  }

  void runOperation() {
    if (sumMode) {
      result = firstNum + secondNum;
    } else {
      result = firstNum * secondNum;
    }
    notifyListeners();
  }
}
