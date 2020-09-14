import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/comon/eventbus.dart';

/// 接收数据并返回
class Second extends StatelessWidget {
  Second({Key key, this.text}) : super(key: key);

  String text;
  @override
  Widget build(BuildContext context) {
    ///接收参数
    var arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Column(
                  children: <Widget>[
                    Text('接收到的数据：$text'),
                    RaisedButton(
                      child: Text('返回'),
                      onPressed: (){
                        bus.emit("jump","Second发送消息了");
                        Navigator.pop(context,'来自Second的消息');
                      },
                    )
                  ]
            )


          ],
        ),
      ),
    );
  }
}
