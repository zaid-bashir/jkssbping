// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Tests extends StatefulWidget {
  const Tests({ Key key }) : super(key: key);

  @override
  _TestsState createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Tests"),
      ),
    );
  }
}