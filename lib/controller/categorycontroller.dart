import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:http/http.dart' as http;

class Categorycontroller extends ChangeNotifier {
  List<String> categorylist = [
    'Business',
    'Entertainment',
    'general',
    'Health',
    'Science',
    'Sports',
    'Technology'
  ];

  String category = 'Business';

  onTap({required int index}) {
    category = categorylist[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  late Newsmodel newsmodel;
  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    // notifyListeners();
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=98542493c0fd4dfa8309c4fe51c7dae4');
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print('api failed');
    }
    newsmodel = Newsmodel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
