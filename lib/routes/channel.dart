import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/comon/comon.dart';

class ChannelCode extends StatefulWidget{
  @override
  _ChannelCodeState createState() {
    return _ChannelCodeState();
  }
}
class _ChannelCodeState extends State<ChannelCode>{

  static const platform = const MethodChannel("my.flutter/battery");
  static const battryMethod = "getBatteryLevel";
  static const infoMethod = "getInfo";

  String _batteryLevel = "Unknown";
  String _info = "Unknown";

  @override
  Widget build(BuildContext context) {
    return scaffoldHead(
      "获取原生平台电量",
      Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text("获取电量"),
              onPressed: getBatteryLevel,
            ),
            Text(_batteryLevel),
            RaisedButton(
              child: Text("跳转到原生界面"),
              onPressed: getInfo,
            ),
            Text(_info),
          ],
        ),
      )
    );
  }

  Future<Null> getBatteryLevel() async {
    String batteryLevel;
    try{
      final int result = await platform.invokeMethod(battryMethod);
      batteryLevel = "Battery at $result %";
    }on Exception catch(e){
      print(e.toString());
      batteryLevel = "Failed ";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<String> getInfo() async {
    String info;
    try{
      final String result = await platform.invokeMethod(infoMethod);
      info = result;
    }on Exception catch(e){
      print(e);
      info = "获取失败";
    }
    setState(() {
      _info = info;
    });
  }
}