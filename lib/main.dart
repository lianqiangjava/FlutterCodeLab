import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice/guid.dart';

import 'package:flutter_practice/routes/Second.dart';
import 'package:flutter_practice/routes/buttoncode.dart';
import 'package:flutter_practice/routes/first.dart';
import 'package:flutter_practice/routes/formcode.dart';
import 'package:flutter_practice/routes/imagecode.dart';
import 'package:flutter_practice/routes/indicatorcode.dart';
import 'package:flutter_practice/routes/loadfile.dart';
import 'package:flutter_practice/routes/switchandcheckbox.dart';
import 'package:flutter_practice/routes/textcode.dart';
import 'package:flutter_practice/routes/textfield.dart';


void main() {
//  FlutterError.onError = (FlutterErrorDetails details){

//  };
//  runZoned(() => runApp(new MyApp()),
//    zoneSpecification: ZoneSpecification(
//      print: (Zone self,ZoneDelegate parent, Zone zone, String line){
//        收集日志
//      },
//    ),
//    onError: (Object obj, StackTrace stack) {

//    },
//  );

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice',
      theme: ThemeData(primaryColor: Colors.blue),
      initialRoute: "guide",

      ///采用路由表
      routes: {
        "guide": (context) => Guide(),
        "first": (context) => First(),
        "second": (context) =>
            Second(text: ModalRoute.of(context).settings.arguments),
        "loadfile": (context) => LoadFile(),
        "text": (context) => TextCode(),
        "button": (context) => ButtonCode(),
        "image": (context) => ImageCode(),
        "switchandcheckbox" : (context) => SwitchAndCheckBox(),
        "textfield": (context) => TextFieldCode(),
        "formcode": (context) => FormCode(),
        "indicator": (context) => IndicatorCode(),


      },

      ///如果指定的路由名在路由表中已注册，
      ///则会调用路由表中的builder函数来生成路由组件；
      ///如果路由表中没有注册，才会调用onGenerateRoute来生成路
      ///故放弃使用路由表，采用此回调处理跳转，可以实现页面权限处理
      ///(注意：只会对命名路由生效)
//      onGenerateRoute: (RouteSettings settings) {
//        return MaterialPageRoute(builder: (context) {
//          String routeName = settings.name;
//
//          ///分别处理
//          if ("first" == routeName) {
//            return First();
//          } else if ("second" == routeName) {
//            return Second(text: settings.arguments);
//          }
//          return null;
//        });
//      },

      ///当打开不存在的路由时调用
      //onUnknownRoute: (),
    );
  }
}

