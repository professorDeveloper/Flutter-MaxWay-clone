import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxway_clone/screeens/card_item.dart';

import '../models/Categories.dart';
import '../models/Products.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({Key? key,required this.categories,required this.products}) : super(key: key);

  var products = <Product>[];
  var categories = <Categories>[];



  String text = "Бургеры";

  @override
  Widget build(BuildContext context) {
    final hrList = <String>[];
    hrList.add(
        "https://maxway.uz/_next/image?url=https%3A%2F%2Fcdn.delever.uz%2Fdelever%2F4c9b7c94-af14-4537-b982-54af29f020d3&w=1920&q=75");
    hrList.add(
        "https://maxway.uz/_next/image?url=https%3A%2F%2Fcdn.delever.uz%2Fdelever%2Fda37c15d-9a43-43a6-aaf0-92e1f181c560&w=1920&q=75");
    hrList.add(
        "https://maxway.uz/_next/image?url=https%3A%2F%2Fcdn.delever.uz%2Fdelever%2F6ca7d385-27a3-4edf-be06-d5733d3f92f1&w=1920&q=75");
    hrList.add(
        "https://maxway.uz/_next/image?url=https%3A%2F%2Fcdn.delever.uz%2Fdelever%2F25e84876-fef8-40f6-a188-25896a5990da&w=1920&q=75");
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Рекомендуем",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                  height: 160,
                  child: ListView.builder(
                      itemCount: hrList.length,

                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                height: 160,
                                width: 230,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          hrList[index]),
                                    )));
                          },
                        );
                      })),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 265,
              width: double.infinity,
              child: GridView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    return CardItem(product: products[index], onTap: () {

                    },);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
