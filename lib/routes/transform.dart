import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransForm extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('变换示例'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              Padding(
                padding: const EdgeInsets.all(98.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.translate(
                      offset: Offset(20,4),
                    child: Text('Hello jack'),
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.rotate(
                  angle: math.pi/2,
                  child: Text('Hello Flutter'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(58.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Text('Hello Flutter'),
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
                child: Transform.translate(
                  offset: Offset(10,10),

                  child: Transform.rotate(
                    alignment: FractionalOffset.topLeft,
                      angle: math.pi/2,
                    child: Text('Hello Flutter'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(58.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Transform.rotate(
                    alignment: FractionalOffset.topLeft,
                    angle: math.pi/2,
                    child: Transform.translate(
                      offset: Offset(10,10),
                      child: Text('Hello Flutter'),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.green),
                    child: RotatedBox(
                      quarterTurns: 1,//旋转90度(1/4圈)
                      child: Text('Hello Flutter'),
                    ),
                  ),
                  Text('Have you know',style: TextStyle(color: Colors.black,fontSize: 18),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}