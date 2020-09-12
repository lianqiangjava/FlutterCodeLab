import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListViewCode extends StatefulWidget {
  @override
  _ListViewCodeState createState() {
    return _ListViewCodeState();
  }
}

const loadingTag = "##loading##"; //表尾标记
var _words = <String>[loadingTag];

class _ListViewCodeState extends State<ListViewCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView示例'),
      ),
      body: listViewHaveTop(),
    );
  }

  //模拟获取数据
  void _retrieveDate() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
        print(_words.toString());
      });
    });
  }

  //有数据源的listview
  Widget listViewSeparatedBindData() {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveDate();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(6.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            );
          } else {
            //已经加载了100条了，不再获取
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(6),
              child: Text('没有更多了'),
            );
          }
        }
        return ListTile(
          title: Text(_words[index]),
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: 2,
        thickness: 2,
        indent: 60,
        endIndent: 30,
        color: Colors.red,
      ),
    );
  }
}

//默认方法，此方法不带懒加载功能
Widget listViewNomal() {
  return ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.all(20.0),
    children: <Widget>[
      const Text('I\'m dedicating every day to you'),
      const Text('Domestic life was never quite my style'),
      const Text('When you smile, you knock me out, I fall apart'),
      const Text('And I thought I was so smart'),
    ],
  );
}

//itemBuilder此方式带有懒加载功能
Widget listViewBuilder() {
  return Scrollbar(
    child: ListView.builder(
      itemCount: 100,
      itemExtent: 50.0,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("$index"),
        );
      },
    ),
  );
}

//与上面方法区别是带分割线
Widget listViewSeparated() {
  Widget divider1 = Divider(
    color: Colors.blue,
  );
  Widget divider2 = Divider(
    color: Colors.grey,
  );
  return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('$index'),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
      itemCount: 100);
}

Widget listViewHaveTop() {
  return Column(
    children: <Widget>[
      ListTile(
        title: Text('列表'),
      ),
      Expanded(
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('$index'),
              );
            }),
      )
    ],
  );
}
