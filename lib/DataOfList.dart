import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'listOfData.dart';

class DataOfList extends StatelessWidget {
  DataOfList({this.data});
  final ListOfData data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Cartoon"),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.orange,
      body: DataBody(data: data),
    );
  }
}

class DataBody extends StatelessWidget {
  DataBody({this.data});
  final ListOfData data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 80 / 100,
        height: MediaQuery.of(context).size.height * 60 / 100,
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 80 / 100,
                height: MediaQuery.of(context).size.height * 50 / 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 80 / 100,
                  height: MediaQuery.of(context).size.height * 50 / 100,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Hero(tag: data.id, child: Image.asset(data.img)),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      data.name,
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$${data.prise.toString()}",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
