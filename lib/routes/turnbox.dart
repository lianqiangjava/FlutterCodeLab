import 'package:flutter/material.dart';
import 'package:flutter_practice/comon/comon.dart';


class TurnBoxRoute extends StatefulWidget{
  @override
  _TurnBoxRouteState createState() {
    return _TurnBoxRouteState();
  }
}

class _TurnBoxRouteState extends State<TurnBoxRoute>{
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return scaffoldHead(
      "旋转按钮",
      Center(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(Icons.refresh,size: 50,),
            ),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(Icons.refresh,size: 150,),
            ),
            RaisedButton(
              child: Text("顺时针旋转1/5圈"),
              onPressed: (){
                setState(() {
                  _turns += 0.2;
                });
              },
            ),
            RaisedButton(
              child: Text("逆时针1/5全"),
              onPressed: (){
                setState(() {
                  _turns -= 0.2;
                });
              },
            ),
          ],
        ),
      )
    );

  }
}














class TurnBox extends StatefulWidget{

  TurnBox({
    Key key,
    this.turns = 0.0,//旋转的“圈”数,一圈为360度，如0.25圈即90度
    this.speed = 200,
    this.child
}) :super(key:key);
  final double turns;
  final int speed;
  final Widget child;

  @override
  _TurnBoxState createState() {
    // TODO: implement createState
    return _TurnBoxState();
  }
}

class _TurnBoxState extends State<TurnBox>
    with SingleTickerProviderStateMixin{

  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
        vsync: this,
        lowerBound: -double.infinity,
        upperBound: double.infinity
    );
    _controller.value = widget.turns;

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.turns != widget.turns){
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed??200),
        curve: Curves.easeOut
      );
    }
  }
}


