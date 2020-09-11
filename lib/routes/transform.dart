import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('变换示例'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70,left: 50),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topLeft,
                transform: Matrix4.skewY(0.5),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: Text('Apartment for rent'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}