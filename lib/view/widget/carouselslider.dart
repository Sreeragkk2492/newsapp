import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newsapp/controller/homescreencontroller.dart';
import 'package:provider/provider.dart';

class Courousal extends StatelessWidget {
  const Courousal({super.key});
  fetchdata(BuildContext context){
   Provider.of<Homescreencontroller>(context,listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
   //fetchdata(context);
    return Consumer<Homescreencontroller>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: CarouselSlider.builder(
              itemCount: value.newsmodel.articles?.length,
              itemBuilder: (context, index, realindex) => Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: NetworkImage(
                                value.newsmodel.articles?[index].urlToImage
                                        .toString() ??
                                    '',
                              ),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      left: 15,
                      bottom: 10,
                      child: Text(
                        value.newsmodel.articles?[index].source?.name.toString() ?? '',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
              options: CarouselOptions(
                pageSnapping: true,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                autoPlay: true,
              )),
        );
      },
    );
  }
}
