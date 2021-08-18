import 'package:flutter/material.dart';
import 'package:foodapp/src/helpers/screen_navigation.dart';
import 'package:foodapp/src/helpers/style.dart';
import 'package:foodapp/src/models/products.dart';
import 'package:foodapp/src/screens/details.dart';
import 'package:foodapp/src/widgets/custom_text.dart';

List<Product> productsList = [
  Product(
      name: "italian cream cake",
      price: 5.99,
      rating: 4.5,
      vendor: "Talian",
      wishlist: true,
      image: "italian-cream-cake.png"),
  Product(
      name: "cereals",
      price: 3.99,
      rating: 4.2,
      vendor: "Talian",
      wishlist: false,
      image: "falafal.jpg"),
  Product(
      name: "cereals",
      price: 3.99,
      rating: 4.2,
      vendor: "Talian",
      wishlist: false,
      image: "falafal.jpg"),
];

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.all(9),
              child: GestureDetector(
                onTap: () {
                  changeScreen(
                      _,
                      Details(
                        product: productsList[index],
                      ));
                },
                child: Container(
                  height: 240,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
                            blurRadius: 13)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "images/${productsList[index].image}",
                        height: 120,
                        width: 190,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                                text: productsList[index].name,
                                size: 13,
                                color: black, weight: FontWeight.normal,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300],
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(1, 1),
                                          blurRadius: 13)
                                    ]),
                                child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: productsList[index].wishlist
                                        ? Icon(
                                            Icons.favorite,
                                            size: 18,
                                            color: red,
                                          )
                                        : Icon(
                                            Icons.favorite_border,
                                            size: 18,
                                            color: red,
                                          ))),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CustomText(
                                  text: productsList[index].rating.toString(),
                                  color: Colors.grey,
                                  size: 14, weight: FontWeight.normal,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 16,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CustomText(
                              text: "\$${productsList[index].price}",
                              weight: FontWeight.bold, color: black, size: 16,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
