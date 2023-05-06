import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageDtalView extends StatefulWidget {
  final Map args;

  const ImageDtalView({Key? key, required this.args}) : super(key: key);

  @override
  State<ImageDtalView> createState() => _ImageDtalViewState();
}

class _ImageDtalViewState extends State<ImageDtalView> {
  late int _currentIndex;
  late List<String> _imageList;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.args["index"];
    _imageList = widget.args["imageList"];
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    // Map args = ModalRoute.of(context)!.settings.arguments as Map;
    // List<String> imageList = args["imageList"] as List<String>;
    // _currentIndex = _currentIndex < 0 ? args["index"] as int : _currentIndex;
    // pageController.initialPage
    return Scaffold(
        appBar: AppBar(title: const Text("预览")),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              backgroundDecoration: const BoxDecoration(color: Colors.black12),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: FileImage(File(_imageList[index])),
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                  heroAttributes:
                      PhotoViewHeroAttributes(tag: _imageList[index]),
                );
              },
              itemCount: _imageList.length,
              pageController: _pageController,
            ),
            Positioned(
                left: 10,
                child: IconButton(
                    iconSize: 50,
                    onPressed: () {
                      setState(() {
                        _currentIndex = max(_currentIndex - 1, 0);
                        _pageController.jumpToPage(_currentIndex);
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_left))),
            Positioned(
                right: 10,
                child: IconButton(
                    iconSize: 50,
                    onPressed: () {
                      setState(() {
                        _currentIndex =
                            min(_currentIndex + 1, _imageList.length - 1);
                        _pageController.jumpToPage(_currentIndex);
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_right))),
          ],
        ));
  }
}
