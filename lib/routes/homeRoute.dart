import 'package:flutter/material.dart';
import 'package:fluttergithubapp/models/user.dart';
import 'package:fluttergithubapp/common/progressViewUtil.dart';
import 'package:fluttergithubapp/widgets/reposPage.dart';
import '../widgets/myDrawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 选中的bottonBar的索引
  int _selectedIndex = 0;
  List tabs = ["首页","Bus","设置"];
  var pages;

  void onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
    pages = [ReposPage(user.login),ReposPage(user.login),ReposPage(user.login)];
    return Scaffold(
      appBar: AppBar(
        title: Text(tabs[_selectedIndex]),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: (){
                ProgressUtils.showNoContentDialog(context);
              }
          ),
        ],
      ),
      drawer: MyDrawer(user: user),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text(tabs[0])),
            BottomNavigationBarItem(icon: Icon(Icons.business),title: Text(tabs[1])),
            BottomNavigationBarItem(icon: Icon(Icons.settings),title: Text(tabs[2])),
          ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: onItemTapped,
      ),
      body: pages[_selectedIndex],
    );
  }
}