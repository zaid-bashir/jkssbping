import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jkssbping/utils/teststylecustum.dart';

class CustumDailyDose extends StatelessWidget {
  const CustumDailyDose({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 20,
        shadowColor: Colors.black,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Finance Account Assistant",style: TextStyleCustum.testStyleH3,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Daily Dose JKSSB",style: TextStyleCustum.testStyleH4,),
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/misc/live.png",width: 30,height: 30,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.lock_clock),
                            Text("10 Minutes | 10 Marks",style: TextStyleCustum.testStyleH5,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            const Icon(Icons.language),
                            Text("Hindi / English",style: TextStyleCustum.testStyleH5,),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GFButton(onPressed: (){},type: GFButtonType.solid,blockButton: false,child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Start Now"),
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
