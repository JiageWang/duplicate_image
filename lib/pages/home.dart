import 'package:flutter/material.dart';

import 'image_clean_page.dart';
import 'image_view_page.dart';

List pageList = [const ImageViewPage(), const ImageCleanPage()];
List pageNameList = [ImageViewPage.name, ImageCleanPage.name];
List pageIconList = [ImageViewPage.icon, ImageCleanPage.icon];

var _renderDrawerItemList = () {
  List<Widget> widgetList = [];
  Map.fromIterables(pageNameList, pageIconList).forEach((key, value) {
    widgetList.add(NavigationDrawerDestination(icon: value, label: Text(key)));
  });
  return widgetList;
};
List<Widget> drawerItemList = _renderDrawerItemList();



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("图片管家")),
      drawer: NavigationDrawer(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: drawerItemList,
      ),
      body: Center(
        child: pageList[_currentIndex],
      ),
    );
  }
}
