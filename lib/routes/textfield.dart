import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldCode extends StatefulWidget{
  @override
  _TextFieldState createState() {
    return new _TextFieldState();
  }
}

class _TextFieldState extends State<TextFieldCode>{

  String userName;
  String password;

  TextEditingController _unameController = new TextEditingController();

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    _unameController.text = "hello flutter";
    _unameController.selection = TextSelection(
        baseOffset: 2,
        extentOffset: _unameController.text.length
    );
    focusNode2.addListener(() {
      print(focusNode2.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('输入框和表单示例'),
      ),
      body: Builder(
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person),
                    // 未获得焦点下划线设为灰色
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.grey),
                    ),
                    //获得焦点下划线设为蓝色
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                    ),
                  ),
                  focusNode: focusNode1,
                  controller: _unameController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  maxLengthEnforced: false,
                  cursorColor: Colors.red,
                  cursorRadius: Radius.circular(15),
                  onChanged: (value){
                    setState(() {
                      userName = value;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "登录密码",
                      prefixIcon: Icon(Icons.lock)
                  ),
                  focusNode: focusNode2,
                  obscureText: true,
                  onChanged: (value){
                    setState(() {
                      password = value;
                    });
                  },
                ),

                Text(
                    '用户名：$userName'
                ),
                Text('密码:$password'),

                RaisedButton(
                  child: Text('通过controller获取输入内容'),
                  onPressed: (){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text(_unameController.text)));
                    print(_unameController.text);
                  },
                ),

                RaisedButton(
                  child: Text('移动焦点'),
                  onPressed: (){
                    if(null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text('隐藏键盘'),
                  onPressed: (){
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),

                RaisedButton(
                  child: Text('Form示例'),
                  onPressed: () => Navigator.of(context).pushNamed('formcode'),
                ),

              ],
            ),
          );
        },

      ),
    );

  }
}