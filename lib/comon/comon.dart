
import 'package:flutter/material.dart';

Widget getAppBar(String text){
  return AppBar(
    title: Text(text),
  );
}

Widget scaffoldHead(String text,Widget child){
  return Scaffold(
    appBar: getAppBar(text),
    body: child,
  );
}