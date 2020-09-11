import 'package:flutter/material.dart';

enum RoutePath { ROUTE, ASSETS, ERROR,TEXT,BUTTON,IMAGE,SWITCH,
  TEXTFIELD, FORM,INDICATOR,ROWANDCOLUMN,FLEX,STACK,ALIGN,
BOX,TRANSFORM,}

///各功能示范导航菜单
class Guide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1.0),
        children: <Widget>[
          getMenuItem(context, RoutePath.ROUTE),
          getMenuItem(context, RoutePath.ASSETS),
//          getMenuItem(context, RoutePath.ERROR),
          getMenuItem(context, RoutePath.TEXT),
          getMenuItem(context, RoutePath.BUTTON),
          getMenuItem(context, RoutePath.IMAGE),
          getMenuItem(context, RoutePath.SWITCH),
          getMenuItem(context, RoutePath.TEXTFIELD),
          getMenuItem(context, RoutePath.FORM),
          getMenuItem(context, RoutePath.INDICATOR),
          getMenuItem(context, RoutePath.ROWANDCOLUMN),
          getMenuItem(context, RoutePath.FLEX),
          getMenuItem(context, RoutePath.STACK),
          getMenuItem(context, RoutePath.ALIGN),
          getMenuItem(context, RoutePath.BOX),
          getMenuItem(context, RoutePath.TRANSFORM),
        ],
      ),
    );
  }
}

Widget getMenuItem(BuildContext context, RoutePath path) {
  String page;
  return GestureDetector(
    child: Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      color: Colors.blueAccent,
      child: Text(
        path.toString().substring(10),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
    onTap: () {
      switch (path) {
        case RoutePath.ROUTE:
        ///路由示例
          page = "first";
          break;
        case RoutePath.ASSETS:
        ///Assets资源使用示例
          page = 'loadfile';
          break;
        case RoutePath.TEXT:
          page = 'text';
          break;
        case RoutePath.BUTTON:
          page = 'button';
          break;
        case RoutePath.IMAGE:
          page = 'image';
          break;
        case RoutePath.SWITCH:
          page = 'switchandcheckbox';
          break;
        case RoutePath.TEXTFIELD:
          page = 'textfield';
          break;
        case RoutePath.FORM:
          page = 'formcode';
          break;
        case RoutePath.INDICATOR:
          page = 'indicator';
          break;
        case RoutePath.ROWANDCOLUMN:
          page = 'rowandcolumn';
          break;
        case RoutePath.FLEX:
          page = 'flexcode';
          break;
        case RoutePath.STACK:
          page = 'stackCode';
          break;
        case RoutePath.ALIGN:
          page = 'aligncode';
          break;
        case RoutePath.BOX:
          page = 'boxcode';
          break;
        case RoutePath.TRANSFORM:
          page = 'transform';
          break;
      }
      Navigator.of(context).pushNamed(page);
    },
  );
}
