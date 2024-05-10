import 'dart:math';

import 'package:coffee_shop/widgets/background.dart';
import 'package:coffee_shop/widgets/category_items.dart';
import 'package:coffee_shop/widgets/display_image.dart';
import 'package:coffee_shop/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_shop/widgets/clip.dart';
import 'package:coffee_shop/model/category.dart';

import '../model/product.dart';
import 'detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategory = 0;
  int currentProduct = 0;
  PageController? controller;
  double viewPoint = 0.5;
  double? pageOffSet = 1;

  Widget build(BuildContext context) {
    List<Product> dataProducts = products
        .where((element) => element.category == categories[currentCategory])
        .toList();
    return MaterialApp(
      home: Scaffold(
        appBar: myAppBar(),
        body: Stack(
          children: [
            const BackGround(),
            Positioned(
                top: 65,
                left: 25,
                child: Text(
                  "Smooth Out Your Day!",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 35,
                      color: Colors.green[900],
                      fontWeight: FontWeight.w900),
                )),
            Positioned(
              top: 120,
              child: ClipPath(
                clipper: Clip(),
                child: Container(
                  height: 190,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green[800],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      categories.length,
                      (index) => Container(
                        height: 190,
                        width: 100,
                        color: currentCategory == index
                            ? Colors.amber
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 125,
              child: ClipPath(
                clipper: Clip(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green[800],
                  height: 280,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(categories.length, (index) {
                      int decrease = 0;
                      int max = 1;
                      int bottomPadding = 1;
                      // for item display in curve shape
                      for (var i = 0; i < categories.length; i++) {
                        bottomPadding =
                            index > max ? index - decrease++ : index;
                      }
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentCategory = index;
                            dataProducts = products
                                .where((element) =>
                                    element.category ==
                                    categories[currentCategory])
                                .toList();
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: bottomPadding.abs() * 75,
                          ),
                          child: CategoryItems(
                            category: categories[index],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: Clip(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.58,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green[700],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipPath(
                    clipper: Clip(),
                    child: Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height * 0.58,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(onPageChanged: (value) {
                        setState(() {
                          currentProduct = value % dataProducts.length;
                        });
                      }, itemBuilder: (context, index) {
                        double scale = max(
                          viewPoint,
                          (1 - (pageOffSet! - index).abs() + viewPoint),
                        );
                        double angle = 0.0;
                        final items = dataProducts[index % dataProducts.length];
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              DetailScreen(
                                product: dataProducts[
                                currentProduct % dataProducts.length],
                              ),
                            );
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 200 - (scale / 1.6 * 170)),
                            child: Transform.rotate(
                              angle: angle * pi,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  DisplayImage(product: items),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          children: [
                            Text(
                              dataProducts[currentProduct % dataProducts.length]
                                  .name,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\$${dataProducts[currentProduct % dataProducts.length].price}0",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
