import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:griddemo/DataOfList.dart';

import 'listOfData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(backgroundColor: Colors.orange, title: Text("Cartoon"), centerTitle: true, elevation: 0),
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListName(context),
        Expanded(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                    topLeft: Radius.circular(70),
                  ),
                ),
                width: double.infinity,
              ),
              OrientationBuilder(builder: (context, orientation) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: orientation == Orientation.portrait ? 2 : 3),
                  itemBuilder: (context, index) => Container(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Container(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DataOfList(data: listdata[index])));
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(14.0, 19.0),
                                  ),
                                ],
                                color: index.isEven ? Colors.blue : Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Transform.rotate(
                                        angle: 9 / 12.0,
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              "\$${listdata[index].prise.toString()}",
                                              style: TextStyle(color: Colors.yellow),
                                            ),
                                          ),
                                          color: Colors.red,
                                          width: 60,
                                          height: 15,
                                        ),
                                      ),
                                      top: 8,
                                      right: -12,
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              child:
                                  Container(height: 120, width: 120, child: Hero(tag: listdata[index].id!, child: Image.asset(listdata[index].img!))),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          listdata[index].name!,
                                          style: TextStyle(
                                            color: index.isEven ? Colors.pinkAccent : Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
//
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  itemCount: listdata.length,
                );
              }),
            ],
          ),
        )
      ],
    );
  }

  Container ListName(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: MediaQuery.of(context).size.height * 8 / 100,
      child: ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => setState(() => selectedIndex = index),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedIndex == index ? Colors.white : Colors.transparent,
            ),
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              listdata[index].name.toString(),
              style: TextStyle(
                fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: listdata.length,
      ),
    );
  }
}
