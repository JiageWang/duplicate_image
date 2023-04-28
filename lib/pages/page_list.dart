import 'package:duplicate_image/pages/image_clean_page.dart';
import 'package:duplicate_image/pages/image_view_page.dart';
import 'package:flutter/material.dart';

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
