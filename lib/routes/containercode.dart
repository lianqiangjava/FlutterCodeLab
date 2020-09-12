import 'package:flutter/material.dart';

class ContainerCode extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container示例'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50.0,left: 120.0),
        constraints: BoxConstraints.tightFor(width: 200,height: 150),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.red,Colors.orange],
            center: Alignment.topLeft,
            radius: .98
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0,2.0),
              blurRadius: 4.0
            )
          ]
        ),

        transform: Matrix4.rotationZ(.2),
        alignment: Alignment.center,
        child: Text(
          '545',
          style: TextStyle(color: Colors.white,fontSize: 40),
        ),

      ),
    );
  }
}