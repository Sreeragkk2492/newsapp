import 'package:flutter/material.dart';
import 'package:newsapp/view/categoryscreen.dart';
import 'package:newsapp/view/homescreen.dart';
import 'package:newsapp/view/searchscreen.dart';

class Bottomnavcontroller extends ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> mypages = [HomeScreen(), Categoryscreen(), Searchscreen()];
}
