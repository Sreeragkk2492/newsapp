import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newsapp/model/newsmodel.dart';

class SearchControllerScreen extends ChangeNotifier {
  Newsmodel? newsmodel;
  bool isLoading = false;
  Future<void> searchData({required String searchText}) async {
    isLoading = true;
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=98542493c0fd4dfa8309c4fe51c7dae4');
    try {
      final response =
          await http.get(url, headers: {'Content-type': 'application/json'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsmodel = Newsmodel.fromJson(decodedData);
      } else {
        print('api failed');
      }
    } catch (e) {
      print(e);
    }finally{
      isLoading=false;
      notifyListeners();
    }
  }
}
