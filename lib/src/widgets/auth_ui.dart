// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:foodapp/src/providers/google_sign_in.dart';
import 'package:foodapp/src/screens/phoneauth_screen.dart';
import 'package:sign_button/sign_button.dart';

class AuthUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
              width: 220,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, PhoneAuthScreen.id);
                },
                child: Row(
                  children: [
                    Icon(Icons.phone_android_outlined,
                        color: Colors.yellowAccent),
                    SizedBox(
                      height: 20,
                      child: Text(
                        '  Continue with phone',
                        style: TextStyle(fontSize: 16, color: Colors.yellow),
                      ),
                    ),
                  ],
                ),
              )),
          SignInButton(
              buttonType: ButtonType.google,
              onPressed: () {

                signInWithGoogle(context);
                print('click');
              }),
          SignInButton(
              buttonType: ButtonType.facebook,
              onPressed: () {
                
                print('click');
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'OR',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SignInButtonBuilder(
            text: 'Sign in with Email',
            icon: Icons.email,
            onPressed: () {},
            backgroundColor: Colors.blueGrey[700]!,
          )
        ],
      ),
    );
  }
}
