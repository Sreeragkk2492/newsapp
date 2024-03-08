import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetails extends StatelessWidget {
  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String contant;
  final String sourceName;
  final String url;
  NewsDetails(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.date,
      required this.description,
      required this.contant,
      required this.sourceName,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 48, 87),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text(sourceName,style: TextStyle(color: Colors.white),),
                Text(
                  '${DateFormat('dd/MM/yyyy').format(date!).toString() ?? ''}',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description,style: TextStyle(color: Colors.white,fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(contant,style: TextStyle(color: Colors.blue,fontSize: 13),),
          )
        ],
      )),
    );
  }
}
