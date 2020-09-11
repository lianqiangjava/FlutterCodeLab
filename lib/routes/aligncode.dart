import 'package:flutter/material.dart';

class AlignCode extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Align布局示例'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120,
            width: 120,
            color: Colors.blue[50],
            child: Align(
              alignment: FractionalOffset.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          Align(
            widthFactor: 2,
            heightFactor: 2,
            alignment: FractionalOffset(1,1),
            child: FlutterLogo(
              size: 80,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: FractionalOffset.topLeft,
                  child: FlutterLogo(
                    size: 80,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: FlutterLogo(
                    size: 80,
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}