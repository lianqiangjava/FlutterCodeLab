import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/comon/comon.dart';
import 'package:flutter_practice/http/http.dart';
import 'package:flutter_practice/model/user_entity.dart';

class DioCode extends StatefulWidget {
  @override
  _DioCodeState createState() {
    return _DioCodeState();
  }
}

class _DioCodeState extends State<DioCode> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dio.interceptors.add(LogInterceptor());
  }

  @override
  Widget build(BuildContext context) {
    return scaffoldHead(
        "Dio示例",
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                RaisedButton(
                  child: Text("发起Get请求"),
                  onPressed: () async {
                    try{
                      showLoadingDialog();

                      Response response = await dio.get("users/lianqiangjava");
                      Navigator.of(context).pop();
                      showData(UserEntity().fromJson(response.data).toJson().toString());
//                      print(response.data);
                    } on DioError catch(e){
                      Navigator.of(context).pop();
                      if(e.response!=null){
                        print(e.response.data);
                      }
                      showData(e.message);
                      print("ff*************"+e.message);
                    }


                  },
                ),
              ],
            ),
          ),
        ));
  }

  //加载框
  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 320,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //显示接口返回内容
  showData(String msg) {
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          content: Text(msg),
          actions: [
            FlatButton(
              child: Text('确定'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      }
    );
  }
}
