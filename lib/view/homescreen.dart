import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/categorycontroller.dart';
import 'package:newsapp/controller/homescreencontroller.dart';
import 'package:newsapp/view/widget/carouselslider.dart';
import 'package:newsapp/view/widget/newscard.dart';
import 'package:newsapp/view/widget/sliverappbar.dart';
import 'package:newsapp/view/widget/tabbarview.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void fetchdata(BuildContext context) {
    Provider.of<Homescreencontroller>(context, listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    fetchdata(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 48, 87),
        body: Consumer<Homescreencontroller>(
          builder: (context, value, child) {
            return CustomScrollView(
              slivers: [
                SliverAppbar(),
                
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(child: Courousal()),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Tabbarview(),
                ),
                Consumer<Categorycontroller>(
                  builder: (context, value, child) {
                    return value.isLoading == true
                        ? SliverToBoxAdapter(
                            child: Center(
                            child: LottieBuilder.asset(
                              'assets/animations/Animation - 1709635374301.json',
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            ),
                          ))
                        : SliverToBoxAdapter(
                            child: Container(
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
                            ),
                          );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
