import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/homescreencontroller.dart';
import 'package:newsapp/view/utils/colors.dart';
import 'package:newsapp/view/widget/newscard.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  void fetchdata(BuildContext context) { 
    Provider.of<Homescreencontroller>(context,listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
     fetchdata(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        elevation: 10,
        backgroundColor: Mycolors.secondarycolor,
        centerTitle: true,
        title: Text(
          'WaveNews',
          style: TextStyle(color: Mycolors.textcolor),
        ),
      ),
      body: Consumer<Homescreencontroller>(
        builder: (context, provider, child) {
          return provider.isLoading == true
              ? Center(
                  child: LottieBuilder.asset(
                  'assets/animations/Animation - 1709635374301.json',
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ))
              : Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
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
                  ),
              );
        },
      ),
    );
  }
}
