// ignore: import_of_legacy_library_into_null_safe
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/src/screens/bag.dart';
import 'package:foodapp/src/screens/home.dart';
import 'package:foodapp/src/screens/profile.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // ignore: unused_field
  int _pageIndex = 0;
GlobalKey _bottomNavigationKey = GlobalKey();


  List pages = [
    MyRoute(
      iconData: Icons.home,
       page: Home(),
    ),
    MyRoute(
      iconData: Icons.shopping_cart,
            page: Shopping_bag(),
    ), MyRoute(
      iconData: Icons.person,
            page: AccountProfile(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return 
 Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: pages
            .map((p) => Icon(
                  p.iconData,
                  size: 30,
                ))
            .toList(),
        
        buttonBackgroundColor: Colors.yellow,
        backgroundColor: Colors.white70,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 800),
        onTap: (index) {
          setState(() {
            
            _pageIndex = index;
          });
        },
      ),
      backgroundColor: Colors.grey[400],
      body: pages[_pageIndex].page,
    );
  }
}

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({required this.iconData, required this.page});
}