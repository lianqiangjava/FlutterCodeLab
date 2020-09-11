import 'package:flutter/material.dart';

class FormCode extends StatefulWidget{
  @override
  _FormCodeState createState() {
    return new _FormCodeState();
  }
}

class _FormCodeState extends State<FormCode>{
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单示例'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24.0),
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          onWillPop: (){
            return Future.value(true);
          },
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText:"用户名或邮箱",
                  icon: Icon(Icons.person)
                ),
                //校验用户名
                validator: (v){
                  return v.trim().length > 0 ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  icon: Icon(Icons.lock)
                ),
                obscureText: true,
                //校验密码
                validator: (v){
                  return v.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              //登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        child: Text('登录'),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                          if((_formKey.currentState as FormState).validate()){
                              print("登录成功");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //清除内容
              RaisedButton(
                child: Text('清空表单'),
                onPressed: (){
                  (_formKey.currentState as FormState).reset();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}