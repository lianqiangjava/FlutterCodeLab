import 'package:flutter/material.dart';

class ClipCode extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.asset("assets/avatar.png",width: 60.0,);
    return Scaffold(
      appBar: AppBar(
        title: Text('剪切示例'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            avatar,
            ClipOval(child: avatar,),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
                Text('你好呀',style: TextStyle(color: Colors.green),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,
                    child: avatar,
                  ),
                ),
                Text('你好呀',style: TextStyle(color: Colors.green),),
              ],
            ),

            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: ClipRect(
                clipper: MyClipper(),
                child: avatar,
              ),
            ),


          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(10, 15, 50, 45);
  }
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}