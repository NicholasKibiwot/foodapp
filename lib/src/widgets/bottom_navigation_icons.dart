import 'package:flutter/material.dart';
import 'package:foodapp/src/helpers/style.dart';
import 'package:foodapp/src/widgets/custom_text.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  const BottomNavIcon({Key? key, required this.image, required this.name, required this.onTap}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap:null ,
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/$image",
              width: 22,
              height: 22,
            ),
            SizedBox(
              height: 5,
            ),
            CustomText(
              text: "shopping",
              size: 10, color: black, weight: FontWeight.normal,
              
            ),
          ],
        ),
      ),
    );
  }
}
