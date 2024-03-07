import 'package:flutter/material.dart';
import 'package:newsapp/controller/splashprovider.dart';
import 'package:newsapp/view/utils/colors.dart';
import 'package:provider/provider.dart';

class Splashnews extends StatelessWidget {
  const Splashnews({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Provider.of<SplashProvider>(context, listen: false).completeSplash();
    });
    return Scaffold(
      backgroundColor: Mycolors.secondarycolor,
      body: Center(
          child: Text(
        'WaveNews',
        style: TextStyle(
            color: Mycolors.textcolor,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
