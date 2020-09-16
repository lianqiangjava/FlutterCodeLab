import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice/guid.dart';

import 'package:flutter_practice/routes/Second.dart';
import 'package:flutter_practice/routes/aligncode.dart';
import 'package:flutter_practice/routes/appbar_drawer.dart';
import 'package:flutter_practice/routes/boxcode.dart';
import 'package:flutter_practice/routes/buttoncode.dart';
import 'package:flutter_practice/routes/channel.dart';
import 'package:flutter_practice/routes/clipcode.dart';
import 'package:flutter_practice/routes/containercode.dart';
import 'package:flutter_practice/routes/custombuttom.dart';
import 'package:flutter_practice/routes/custompaint.dart';
import 'package:flutter_practice/routes/dialogcode.dart';
import 'package:flutter_practice/routes/diocode.dart';
import 'package:flutter_practice/routes/filecode.dart';
import 'package:flutter_practice/routes/first.dart';
import 'package:flutter_practice/routes/flexcode.dart';
import 'package:flutter_practice/routes/formcode.dart';
import 'package:flutter_practice/routes/futurecode.dart';
import 'package:flutter_practice/routes/gesturecode.dart';
import 'package:flutter_practice/routes/gradientcircularprogressroute.dart';
import 'package:flutter_practice/routes/gridview_code.dart';
import 'package:flutter_practice/routes/httpclientcode.dart';
import 'package:flutter_practice/routes/imagecode.dart';
import 'package:flutter_practice/routes/indicatorcode.dart';
import 'package:flutter_practice/routes/listviewcode.dart';
import 'package:flutter_practice/routes/loadfile.dart';
import 'package:flutter_practice/routes/notification_code.dart';
import 'package:flutter_practice/routes/pointevent.dart';
import 'package:flutter_practice/routes/rowandcolumn.dart';
import 'package:flutter_practice/routes/scrollcontroler_code.dart';
import 'package:flutter_practice/routes/scrollview_code.dart';
import 'package:flutter_practice/routes/stackcode.dart';
import 'package:flutter_practice/routes/switchandcheckbox.dart';
import 'package:flutter_practice/routes/textcode.dart';
import 'package:flutter_practice/routes/textfield.dart';
import 'package:flutter_practice/routes/transform.dart';
import 'package:flutter_practice/routes/turnbox.dart';

import 'comon/rout_path.dart';


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
      theme: ThemeData(
          primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
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
        "rowandcolumn": (context) => RowAndColumn(),
        "flexcode": (context) => FlexCode(),
        "stackCode": (context) => StackCode(),
        "aligncode": (context) => AlignCode(),
        "boxcode": (context) => BoxCode(),
        "transform": (context) => TransForm(),
        "containercode": (context) => ContainerCode(),
        "appbaranddrawer": (context) => AppBarAndDrawer(),
        "clipcode": (context) => ClipCode(),
        "scroll": (context) => ScrollViewCode(),
        "listview": (context) => ListViewCode(),
        "gridview": (context) => GridViewCode(),
        "scrollcontro": (context) => ScrollControllCode(),
        "futurecode": (context) => FutureCode(),
        "dialog": (context) => DialogCode(),
        "pointevent": (context) => PointEvent(),
        "gesturecode": (context) => GestureCode(),
        "notification": (context) => NotificationCode(),
        "custombuttom": (context) => CustomButtom(),
        "turnbox" : (context) => TurnBoxRoute(),
        "paint" : (context) => CustomPaintCode(),
        "circularprogress":(context) => GradientCircularProgressRoute(),
        "file":(context) => FileCode(),
        "http": (context) => HttpClientCode(),
        "dio": (context) => DioCode(),
        "channel": (context) => ChannelCode(),

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

