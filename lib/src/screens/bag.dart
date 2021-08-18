import 'package:flutter/material.dart';
import 'package:foodapp/src/helpers/style.dart';
import 'package:foodapp/src/models/products.dart';
import 'package:foodapp/src/widgets/custom_text.dart';

// ignore: camel_case_types
class Shopping_bag extends StatefulWidget {
  @override
  _Shopping_bagState createState() => _Shopping_bagState();
}

// ignore: camel_case_types
class _Shopping_bagState extends State<Shopping_bag> {
  Product product = Product(
      name: "italian cream cake",
      price: 5.99,
      rating: 4.5,
      vendor: "Talian",
      wishlist: true,
      image: "italian-cream-cake.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: null,
        ),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Shopping Bag", color: black, size: 20, weight: FontWeight.normal,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/shopping.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 15,
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
                        padding: const EdgeInsets.only(right: 4, left: 4),
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
      backgroundColor: white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 1),
                  blurRadius: 10,
                )
              ]),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/${product.image}",
                    height: 100,
                    width: 140,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: product.name + "\n",
                            style: TextStyle(color: black, fontSize: 13)),
                        TextSpan(
                            text: "\$" + product.price.toString() + "\n",
                            style: TextStyle(
                                color: black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ])),
                      SizedBox(
                        width: 50,
                      ),
                   IconButton(icon: Icon(Icons.delete), onPressed: null),
                      
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
