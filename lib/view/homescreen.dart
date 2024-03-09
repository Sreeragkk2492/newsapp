import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/homescreencontroller.dart';
import 'package:newsapp/controller/searchcontroller.dart';
import 'package:newsapp/view/widget/newscard.dart';
import 'package:newsapp/view/widget/sliveritems.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void fetchdata(BuildContext context) {
    Provider.of<Homescreencontroller>(context, listen: false).fetchdata();
  }

  bool isSearched = false;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchControllerScreen provider =
        Provider.of<SearchControllerScreen>(context);
    fetchdata(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 48, 87),
        body: Consumer<Homescreencontroller>(
          builder: (context, value, child) {
            return CustomScrollView(
              slivers: [
                // SliverAppbar(),
                SliverAppBar(
                  backgroundColor: const Color.fromARGB(255, 1, 48, 87),
                  title: const Padding(
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
                        SizedBox(
                          height: 10,
                        )
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
                      backgroundColor: Color.fromARGB(255, 1, 48, 87),
                      title: TextField(
                        controller: controller,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 2, 106, 190),
                            hintText: 'Search news',
                            hintStyle: TextStyle(color: Colors.white),
                            suffixIcon: InkWell(
                                onTap: () {
                                  provider.searchData(
                                      searchText:
                                          controller.text.toLowerCase());
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  setState(() {
                                    isSearched = !isSearched;
                                  });
                                  controller.clear();
                                },
                                child: Icon(
                                  FontAwesomeIcons.magnifyingGlass,
                                  color: Colors.white,
                                )),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(45))),
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.bars,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ),
                isSearched
                    ? SliverToBoxAdapter(
                        child: provider.isLoading == true
                            ? Center(
                                child: LottieBuilder.asset(
                                  'assets/animations/Animation - 1709635374301.json',
                                  fit: BoxFit.cover,
                                  width: 150,
                                  height: 150,
                                ),
                              )
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: provider.newsmodel?.articles?.length,
                                itemBuilder: (context, index) => Newscard(
                                    title: provider
                                            .newsmodel?.articles?[index].title
                                            .toString() ??
                                        '',
                                    description: provider.newsmodel
                                            ?.articles?[index].description
                                            .toString() ??
                                        '',
                                    date: provider.newsmodel?.articles?[index]
                                        .publishedAt,
                                    imageUrl: provider.newsmodel
                                            ?.articles?[index].urlToImage
                                            .toString() ??
                                        '',
                                    contant: provider.newsmodel?.articles?[index].content.toString() ?? '',
                                    sourceName: provider.newsmodel?.articles?[index].source?.name.toString() ?? '',
                                    url: provider.newsmodel?.articles?[index].url.toString() ?? '')),
                      )
                    : SliverToBoxAdapter(child: SliversItem()),
              ],
            );
          },
        ),
      ),
    );
  }
}
