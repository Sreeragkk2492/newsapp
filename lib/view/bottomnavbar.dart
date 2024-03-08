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
      backgroundColor: Color.fromARGB(255, 1, 48, 87), 
      body: Provider.of<Bottomnavcontroller>(context)
          .mypages[Provider.of<Bottomnavcontroller>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Color.fromARGB(255, 1, 102, 184)),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 2, 106, 190),
            selectedItemColor: Colors.lightBlueAccent,
            unselectedLabelStyle: TextStyle(color: Colors.black), 
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(color: Colors.lightBlue),
            unselectedItemColor: Mycolors.textcolor,
            currentIndex:
                Provider.of<Bottomnavcontroller>(context).selectedIndex,
            onTap: Provider.of<Bottomnavcontroller>(context, listen: false)
                .onItemTap,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.house,), label: ''),
              // BottomNavigationBarItem(
              //     icon: Icon(FontAwesomeIcons.magnifyingGlass), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.bookmark), label: '' )
            ],
          ),
        ),
      ),
    );
  }
}
