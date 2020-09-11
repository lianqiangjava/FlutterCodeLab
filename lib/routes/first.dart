import 'package:flutter/material.dart';

///路由跳转分为三种:
///一种通过MaterialPageRoute，如果要自定义切换动画，继承PageRoute
///二种通过在MaterialApp里设置routes
///三通过onGenerateRoute
class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('跳转'),
                onPressed: ()  {
                  Navigator.of(context)
                      .pushNamed('second', arguments: "来自First").then((value) => print('$value'));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
