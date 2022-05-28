// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jkssbping/utils/image_constants.dart';
import 'package:jkssbping/utils/teststylecustum.dart';
import 'package:jkssbping/widgets/custum_daily_dose.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageList = [
    ImageConstants.ssb.toString(),
    ImageConstants.psc.toString(),
    ImageConstants.ssc.toString(),
    ImageConstants.ku.toString(),
    ImageConstants.ju.toString(),
  ];

  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  var colorizeTextStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: 'Horizon',
    fontWeight: FontWeight.w600,
    
  );

  final List<Map<String, String>> categoryList = [
    {"image": "assets/scrollable/papers.png", "title": "Papers"},
    {"image": "assets/scrollable/tests.png", "title": "Tests"},
    {"image": "assets/scrollable/news.png", "title": "News"},
    {"image": "assets/scrollable/qa.png", "title": "Q/A"},
    {"image": "assets/scrollable/jobs.png", "title": "Jobs"},
    {"image": "assets/scrollable/classes.png", "title": "Classes"},
    {"image": "assets/scrollable/reading.png", "title": "Reading"},
    {"image": "assets/scrollable/science.png", "title": "Science"},
    {"image": "assets/scrollable/technology.png", "title": "Technology"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              width: 250.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'JKSSBPing.in No. 1 Mobile App',
                      textAlign: TextAlign.center,
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                    ColorizeAnimatedText(
                      'in J&K for Govt Exams Preparations,',
                      textStyle: colorizeTextStyle,
                      textAlign: TextAlign.center,
                      colors: colorizeColors,
                    ),
                    ColorizeAnimatedText(
                      'University Entrance Exams Preparation',
                      textStyle: colorizeTextStyle,
                      textAlign: TextAlign.center,
                      colors: colorizeColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
              child: GFCarousel(
                autoPlay: true,
                items: imageList.map(
                  (url) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Image.asset(
                          url,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ).toList(),
                onPageChanged: (index) {
                  setState(() {
                    print(index);
                  });
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white60,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: categoryList.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: GFAvatar(
                                    size: 25,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                        categoryList[index]['image']
                                            .toString()),
                                    shape: GFAvatarShape.standard),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                    categoryList[index]['title'].toString()),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Trending",style: TextStyleCustum.testStyleH1),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset("assets/scrollable/papers.png",width: 20,height: 20,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Daily Dose : Papers",style: TextStyleCustum.testStyleH2),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset("assets/misc/free.png",width: 50,height: 50,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white60,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: 10,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustumDailyDose();
                    }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("News",style: TextStyleCustum.testStyleH1),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset("assets/scrollable/news.png",width: 20,height: 20,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Latest News : General",style: TextStyleCustum.testStyleH2),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset("assets/scrollable/reading.png",width: 50,height: 50,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white60,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: 10,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CustumDailyDose();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
