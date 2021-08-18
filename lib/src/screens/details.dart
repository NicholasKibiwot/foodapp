// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/src/helpers/style.dart';
import 'package:foodapp/src/models/products.dart';
import 'package:foodapp/src/widgets/custom_text.dart';

class Details extends StatefulWidget {
  final Product product;

  Details({required this.product});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Carousel(
                    images: [
                      AssetImage('images/${widget.product.image}'),
                      AssetImage('images/${widget.product.image}'),
                      AssetImage('images/${widget.product.image}'),
                    ],
                    dotBgColor: Colors.white30,
                    dotColor: Colors.black,
                    dotIncreasedColor: yellowAccent,
                    dotSize: 13,
                    dotIncreaseSize: 2,
                    autoplay: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: yellowAccent,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "images/shopping.png",
                                    width: 30,
                                    height: 30,
                                    color: black,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(2, 3),
                                          blurRadius: 5)
                                    ]),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 4, left: 4),
                                    child: CustomText(
                                      text: "3",
                                      color: red,
                                      size: 14,
                                      weight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    right: 24,
                    child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(2, 3),
                                blurRadius: 3)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          Icons.favorite,
                          size: 18,
                          color: red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomText(
              text: widget.product.name,
              size: 26,
              weight: FontWeight.bold, color: black,
            ),
            CustomText(
              text: "\$" + widget.product.price.toString(),
              size: 19,
              weight: FontWeight.w400, color: black,
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 28,
                      ),
                      onPressed: () {}),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 9, 25, 9),
                      child: CustomText(
                        text: "Add To Cart",
                        color: white,
                        size: 24,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 28,
                        color: red,
                      ),
                      onPressed: () {}),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
