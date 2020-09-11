import 'package:flutter/material.dart';

class BoxCode extends StatelessWidget{

  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.red
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('容器示例'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50.0
              ),
              child: Container(
                height: 15.0,
                child: redBox,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: 80.0,
                height: 100.0,
                child: redBox,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 60,height: 60),
              child: redBox,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60,minHeight: 60),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90,minHeight: 20),
                child: redBox,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90,minHeight: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60,minHeight: 60),
                  child: redBox,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth:20,maxWidth: 30,minHeight:20,maxHeight: 60),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth:20,maxWidth: 90,minHeight:20,maxHeight: 20),
                child: SizedBox(
                  width: 70,
                  height: 30,
                  child: redBox,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60,minHeight: 100),
                child: UnconstrainedBox(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 100,minHeight: 20),
                    child: redBox,
                  ),
                ),
              ),
            ),

            AspectRatio(
              aspectRatio: 4,
              child: SizedBox(
                child: redBox,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LimitedBox(maxWidth: 20,maxHeight: 50,
              child: SizedBox(
                width: 170,
                height: 70,
                child: redBox,
              ),),
            ),

            //装饰容器
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: DecoratedBox(
                position: DecorationPosition.background,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red,Colors.orange[700]]
                  ),
                  borderRadius: BorderRadius.circular(4),
//                  backgroundBlendMode: BlendMode.darken,
                shape: BoxShape.rectangle,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0,2.0),
                      blurRadius: 4.0
                    )
                  ]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80,vertical: 15),
                  child: Text('Login',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}