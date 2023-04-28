import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImageViewPage extends StatefulWidget {
  static const String name = "图片浏览";
  static const Icon icon = Icon(Icons.menu);

  const ImageViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageViewPage();
}

class _ImageViewPage extends State<ImageViewPage> {
  final Map<String, List<String>> _imagePathMap = {};

  @override
  void initState() {
    super.initState();
    getImageList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: _imagePathMap.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(_imagePathMap.keys.toList()[index]));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 10,
              children: _imagePathMap[_imagePathMap.keys.toList()[index]]!
                  .map((path) => Image.file(File(path), height: 200, fit: BoxFit.fitHeight))
                  .toList());
        });
  }

  void getImageList() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = '${documentsDirectory.path}${Platform.pathSeparator}images';

    Stream<FileSystemEntity> fileList = Directory(path).list(recursive: true);
    await for (FileSystemEntity fileSystemEntity in fileList) {
      var path = fileSystemEntity.path;
      if (FileSystemEntity.typeSync(path) == FileSystemEntityType.file &&
          path.endsWith(".jpg")) {
        String dir = fileSystemEntity.parent.path;
        if (_imagePathMap.containsKey(dir)) {
          setState(() {
            _imagePathMap[dir]!.add(path);
          });
        } else {
          setState(() {
            _imagePathMap[dir] = [path];
          });
        }
      }
    }
  }
}
