import 'package:flutter/material.dart';
import 'package:foodapp/src/models/category.dart';
import 'package:foodapp/src/widgets/custom_text.dart';

List<Category> categoriesList = [
  Category(name: "Salad", image: "grandma's-carrot-cake.png"),
  Category(name: "falafal", image: "falafal.jpg"),
  Category(name: "Salad", image: "grandma's-carrot-cake.png"),
  Category(name: "Salad", image: "italian-cream-cake.png"),
  Category(name: "Salad", image: "Roasted-corn-fish.png"),
];

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 5),
                          color: Colors.redAccent,
                          blurRadius: 15)
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        "images/${categoriesList[index].image}",
                        height: 70,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: categoriesList[index].name,
                    size: 13,
                    color: Colors.black, weight: FontWeight.normal,
                  )
                ],
              ),
            );
          },
        ));
  }
}
