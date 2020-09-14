import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_practice/comon/comon.dart';

class CustomPaintCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return scaffoldHead(
        "绘制UI",
        Center(
          child: CustomPaint(
            size: Size(300, 300),
            painter: MyPainter(),
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWdith = size.width / 15;
    double eHeight = size.height / 15;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 15; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = eWdith * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
        Offset(size.width / 2 - eWdith / 2, size.height / 2 - eHeight / 2),
        min(eWdith / 2, eHeight / 2) - 2,
        paint);

    //画白子
    paint.color = Colors.white;
    canvas.drawCircle(
        Offset(size.width / 2 + eWdith / 2, size.height / 2 + eHeight / 2),
        min(eWdith / 2, eHeight / 2) - 2,
        paint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
