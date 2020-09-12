import 'package:flutter/material.dart';
import 'package:flutter_practice/routes/buttoncode.dart';
import 'package:flutter_practice/routes/containercode.dart';
import 'package:flutter_practice/routes/textcode.dart';
import 'package:flutter_practice/routes/transform.dart';

class AppBarAndDrawer extends StatefulWidget {
  @override
  _AppBarAndDrawerState createState() {
    return new _AppBarAndDrawerState();
  }
}

class _AppBarAndDrawerState extends State<AppBarAndDrawer>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航栏'),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.red,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 50),
          tabs: tabs.map((e) => Tab(text: e,icon: Icon(Icons.forward),)).toList(),
        ),
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.business), title: Text('Business')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.school), title: Text('School')),
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        onTap: _onItemTapped,
//      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),color:Colors.blue,onPressed: (){},),
            SizedBox(),
            IconButton(icon: Icon(Icons.business),),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,

        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          TextCode(),
          TransForm(),
          ContainerCode(),
        ],
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  void _onAdd() {}
}


class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Text('ff'),
              )
            ],
          )
      ),
    );
  }
}