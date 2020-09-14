import 'package:flutter/material.dart';
import 'package:flutter_practice/comon/comon.dart';

class NotificationCode extends StatefulWidget {
  @override
  _NotificationCodeState createState() {
    // TODO: implement createState
    return _NotificationCodeState();
  }
}

class _NotificationCodeState extends State<NotificationCode> {
  String _mag = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return scaffoldHead("通知", customNotifi());
  }


  Widget customNotifi(){
    return NotificationListener<MyNotificaion>(
      onNotification: (notification){
        print(notification.msg);
        return true;
      },
      child: NotificationListener<MyNotificaion>(
        onNotification: (notification){
          setState((){
            _mag += notification.msg+" ";
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(_mag),
              Builder(builder: (context){
                return RaisedButton(
                  onPressed: () => MyNotificaion("sss").dispatch(context),
                  child: Text("发送事件"),
                );
              })

            ],
          ),
        ),
      ),
    );
  }
}

Widget scrollNotifi() {
  return NotificationListener<ScrollEndNotification>(
    onNotification: (notification) {
      switch (notification.runtimeType) {
        case ScrollStartNotification:
          print("开始滚动");
          break;
        case ScrollUpdateNotification:
          print("正滚动");
          break;
        case ScrollEndNotification:
          print("停止滚动");
          break;
        case OverscrollNotification:
          print("滚到边界");
          break;
      }
      return true;
    },
    child: ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(
          '$index',
          style: TextStyle(fontSize: 30),
        ));
      },
    ),
  );
}



class MyNotificaion extends Notification {
  MyNotificaion(this.msg);
  final String msg;

}
