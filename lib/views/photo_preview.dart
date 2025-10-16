import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/styles/style.dart';
import 'package:photo_view/photo_view.dart';

class PhotoPreview extends StatefulWidget {
  final XFile imageFile;
  const PhotoPreview({super.key, required this.imageFile});

  @override
  State<PhotoPreview> createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends State<PhotoPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.black,
      //   iconTheme: const IconThemeData(color: Colors.white),
      // ),
      body: Column(
        children: [
          Expanded(
            child: PhotoView(imageProvider: FileImage(File(widget.imageFile.path)),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 3.0,
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            heroAttributes: const PhotoViewHeroAttributes(tag: 'photo-preview'),
          ),
          ),
        ],
      ),
    );
  }
}
