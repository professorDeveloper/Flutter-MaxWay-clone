import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxway_clone/api/category_api.dart';
import 'package:maxway_clone/di/di.dart';
import 'package:maxway_clone/models/Categories.dart';
import 'package:maxway_clone/screeens/ProductDetailScreen.dart';
import 'package:maxway_clone/screeens/card_item.dart';

import '../models/Products.dart';
import '../utils/myUtil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum _Status { initial, loading, fail, success }

class _HomeScreenState extends State<HomeScreen> {
  String text = "Бургеры";
  final api = CategoryAndProductApi(Dio());
  var categories = <Categories>[];
  var current = 0;
  var status = _Status.initial;
  var products = <Product>[];
  var message = "";

  @override
  void initState() {
    loadData();
    super.initState();
  }

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

    return SafeArea(
      child: Scaffold(body: Builder(builder: (context) {
        if (status == _Status.loading) {
          return Center(child: CircularProgressIndicator());
        }
        if (status == _Status.success) {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xfff3f2f3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 22),
                        child: TextFormField(
                          autofocus: false,
                          style: const TextStyle(
                              color: Color(0xff818C99),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Поиск",
                            icon: Icon(
                              Icons.search,
                              color: Color(0xff818C99),
                            ),
                            hintStyle: TextStyle(
                                color: Color(0xFFA5A5A5),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                    color: bg_bottom,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 59,
                          child: ListView.builder(
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 10, bottom: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      current = index;
                                      text = categories[index].title.ru;
                                      products=categories[current].products;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: index == current
                                          ? Color(0xff51267D)
                                          : Color(0xffffffff),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 10),
                                          child: Text(
                                            categories[index].title.ru,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: index == current
                                                    ? Color(0xffffffff)
                                                    : Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
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
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 11),
                          child: Container(
                            height: 255,
                            width: double.infinity,
                            child: GridView.builder(
                                itemCount: products.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: 2/2.4,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return CardItem(product: products[index],onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){

                                      return  ProductDetailScreen(product:products[index],);
                                    },));
                                    },);
                                }),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          );
        }
        if (status == _Status.fail) {
          Center(child: Text(message));
        }
        return Center(
          child: Text(status.name, style: const TextStyle(fontSize: 32)),
        );
      })),
    );
  }

  Future<void> loadData() async {
    status = _Status.loading;
    setState(() {});
    try {

      categories = await api.categoryList();
      products=categories[current].products;
      for (var value in categories[current].products) {
        print("value" + value.title.en);
      }
      print("List length: ${categories[current].products.length}");
      status = _Status.success;
      setState(() {});
    } catch (e) {
      status = _Status.fail;
      setState(() {});
    }
  }
}
