// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:jkssbping/screens/home/courses.dart';
import 'package:jkssbping/screens/home/homepage.dart';
import 'package:jkssbping/screens/home/library.dart';
import 'package:jkssbping/screens/home/profile_page.dart';
import 'package:jkssbping/screens/home/tests.dart';
import 'package:jkssbping/utils/color_constants.dart';
import 'package:jkssbping/widgets/custumdrawer.dart';

class NavbarCustum extends StatefulWidget {
  const NavbarCustum({ Key key }) : super(key: key);
  @override
  _NavbarCustumState createState() => _NavbarCustumState();
}

class _NavbarCustumState extends State<NavbarCustum> {
  int currentIndex = 0;
  final screens = <Widget>[
    HomePage(),
    Library(),
    Tests(),
    Courses(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  AnimatedTextKit(
          repeatForever: true,
          isRepeatingAnimation: true,
      animatedTexts: [
        ScaleAnimatedText('JKSSBPing.in'),
        ScaleAnimatedText('JKSSBPing.in'),
        ScaleAnimatedText('JKSSBPing.in'),
      ],
    ),
        backgroundColor: ColorConstants.primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: const CustumDrawer(),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Image.asset("assets/navbar/home.png",width: 40,height: 40,),label: "Home",),
        BottomNavigationBarItem(icon: Image.asset("assets/navbar/library.png",width: 40,height: 40,),label: "Library",),
        BottomNavigationBarItem(icon: Image.asset("assets/navbar/tests.png",width: 40,height: 40,),label: "Tests",),
        BottomNavigationBarItem(icon: Image.asset("assets/navbar/courses.png",width: 40,height: 40,),label: "Courses",),
        BottomNavigationBarItem(icon: Image.asset("assets/navbar/profile.png",width: 40,height: 40,),label: "Profile",),
      ]),
    );
  }
}