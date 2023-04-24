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
          widget = _renderlistView(snapshot.data);
        } else {
          widget = const Text("test");
        }
        return widget;
      },
    );
  }

  Future<Map<String, List<String>>> get _imageList async {
    Map<String, List<String>> imagePathList = {};
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = '${documentsDirectory.path}${Platform.pathSeparator}images';

    Stream<FileSystemEntity> fileList = Directory(path).list(recursive: true);
    await for (FileSystemEntity fileSystemEntity in fileList) {
      var path = fileSystemEntity.path;
      if (FileSystemEntity.typeSync(path) == FileSystemEntityType.file &&
          path.endsWith(".jpg")) {
        String dir = fileSystemEntity.parent.path;
        if (imagePathList.containsKey(dir)) {
          imagePathList[dir]!.add(path);
        } else {
          imagePathList[dir] = [path];
        }
      }
    }
    return imagePathList;
  }

  ListView _renderlistView(Map<String, List<String>>? pathMap) {
    List<Widget> itemList = [];

    pathMap?.forEach((key, value) {
      itemList.add(ListTile(title: Text(key)));
      itemList.add(Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 10,
              children: value
                  .map((path) => Image.file(File(path),
                      height: 200, fit: BoxFit.fitHeight))
                  .toList())));
    });

    return ListView(children: itemList);
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
