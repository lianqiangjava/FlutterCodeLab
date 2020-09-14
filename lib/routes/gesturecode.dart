import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/comon/comon.dart';

class GestureCode extends StatefulWidget{
  @override
  _GestureCodeState createState() {
    // TODO: implement createState
    return _GestureCodeState();
  }

}

class _GestureCodeState extends State<GestureCode>{
  
  String _operation = "No Gestrue detecter";
  double _top = 0.0;
  double _left = 0.0;
  double _width = 200;

  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return scaffoldHead(
      '手势识别',
      Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 200,
              height: 100,
              child: Text(
                _operation,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              ),
            ),
            onTap: () => updateText("Tap"),
            onDoubleTap: () => updateText("Double Tap"),
            onLongPress: () => updateText("Long Press"),
//            onPanDown: (e) => updateText("Long Press${e.localPosition}"),
          ),

          Container(
            width: 400,
            height: 100,

            child: Stack(
              textDirection: TextDirection.ltr,
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: _top,
                  left: _left,
                  child: Listener(
                    onPointerDown: (e){
                      print("down");
                    },
                    onPointerUp: (e){
                      print("up");
                    },

                    child: GestureDetector(
                      
                      child: CircleAvatar(child: Text('A'),),
//                    onTapDown: (e){
//                      print("down");
//                    },
//                    onPanUpdate: (e){
//                      setState(() {
//                        _left += e.delta.dx;
//                        _top += e.delta.dy;
//                      });
//                    },
//                    onVerticalDragUpdate: (e){
//                      print("VerDrag");
//                      setState(() {
//                        _top+= e.delta.dy;
//                      });
//                    },
                      onHorizontalDragUpdate: (e){

                        setState(() {
                          _left+= e.delta.dx;
                        });
                      },
                      onHorizontalDragEnd: (e){
                        print("HorDragEnd");
                      },
//                    onTapUp: (e){
//                      print("up");
//                    },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: GestureDetector(
              child: Image.asset("assets/avatar.png",width: _width,),


              onScaleUpdate: (ScaleUpdateDetails detail){
                print(detail.scale);

                setState(() {
                  _width = 100 * detail.scale.clamp(0.8, 10);
                });
              },
            ),
          ),

          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '哈哈哈哈'),
                  TextSpan(
                    text: "点我变色",
                    style: TextStyle(
                      fontSize: 30,
                      color: _toggle ? Colors.blue : Colors.red
                    ),
                    recognizer: _tapGestureRecognizer
                      ..onTap = (){
                        setState(() {
                          _toggle = !_toggle;
                        });
                      }
                  ),
                  TextSpan(text: "灌灌灌灌灌")
                ]
              )
            ),
          ),
        ],
      )
    );
  }

  updateText(String s) {
    setState(() {
      _operation = s;
    });
  }


}