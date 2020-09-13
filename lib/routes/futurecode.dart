import 'package:flutter/material.dart';

class FutureCode extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('异步处理'),
      ),
      body: useStreamBuild(),
    );
  }

  Widget useStreamBuild(){
    return StreamBuilder<int>(
      stream: counter(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot){
        if(snapshot.hasError){
          return Text('Error');
        }
        switch(snapshot.connectionState){
          case ConnectionState.none:
            return Text("none");
          case ConnectionState.waiting:
            return Text("waiting");
          case ConnectionState.active:
            return Text("active:${snapshot.data}");
          case ConnectionState.done:
            return Text("done");
        }
        return null;
      },
    );
  }

  Widget useFutureBuild(){
    return Center(
      child: FutureBuilder<String>(
        future: mockNetworkData(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Text("出错了");
            }else{
              return Text(snapshot.data);
            }
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2),() => "我是数据源");
  }
  
  Stream<int> counter(){
    return Stream.periodic(Duration(seconds: 1),(i){
      return i;
    });
  }
}