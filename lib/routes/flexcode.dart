import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('弹性布局Flex'),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                      child: Wrap(
                        children: <Widget>[Text("xxx")],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Wrap
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Wrap(
                  spacing: 28.0,
                  runSpacing: -5,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('A'),),
                      label: Text('Hll'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('A'),),
                      label: Text('Hll'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('A'),),
                      label: Text('Hll'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('A'),),
                      label: Text('Hll'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text('A'),),
                      label: Text('Hll'),
                    ),
                  ],
                ),
              ),
            ],

          ),
        ],
      ),
    );
  }
}
