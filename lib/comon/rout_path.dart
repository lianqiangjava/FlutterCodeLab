
import 'package:flutter/material.dart';

import '../guid.dart';

class Routs{
  Routs(this.menuName,this.routPath,this.routObject);
  String menuName;
  String routPath;
  Object routObject;
}

final List<Routs> routList = [
  Routs("ROUTE","first",Guide()),

];

//Map<String, WidgetBuilder> getRouts(BuildContext context){
//  Map<String, WidgetBuilder> map = new Map<String, WidgetBuilder>();
//  routList.forEach((e) {
//    map.putIfAbsent(e.routPath,  );
//  });
//  return map;
//}


final Map<String, String> menuForRoute = {
  "ROUTE": "first",
  "ASSETS": "loadfile",
  "TEXT": "text",
  "BUTTON": "button",
  "IMAGE": "image",
  "SWITCH": "switchandcheckbox",
  "TEXTFIELD": "textfield",
  "FORM": "formcode",
  "INDICATOR": "indicator",
  "ROWANDCOLUMN": "rowandcolumn",
  "FLEX": "flexcode",
  "STACK": "stackCode",
  "ALIGN": "aligncode",
  "BOX": "boxcode",
  "TRANSFORM": "transform",
  "CONTAINER": "containercode",
  "APPBAR": "appbaranddrawer",
  "CLIP": "clipcode",
  "SCROLL": "scroll",
  "LISTVIEW": "listview",
  "GRIDVIEW": "gridview",
  "SCROLLCONTRO": "scrollcontro",
  "FUTURE": "futurecode",
  "DIALOG": "dialog",
  "POINT": "pointevent",
  "Gesture": "gesturecode",
  "Notifi": "notification",
  "CusButtom": "custombuttom",
  "TurnBox":"turnbox",
  "Paint" : "paint",
  "Progress":"circularprogress",
  "File": "file",
  "Http": "http",
  "Dio" : "dio",
  "Channel" : "channel",
};