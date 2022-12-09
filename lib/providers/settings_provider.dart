import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode currentMode=ThemeMode.light;
  void changTheme(ThemeMode newMode){
    currentMode==newMode;
    notifyListeners();
  }
void getMainBackground(){
    currentMode== ThemeMode.light
        ?ThemeData.light()
        :ThemeData.dark();
}
}
