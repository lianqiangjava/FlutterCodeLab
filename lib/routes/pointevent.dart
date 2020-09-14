import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/comon/comon.dart';

class PointEvent extends StatefulWidget{
@override
_PointEventState createState() {
    return _PointEventState();
  }
}

class _PointEventState extends State<PointEvent>{
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return scaffoldHead('指针事件',
        transPoint()
    );
  }

  Widget constrai(){
    return Listener(
      behavior: HitTestBehavior.opaque,
      child: Container(
        constraints: BoxConstraints(
          minWidth: 400,
          minHeight: 300

        ),

        child: Center(child: Text('AAAAA'),)
      ),
      onPointerDown: (event) => print("downA"),
    );
  }

  Widget contai(){
    return Listener(
      child: Container(
//        alignment: Alignment.center,
        color: Colors.deepOrangeAccent,
//        width: 300,
//        height: 250,
          constraints: BoxConstraints(
              minWidth: 400,
              minHeight: 300
          ),
//        child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white,fontSize: 35),),
          child: Center(child: Text('AAAAA'),)
      ),
      onPointerDown: (PointerDownEvent event) {
        print("object");
//        setState(() {
//          _event = event;
//        });
      },
//      onPointerMove: (PointerMoveEvent event) => setState(()=>_event = event),
//      onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
    );
  }

  Widget transPoint(){
    return Stack(
      children: <Widget>[
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(300.0, 200.0)),
            child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue)),
          ),
          onPointerDown: (event) => print("down0"),
        ),
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(200.0, 100.0)),
            child: Center(child: Text("左上角200*100范围内非文本区域点击")),
          ),
          onPointerDown: (event) => print("down1"),
          //behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
        )
      ],
    );
  }
}