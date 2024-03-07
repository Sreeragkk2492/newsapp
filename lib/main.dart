import 'package:flutter/material.dart';
import 'package:newsapp/controller/bottomnavvontroller.dart';
import 'package:newsapp/controller/categorycontroller.dart';
import 'package:newsapp/controller/homescreencontroller.dart';
import 'package:newsapp/controller/splashprovider.dart';
import 'package:newsapp/view/bottomnavbar.dart';

import 'package:newsapp/view/splash.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
      create: (context) => SplashProvider(),),
       ChangeNotifierProvider(
      create: (context) => Bottomnavcontroller(),),
        ChangeNotifierProvider(
      create: (context) => Homescreencontroller(),),
       ChangeNotifierProvider(
      create: (context) => Categorycontroller(),), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Consumer<SplashProvider>(
          builder: (context, splashProvider, child) {
           
            return splashProvider.isSplashDone ?const Bottomnavpage() :const Splashnews();
  }),
      )
    );
  }
}
