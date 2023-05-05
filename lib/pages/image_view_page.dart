import 'dart:io';

import 'package:duplicate_image/views/image_gallery_view.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

class ImageViewPage extends StatefulWidget {
  static const String name = "图片浏览";
  static const Icon icon = Icon(Icons.menu);

  const ImageViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageViewPage();
}

class _ImageViewPage extends State<ImageViewPage> {
  bool _pathPicked = false;
  late String _imagePath;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_pathPicked) {
      return ListView(children: [ImageGalleryView(imagePath: _imagePath)]);
    } else {
      return ElevatedButton(
          onPressed: () async {
            final String? directoryPath = await getDirectoryPath();
            if (directoryPath == null) {
              return;
            } else {
              setState(() {
                _pathPicked = true;
                _imagePath = directoryPath;
              });
              print(_imagePath);
            }
          },
          child: const Text("请选择文件夹"));
    }
  }

// void getImageList(String path) async {
//   Stream<FileSystemEntity> fileList = Directory(path).list(recursive: true);
//   await for (FileSystemEntity fileSystemEntity in fileList) {
//     var file = fileSystemEntity.path;
//     if (FileSystemEntity.typeSync(file) == FileSystemEntityType.file &&
//         (file.endsWith(".jpg") || file.endsWith(".png"))) {
//       String dir = fileSystemEntity.parent.path;
//       _imagePathList.add(dir);
//     }
//   }
// }
}
