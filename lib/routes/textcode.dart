import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文本示例'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              '文本内容居中',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              '文本长度不能超过一行.' * 4,
              maxLines: 1,
              overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 9, 10, 13),
            child: Text('textScaleFactor为1.5', textScaleFactor: 1.5,
            textDirection: TextDirection.rtl,
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            child: Text(
              "带样式文本",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                height: 1.5,
                fontFamily: "Courier",
//              background: new Paint()..color = Colors.yellow,
                backgroundColor: Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "文本片段: "
                ),
                TextSpan(
                  text: "https://baidu.com",
                  style: TextStyle(
                    color: Colors.blue
                  ),

                ),
              ]
            )
          ),
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
              fontFamily: 'Pacifico'
            ),
            textAlign: TextAlign.start,
            child: Column(
              children: <Widget>[
                Text("使用父级默认样式"),
                Text("使用父级默认样式"),
                Text("Pacifico:fontFamily"),
                Text(
                  "Schoolbell: fontFamily",
                  style: TextStyle(
                    fontFamily: 'Schoolbell'
                  ),
                ),
                Text("不继承父级默认样式",
                style: TextStyle(
//                  inherit: false,
                  color: Colors.black,
                  fontFamily: 'LiuJianMaoCao'
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
