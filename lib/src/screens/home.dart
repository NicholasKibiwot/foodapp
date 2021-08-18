import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodapp/src/helpers/style.dart';
import 'package:foodapp/src/providers/google_sign_in.dart';
import 'package:foodapp/src/screens/loginscreen.dart';
import 'package:foodapp/src/widgets/categories.dart';
import 'package:foodapp/src/widgets/custom_text.dart';
import 'package:foodapp/src/widgets/featured_products.dart';
import 'package:foodapp/src/widgets/small_floating_button.dart';

class Home extends StatefulWidget {
  
  static const String id = 'Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static int _currentPage = 0;
  // ignore: unused_field
  static final PageController _pageController = PageController(
    initialPage: _currentPage,
    keepPage: true,
  );
  final FirebaseAuth auth = FirebaseAuth.instance;
  var ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Food');

  var userDataRef = FirebaseFirestore.instance
      .collection('Food')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(


        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text("Do you want some food?")),
                Padding(
                  padding: const EdgeInsets.only(left: 250),
                  child: Text(
                    'Logout',
                  ),
                ),
                Stack(
                  children: [
                    IconButton(
                        icon: Icon(Icons.logout_sharp),
                        onPressed: () async {
                     signOutGoogle();
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginScreen();}), ModalRoute.withName('/'));


                        }),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(color: white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey, offset: Offset(1, 1), blurRadius: 4)
                  ]),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: "Find food", border: InputBorder.none),
                    ),
                    trailing: Icon(
                      Icons.filter_list,
                      color: Colors.red,
                    ),
                  )),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CustomText(
                text: "Featured",
                size: 20,
                color: black,
                weight: FontWeight.normal,
              ),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CustomText(
                text: "Popular",
                size: 20,
                color: black,
                weight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset("images/caesar-salad.jpg")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SmallButton(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow[900],
                                    size: 20,
                                  ),
                                ),
                                Text("4.5"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.05),
                                Colors.black.withOpacity(0.025),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.fromLTRB(20, 2, 10, 25),
                            child: RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Pancakes\n",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                ),
                                TextSpan(
                                    text: "by: ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: white)),
                                TextSpan(
                                    text: "Pizza hut",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: white)),
                              ],
                              style: TextStyle(color: black),
                            ))),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "\$12.99 \n",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w200,
                                ))
                          ], style: TextStyle(color: white))),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
