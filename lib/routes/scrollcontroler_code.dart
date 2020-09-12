import 'package:flutter/material.dart';

class ScrollControllCode extends StatefulWidget {
  @override
  _ScrollControllCodeState createState() {
    // TODO: implement createState
    return _ScrollControllCodeState();
  }
}

class _ScrollControllCodeState extends State<ScrollControllCode> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;
  String _progress = "0%";
  DateTime _lastPressedAt; //上次点击时间

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.addListener(() {
//      print(_controller.offset);
//      print(_controller.position.pixels);

      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('滚动事件'),
        ),
        body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              double progress = notification.metrics.pixels /
                  notification.metrics.maxScrollExtent;
              setState(() {
                _progress = "${(progress * 100).toInt()}%";
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('$index'),
                    );
                  },
                ),
                CircleAvatar(
                  radius: 30,
                  child: Text(_progress),
                  backgroundColor: Colors.black54,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: !showToTopBtn
            ? null
            : FloatingActionButton(
                child: Icon(Icons.arrow_upward),
                onPressed: () {
                  _controller.animateTo(.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInBack);
                },
              ),
      ),
    );
  }
}
