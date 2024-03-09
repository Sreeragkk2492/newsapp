import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sliverappbar extends StatelessWidget {
  const Sliverappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 1, 48, 87),
      title:const Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: TextStyle(
                  wordSpacing: 1,
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Explore the world by one tap',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
       // expandedHeight: 100,
      // bottom: PreferredSize(preferredSize: Size(100, 100), child: Container(
      //   child: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: TextField(
      //       decoration: InputDecoration(
      //   filled: true,
      //   fillColor: Colors.blue,
      //   hintText: 'Search News',
      //   hintStyle: TextStyle(color: Colors.white),
      //   suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,),
      //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)
      //       ),
      //     ),
      //   ),
      // )),
      
     bottom: PreferredSize(
      preferredSize: Size.fromHeight(80),
       child: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 48, 87)  ,
        title: TextField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            
            fillColor: Color.fromARGB(255, 2, 106, 190),
            hintText: 'Search news',
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: InkWell(
              onTap: () {
                
              },
              child: Icon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,)),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(45))
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.bars,color: Colors.white,)) 
        ],
       ),
     ),
     );
    
  }
}
