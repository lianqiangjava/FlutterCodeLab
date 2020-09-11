import 'package:flutter/material.dart';

class ImageCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('图片示例'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage("assets/face.jpg"),
                width: 50,
                height: 50,
              ),
              Image.asset(
                "assets/face.jpg",
                width: 50,
                height: 50,
              )
            ],
          ),
          Row(
            children: <Widget>[
              Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 50,
                height: 50,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Text('使用BoxFit.fill属性:拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形'),
                Container(
                  width: 400,
                  height: 100,
                  child: Image.network(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//              width: 100,
//              height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                    '使用BoxFit.contain属性:默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形'),
                Container(
                  width: 400,
                  height: 100,
                  color: Colors.green[100],
                  child: Image.network(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//              width: 100,
//              height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                Text('使用BoxFit.cover属性:按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁'),
                Container(
                  width: 400,
                  height: 100,
                  color: Colors.green[100],
                  child: Image.network(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//              width: 100,
//              height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                    '使用BoxFit.fitWidth属性:宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。'),
                Container(
                  width: 400,
                  height: 100,
                  color: Colors.green[100],
                  child: Image.network(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//              width: 100,
//              height: 100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                    '使用BoxFit.fitHeight属性:高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。'),
                Container(
                  width: 400,
                  height: 100,
                  color: Colors.green[100],
                  child: Image.network(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//              width: 100,
//              height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Text('使用BoxFit.scaleDown属性:'),
                Container(
                  width: 400,
                  height: 100,
                  color: Colors.green[100],
                  child: Image.network(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//              width: 100,
//              height: 100,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Text(
                    '使用BoxFit.none属性:图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。'),
                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.green[100],
                      child: Image.network(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//              width: 100,
//              height: 100,
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                ),
                Text('color混合模式'),
                Container(
                  height: 200,
                  child: Image.network(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//              width: 100,
//              height: 100,
                    fit: BoxFit.scaleDown,
                    color: Colors.blue,
                    colorBlendMode: BlendMode.difference,
                  ),
                ),
                Text('repeat'),
                Column(
                  children: <Widget>[
                    Container(
                      height: 300,
                      child: Image.network(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                        width: 100,
                        height: 50,
                        repeat: ImageRepeat.repeatY,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
