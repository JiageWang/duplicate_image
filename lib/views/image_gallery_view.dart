import 'dart:io';

import 'package:duplicate_image/views/image_view.dart';
import 'package:flutter/material.dart';

class ImageGalleryView extends StatefulWidget {
  final String imagePath;

  const ImageGalleryView({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<ImageGalleryView> createState() => _ImageGalleryViewState();
}

class _ImageGalleryViewState extends State<ImageGalleryView> {
  List<String> imageList = [];

  @override
  void initState() {
    super.initState();
    getImageList(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: Text(widget.imagePath)),
        Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            children: imageList
                .map((path) => ImageView(imagePath: path))
                .toList())
      ],
    );
  }

  void getImageList(String path) async {
    Stream<FileSystemEntity> fileList = Directory(path).list(recursive: false);
    await for (FileSystemEntity fileSystemEntity in fileList) {
      var file = fileSystemEntity.path;
      if (FileSystemEntity.typeSync(file) == FileSystemEntityType.file &&
          (file.endsWith(".jpg") || file.endsWith(".png"))) {
        setState(() {
          imageList.add(file);
        });
      }
    }
  }
}
