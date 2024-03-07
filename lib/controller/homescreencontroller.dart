import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Homescreencontroller extends ChangeNotifier {
 late Newsmodel newsmodel; 
  bool isLoading = false;

  //to process api and get response

  fetchdata() async {
    isLoading = true;
   // notifyListeners();
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=98542493c0fd4dfa8309c4fe51c7dae4');
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodeData = {};
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
    } else {
      print('api failed');
    }
    newsmodel = Newsmodel.fromJson(decodeData);
    isLoading = false;
    notifyListeners();
  }

  Future<void> launchURL(String url) async {
    final Uri url1 = Uri.parse(url);
    try {
      if (await launchUrl(url1, mode: LaunchMode.inAppWebView)) {
        await launchUrl(url1, mode: LaunchMode.inAppWebView);
      } else {
        throw 'could not launch url';
      }
    } catch (e) {
      throw e;
    }
  }
}
