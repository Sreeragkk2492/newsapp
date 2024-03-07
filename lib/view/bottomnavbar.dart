import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/controller/bottomnavvontroller.dart';
import 'package:newsapp/view/utils/colors.dart';
import 'package:provider/provider.dart';

class Bottomnavpage extends StatelessWidget {
  const Bottomnavpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Provider.of<Bottomnavcontroller>(context)
          .mypages[Provider.of<Bottomnavcontroller>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
          child: BottomNavigationBar(
            backgroundColor: Mycolors.secondarycolor,
            selectedItemColor: Mycolors.bgcolor,
            unselectedLabelStyle: TextStyle(color: Mycolors.textcolor),
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(color: Mycolors.textcolor),
            unselectedItemColor: Mycolors.textcolor,
            currentIndex:
                Provider.of<Bottomnavcontroller>(context).selectedIndex,
            onTap: Provider.of<Bottomnavcontroller>(context, listen: false)
                .onItemTap,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.house), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.pagelines), label: 'category'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.searchengin), label: 'search')
            ],
          ),
        ),
      ),
    );
  }
}
