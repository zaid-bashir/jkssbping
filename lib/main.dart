// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jkssbping/provider/auth_provider.dart';
import 'package:jkssbping/screens/splash/splash_screen.dart';
import 'package:jkssbping/utils/sharedpreference_helper.dart';
import 'package:provider/provider.dart';

void main() {
  Preference.load();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final Color _primaryColor = HexColor('#DC54FE');
  final Color _accentColor = HexColor('#8A02AE');

  MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'JKSSBPing.in',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: _primaryColor,
          accentColor: _accentColor,
          scaffoldBackgroundColor: Colors.grey.shade100,
          primarySwatch: Colors.grey,
        ),
        // ignore: prefer_const_constructors
        home: SplashScreen(title: 'JKSSBPing.in'),
      ),
    );
  }
}
