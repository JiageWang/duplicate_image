import "package:flutter/material.dart";

class ImageCleanPage extends StatefulWidget{
  static const String name = "图片清理";
  static const Icon icon = Icon(Icons.cleaning_services_outlined);

  const ImageCleanPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageCleanPage();
}

class _ImageCleanPage extends State<ImageCleanPage>{
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("图片清理"));
  }
}
