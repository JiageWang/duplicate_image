import 'dart:io';

import 'package:duplicate_image/pages/base_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImageViewPage extends BasePage {
  static const String name = "图片浏览";
  static const Icon icon = Icon(Icons.menu);

  const ImageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _imageList,
      builder: (context, snapshot) {
        Widget widget;
        if (snapshot.connectionState == ConnectionState.done) {
          widget = ListView( // 提供滑动功能
            children: [
              Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  runSpacing: 10,
                  children: snapshot.data!
                      .map((path) => Image.file(File(path),
                          height: 400, fit: BoxFit.fitHeight))
                      .toList())
            ],
          );
        } else {
          widget = const Text("test");
        }
        return widget;
      },
    );
  }

  Future<List<String>> get _imageList async {
    List<String> imagePathList = [];
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = '${documentsDirectory.path}${Platform.pathSeparator}';

    Stream<FileSystemEntity> fileList = Directory(path).list();
    await for (FileSystemEntity fileSystemEntity in fileList) {
      var path = fileSystemEntity.path;
      if (FileSystemEntity.typeSync(path) == FileSystemEntityType.file &&
          path.endsWith(".jpg")) imagePathList.add(fileSystemEntity.path);
    }
    return imagePathList;
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
