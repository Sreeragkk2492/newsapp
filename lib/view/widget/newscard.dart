import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/view/utils/colors.dart';
import 'package:intl/intl.dart';

class Newscard extends StatelessWidget {
  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String contant;
  final String sourceName;
  final String url;
  const Newscard(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.imageUrl,
      required this.contant,
      required this.sourceName,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(color: Mycolors.textcolor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${sourceName}|${DateFormat('dd/MM/yyyy').format(date!).toString() ?? ''}',
                  style: TextStyle(color: Mycolors.textcolor),
                ),
                IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.share))
              ],
            )
          ],
        ),
      ),
    );
  }
}
