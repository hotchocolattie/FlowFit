import 'package:flutter/foundation.dart';

class UserDataVariables extends ChangeNotifier {
  int age = 0;
  DateTime lastPeriod = DateTime.now();
  int avgPeriodLength = 0;
  int avgCycleLength = 0;

  void updateData(int newAge, DateTime newLastPeriod, int newAvgPeriodLength, int newAvgCycleLength) {
    age = newAge;
    lastPeriod = newLastPeriod;
    avgPeriodLength = newAvgPeriodLength;
    avgCycleLength = newAvgCycleLength;
    notifyListeners();
  }
}
