import 'package:flutter/material.dart';
import 'package:todo/model/task.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentMode = ThemeMode.light;
  void changTheme(ThemeMode newMode) {
    currentMode == newMode;
    notifyListeners();
  }

  void getMainBackground() {
    currentMode == ThemeMode.light ? ThemeData.light() : ThemeData.dark();
  }
  void makeIsdoneInProvider(Task task){
    makeIsdoneInProvider(task);
  }
  void editTaskInProvider(Task task){
    editTaskInProvider(task);

  }
}

