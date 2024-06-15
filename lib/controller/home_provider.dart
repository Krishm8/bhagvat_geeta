import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeProvider extends ChangeNotifier {
  List clist = [];

  void jfun() async {
    String data = await rootBundle.loadString("assets/chapters.json");
    Map<String, dynamic> jdata = jsonDecode(data);
    clist = jdata["chapters"];
    notifyListeners();
  }

  List favorite=[];
  IconData favbutton=Icons.favorite_border;
}
