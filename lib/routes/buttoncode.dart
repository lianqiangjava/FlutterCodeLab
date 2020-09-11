import 'package:flutter/material.dart';

class ButtonCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮示例'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text('RaisedButton'),
            ),
            FlatButton(onPressed: () {}, child: Text('FlatButton')),
            OutlineButton(onPressed: () {}, child: Text('OutlineButton')),
            IconButton(icon: Icon(Icons.thumb_up,color: Colors.green,), onPressed: () {}),
            RaisedButton.icon(
                onPressed: () {}, icon: Icon(Icons.send), label: Text('发送')),
            OutlineButton.icon(
                onPressed: () {}, icon: Icon(Icons.add), label: Text('添加')),
            FlatButton.icon(
                onPressed: () {}, icon: Icon(Icons.info), label: Text('详情')),
            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              elevation: 2.0,
              highlightElevation: 8.0,
              disabledElevation: 0.0,
              child: Text('Submit'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
