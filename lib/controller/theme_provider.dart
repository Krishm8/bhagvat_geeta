import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode theme=ThemeMode.light;

  void changetheme(){
    if(theme==ThemeMode.light){
      theme=ThemeMode.dark;
    }else{
      theme=ThemeMode.light;
    }
    notifyListeners();
  }
}