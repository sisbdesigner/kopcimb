import 'package:flutter/material.dart';


class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Red Container Overlapping Border'),
        ),
        body: Center(
          child: Container(
             // decoration: iconStyle(context),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.fromLTRB(8, 7, 8, 7),
                    padding: EdgeInsets.all(1),
                    //child: Image.asset( "assets/bell.png"),
                  ),
                  Positioned(
                    child: FractionalTranslation(
                      translation: Offset(0.5, -0.5),
                    child: Container(
                      width: 60,
                      height: 80,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          //borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white,
                              width: 2)),
                    ),
                  )),
                ],
              )
          ),
        )
      ),
    );
  }
}
