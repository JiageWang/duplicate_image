import 'dart:io';

import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imagePath;

  const ImageView({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final GlobalKey _imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        ElevatedButton(
            key: _imageKey,
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
            child: Image.file(File(widget.imagePath),
                height: 200, fit: BoxFit.cover),
            onPressed: () {

            }),
      ],
    );
  }
}
