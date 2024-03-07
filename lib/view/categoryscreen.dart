import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/categorycontroller.dart';
import 'package:newsapp/view/utils/colors.dart';
import 'package:newsapp/view/widget/newscard.dart';
import 'package:provider/provider.dart';

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({super.key});

  void fetchdata(BuildContext context) {
    Provider.of<Categorycontroller>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchdata(context);
    return Consumer<Categorycontroller>(builder: (context, provider, child) {
      return DefaultTabController(
          length: provider.categorylist.length,
          initialIndex: 0,
          child: Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                // shape: RoundedRectangleBorder(
                //     borderRadius:
                //         BorderRadius.vertical(bottom: Radius.circular(40))),
                elevation: 10,
                backgroundColor: Mycolors.secondarycolor,
                centerTitle: true,
                title: Text(
                  'WaveNews',
                  style: TextStyle(color: Mycolors.textcolor),
                ),
                bottom: TabBar(
                    labelStyle: const TextStyle(
                    color: Mycolors.textcolor , fontWeight: FontWeight.w600),
                labelColor:Mycolors.textcolor,
                unselectedLabelColor: const Color(0xff6A3DE8),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
                unselectedLabelStyle: const TextStyle(
                    color: Mycolors.textcolor, 
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                overlayColor: const MaterialStatePropertyAll(Colors.grey),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Mycolors.bgcolor,
                // indicator: BoxDecoration(
                //     color: Mycolors.bgcolor,
                //     ),
               isScrollable: true, 
                  tabs: List.generate(
                      provider.categorylist.length,
                      (index) => Tab(
                            text: provider.categorylist[index],
                          )),
                  onTap: (value) {
                    provider.onTap(index: value);
                  },
                ),
              ),
              body: provider.isLoading == true
                  ? Center(
                      child: LottieBuilder.asset(
                        'assets/animations/Animation - 1709635374301.json',
                        fit: BoxFit.cover,
                        width: 150, 
                        height: 150,
                      ),
                    )
                  : ListView.separated(
                    itemCount: provider.newsmodel.articles?.length ?? 0,
                    itemBuilder: (context, index) => Newscard(
                        title: provider.newsmodel.articles?[index].title.toString() ??
                            '',
                        description: provider.newsmodel.articles?[index].description
                                .toString() ??
                            '',
                        date: provider.newsmodel.articles?[index].publishedAt,
                        imageUrl: provider.newsmodel.articles?[index].urlToImage
                                .toString() ??
                            '',
                        contant:
                            provider.newsmodel.articles?[index].content.toString() ??
                                '',
                        sourceName:
                            provider.newsmodel.articles?[index].source?.name.toString() ??  
                                '',
                        url: provider.newsmodel.articles?[index].url.toString() ?? ''  
                            ),
                    separatorBuilder: (context,index)=>Divider(height: 5,)
                  ),));
    });
  }
}
