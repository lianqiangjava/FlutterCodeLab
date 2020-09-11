import 'package:flutter/material.dart';

class SwitchAndCheckBox extends StatefulWidget {
  @override
  _SwitchAndCheckBoxState createState() {
    return new _SwitchAndCheckBoxState();
  }
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBox> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('单选开关和复选框示例'),
      ),
      body: Column(
        children: <Widget>[
          Switch(
              value: _switchSelected,
              activeColor: Colors.green,
              onChanged: (value){
                setState(() {
                  _switchSelected = value;
                });
              }
          ),
          Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.blue,
            tristate: true,
            onChanged: (value){
              setState(() {
                _checkboxSelected = value;
              });
            },
          )
        ],
      ),
    );
  }
}
