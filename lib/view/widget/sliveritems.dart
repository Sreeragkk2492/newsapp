import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/categorycontroller.dart';
import 'package:newsapp/view/widget/carouselslider.dart';
import 'package:newsapp/view/widget/newscard.dart';
import 'package:newsapp/view/widget/tabbarview.dart';
import 'package:provider/provider.dart';

class SliversItem extends StatelessWidget {
  const SliversItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Courousal(),
        SizedBox(
          height: 10,
        ),
        Tabbarview(),
        categorycnsumer(),
        
      ],
    );
  }
  
  categorycnsumer() {
    return  Consumer<Categorycontroller>(
                  builder: (context, value, child) {
                    return value.isLoading == true
                        ? Center(
                        child: LottieBuilder.asset(
                          'assets/animations/Animation - 1709635374301.json',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                                                  )
                        : Container(
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: value.newsmodel.articles?.length,
                              itemBuilder: (context, index) => Newscard(
                                  title: value.newsmodel.articles?[index].title
                                          .toString() ??
                                      '',
                                  description: value.newsmodel
                                          .articles?[index].description
                                          .toString() ??
                                      '',
                                  date: value
                                      .newsmodel.articles?[index].publishedAt,
                                  imageUrl: value.newsmodel.articles?[index]
                                          .urlToImage
                                          .toString() ??
                                      '',
                                  contant: value.newsmodel.articles?[index].content.toString() ?? '',
                                  sourceName: value.newsmodel.articles?[index].source?.name.toString() ?? '',
                                  url: value.newsmodel.articles?[index].url.toString() ?? '')),
                        );
                  },
                );
  }
}
