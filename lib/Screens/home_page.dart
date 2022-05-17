import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/Screens/restauramtInfo.dart';
import 'package:food/Screens/section_title.dart';
import 'package:food/constants.dart';
import 'package:food/demoData.dart';

import 'image_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            floating: true,
            title: Column(
              children: [
                Text("Delivery to".toUpperCase(),
                  style: Theme.of(context).textTheme.caption!.copyWith(color: kActiveColor),
                ),
                Text("San Francisco", style: TextStyle(color: Colors.black),)
              ],
            ),
            actions: [TextButton(onPressed: () {}, child: Text("Filter", style: TextStyle(color: Colors.black),))],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defualtPadding),
            sliver: SliverToBoxAdapter(
              child:ImageCards(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(defualtPadding),
            sliver: SliverToBoxAdapter(child: SectionTitle(
              title: "Featured Partnes",
              press: () {},
            )),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:  List.generate(demoMeduimCardData.length, (index) =>
                    Padding(
                      padding: const EdgeInsets.only(left: defualtPadding, right: 10),
                      child: RestaurantInfo(
                  title: demoMeduimCardData[index]['name'],
                  location: demoMeduimCardData[index]['location'],
                  image: demoMeduimCardData[index]['image'],
                  deliveryTime: demoMeduimCardData[index]['delivertTime'],
                  rating: demoMeduimCardData[index]['rating'],
                  press: (){},
                ),
                    ) ,)
              ),
            )
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defualtPadding),
            sliver: SliverToBoxAdapter(
              child: Image.asset("assets/delivery.jpg"),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(defualtPadding),
            sliver: SliverToBoxAdapter(child: SectionTitle(
              title: "Food",
              press: () {},
            )),
          ),
          SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children:  List.generate(demoMeduimCardData2.length, (index) =>
                        Padding(
                          padding: const EdgeInsets.only(left: defualtPadding, right: 10),
                          child: RestaurantInfo(
                            title: demoMeduimCardData2[index]['name'],
                            location: demoMeduimCardData2[index]['location'],
                            image: demoMeduimCardData2[index]['image'],
                            deliveryTime: demoMeduimCardData2[index]['delivertTime'],
                            rating: demoMeduimCardData2[index]['rating'],
                            press: (){},
                          ),
                        ) ,)
                ),
              )
          ),
        ],
      ),
    );
  }
}