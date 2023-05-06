import 'dart:io';

import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imagePath;
  final List<String> imageList;

  const ImageView({Key? key, required this.imagePath, required this.imageList})
      : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child:
            Image.file(File(widget.imagePath), height: 200, fit: BoxFit.cover),
        onTap: () {
          Navigator.pushNamed(context, "/photo_view", arguments: {
            "imageList": widget.imageList,
            "index": widget.imageList.indexOf(widget.imagePath)
          });
        });
  }
}
