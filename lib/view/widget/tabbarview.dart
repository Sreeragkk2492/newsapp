import 'package:flutter/material.dart';
import 'package:newsapp/controller/categorycontroller.dart';
import 'package:newsapp/view/utils/colors.dart';
import 'package:provider/provider.dart';

class Tabbarview extends StatelessWidget {
  const Tabbarview({super.key});
  void fetchdata(BuildContext context) {
    Provider.of<Categorycontroller>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchdata(context);
    return Consumer<Categorycontroller>(builder: (context, provider, child) {
      return Column(
        children: [
          DefaultTabController(
              initialIndex: 0,
              length: provider.categorylist.length,
              child: TabBar(
                tabs: List.generate(
                    provider.categorylist.length,
                    (index) => Tab(
                          text: provider.categorylist[index],
                        )),
                onTap: (value) {
                  provider.onTap(index: value);
                },
                dividerHeight: 0,
          
                labelStyle:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.white,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
                unselectedLabelStyle: TextStyle(
                    color: Mycolors.textcolor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                // overlayColor: MaterialStatePropertyAll(Colors.grey),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Mycolors.bgcolor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                isScrollable: true,
              )),
            ]);} ); 
  
      
      
    
  }
}
