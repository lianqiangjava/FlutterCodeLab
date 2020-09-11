import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackCode extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('层叠布局示例'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,//指定未定位或部分定位widget的对齐方式
          fit: StackFit.loose,
          children: <Widget>[
            Positioned(
              left: 18.0,
              right: 18.0,
              child: Text('I am Fine'),
            ),
            Container(
              child: Text('Hello Flutter'),
              color: Colors.red,
            ),
            Positioned(
              top: 18.0,
              child: Text('You are beautiful'),
            ),

          ],
        ),
      ),
    );

  }
}