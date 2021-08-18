import 'package:flutter/material.dart';
import 'package:foodapp/src/helpers/style.dart';

class SmallButton extends StatelessWidget {
  final IconData icon;

  SmallButton(this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(
            icon,
            size: 16,
            color: white,
          ),
        ),
      ),
    );
  }
}
