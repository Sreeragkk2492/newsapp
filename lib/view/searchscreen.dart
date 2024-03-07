import 'package:flutter/material.dart';
import 'package:newsapp/view/utils/colors.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.black, 
      appBar:  AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        elevation: 10, 
        backgroundColor: Mycolors.secondarycolor,
        centerTitle: true,
        title: Text('WaveNews',style: TextStyle(color: Mycolors.textcolor),),), 
    );
  }
}