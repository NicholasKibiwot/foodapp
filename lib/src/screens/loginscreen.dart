import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/src/widgets/auth_ui.dart';

class LoginScreen extends StatelessWidget {
  
  static const String id = 'login-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Material(
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: Ink.image(
                        image: AssetImage('images/logo.jpeg'),
                        fit: BoxFit.cover,
                        width: 120.0,
                        height: 120.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 31,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FlickerAnimatedText(
                          'Nic Technologies',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: AuthUi(),
              ),
            ),
            Text(
                'If you continue you are accepting terms and conditions and privacy policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                )),
          ],
        ),
      ),
    );
  }
}
