import 'package:flutter/material.dart';

class CashPageMoneyState with ChangeNotifier {
  String amount = "0";

  String get amnt => amount;

  add({required String value}) {
    if (amount.length == 1 && amount.contains("0")) {
      amount = '';
      amount += value;
      print("amount length 0: $amount");
      // notifyListeners();
    } else {
      amount += value;
      print("Adding amount $amount");
      // notifyListeners();
    }
  }

  delete() {
    if (amount.length == 1 && amount.contains("0")) {
      amount = '0';
      // notifyListeners();
    } else {
      if (amount.isNotEmpty) {
        amount = amount.substring(0, amount.length - 1);
        print(amount);
        // notifyListeners();
      } else {
        amount = '0';
        // notifyListeners();
      }
    }
  }
}
