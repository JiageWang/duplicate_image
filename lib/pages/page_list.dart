import 'package:duplicate_image/pages/base_page.dart';
import 'package:duplicate_image/pages/image_clean_page.dart';
import 'package:duplicate_image/pages/image_view_page.dart';
import 'package:flutter/material.dart';

List<BasePage> pageList = [const ImageViewPage(), const ImageCleanPage()];
List pageNameList = [ImageViewPage.name, ImageCleanPage.name];
List pageIconList = [ImageViewPage.icon, ImageCleanPage.icon];

List<Widget> drawerItemList = [
  for(var page in pageList) NavigationDrawerDestination(icon: page.getIcon(), label: Text(page.getName()))
];
