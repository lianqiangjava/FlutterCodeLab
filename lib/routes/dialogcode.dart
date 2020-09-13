import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/comon/comon.dart';

class DialogCode extends StatefulWidget {
  @override
  _DialogCodeState createState() {
    // TODO: implement createState
    return _DialogCodeState();
  }
}

class _DialogCodeState extends State<DialogCode>{

  bool _withTree = false;

  @override
  Widget build(BuildContext context) {
    return scaffoldHead(
      '对话框',
      showMyDialog(context),
    );
  }

  Widget showMyDialog(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('AlertDialog$_withTree'),
          onPressed: () async {
            bool delete = await showAlertDialog(context);
            if (delete == null) {
              print("取消");
            } else {
              print('删除了');
            }
          },
        ),
        RaisedButton(
          child: Text('SimpleDialog'),
          onPressed: () => changeLanguage(context),
        ),
        RaisedButton(
          child: Text('Dialog'),
          onPressed: () => showListDialog(context),
        ),
        RaisedButton(
          child: Text('BootDialog'),
          onPressed: () => _showModalBottomSheet(),
        ),
        RaisedButton(
          child: Text('BootSheet'),
          onPressed: () => _showBottomSheet(),
        ),
        RaisedButton(
          child: Text('Loading'),
          onPressed: () => showLoadingDialog(),
        ),
        RaisedButton(
          child: Text('日历'),
          onPressed: () => _showDatePicker1(),
        ),
        RaisedButton(
          child: Text('ios日历'),
          onPressed: () => _showDatePicker2(),
        ),


      ],
    );
  }

  Future<bool> showAlertDialog(BuildContext context) {
    return showCustomDialog<bool>(
        context: context,
//        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('要删除当前文件吗'),

                Row(
                  children: <Widget>[
                    Text('同时删除子目录？'),
                    StatefulBuilder(
                      builder: (context,_setState){
                        return Checkbox(
                          value: _withTree,
                          onChanged: (bool value){
//                        (context as Element).markNeedsBuild();
                            _setState(() {
                              _withTree = !_withTree;
                            });
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () {

                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }

  Future<void> changeLanguage(BuildContext context) async {
    int i = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(1);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(2);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('美鱼'),
                ),
              )
            ],
          );
        });
    if (i != null) {
      print("选择了${i == 1 ? '中文' : '英文'}");
    }
  }

  Future<void> showListDialog(BuildContext context) async {
    int index = await showDialog(
        context: context,
        builder: (context) {
          var child =  Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, int index) {
                      return ListTile(
                        title: Text('$index'),
                        onTap: () => Navigator.of(context).pop(index),
                      );
                    }),
              ),
            ],
          );

          return Dialog(
              child: child);
        });
  }

  Future<void> showBootDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          var child = Container(
            color: Colors.transparent,
            height: 120,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new ListTile(
                  title: Text('拍照'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  title: Text('从相册中选择'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );

          return Dialog(child: child);
        });
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDisimissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(
            builder: (context) {
              return theme != null
                  ? Theme(data: theme, child: pageChild)
                  : pageChild;
            },
          ),
        );
      },
      barrierDismissible: barrierDisimissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransition,
    );
  }

  Widget _buildMaterialDialogTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child
      ){
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut
      ),
      child: child,
    );
  }

  // 弹出底部菜单列表模态对话框
  Future<int> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
          ),
        );
      },
    );
  }

  // 返回的是一个controller
  PersistentBottomSheetController<int> _showBottomSheet() {
    return showBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: (){
                // do something
                print("$index");
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
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
            width: 260,
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

  //日历
  Future<DateTime> _showDatePicker1() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add( //未来30天可选
        Duration(days: 90),
      ),
    );
  }

  //IOS日历
  Future<DateTime> _showDatePicker2() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white
          ),

          child: SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              minimumDate: date,
              backgroundColor: Colors.red,
              maximumDate: date.add(
                Duration(days: 30),
              ),
              maximumYear: date.year + 1,
              onDateTimeChanged: (DateTime value) {
                print(value);
              },
            ),
          ),
        );
      },
    );
  }
}
