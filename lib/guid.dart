import 'package:flutter/material.dart';

import 'comon/rout_path.dart';

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
//        children: routList.map((e) => getMenuItem(context, e.menuName,e.routPath)).toList(),
          children: menuForRoute.keys.map((e) => getMenuItem(context, e,menuForRoute[e])).toList(),

      ),
    );
  }
}

Widget getMenuItem(BuildContext context, String name,String path) {
  String page;
  return GestureDetector(
    child: Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      color: Theme.of(context).primaryColor,
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Theme.of(context).primaryColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontSize: 24),
      ),
    ),
    onTap: () {
      Navigator.of(context).pushNamed(path);
    },
  );
}
