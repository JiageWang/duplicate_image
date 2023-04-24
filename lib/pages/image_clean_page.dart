import "package:duplicate_image/pages/base_page.dart";
import "package:flutter/material.dart";

class ImageCleanPage extends BasePage {
  static const String name = "图片清理";
  static const Icon icon = Icon(Icons.cleaning_services_outlined);

  const ImageCleanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(name);
  }

  @override
  Icon getIcon() {
    return icon;
  }

  @override
  String getName() {
    return name;
  }
}
