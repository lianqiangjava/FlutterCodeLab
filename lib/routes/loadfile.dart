import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadFile extends StatefulWidget{
 @override
 _LoadFileState createState() {
    return new _LoadFileState();
  }
}

class _LoadFileState extends State<LoadFile>{
  String jsonStr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Second'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          children: <Widget>[
            Text(jsonStr),
            RaisedButton(
              child: Text('获取json文件'),
              onPressed: () async {
                var result = await rootBundle.loadString('assets/user.json');
                setState(() {
                  jsonStr += result;
                });

//              ScaffoldState _state = Scaffold.of(context);
//              _state.showSnackBar(
//                SnackBar(content: Text('data'))
//              );
              },
            ),
            Image.asset('assets/face.jpg')
          ],
        ),
      ),
    );

  }
}