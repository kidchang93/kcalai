import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/services/api_service.dart';

class PhotoPreviewWidget extends StatelessWidget{
  final XFile imageFile;
  const PhotoPreviewWidget({super.key, required this.imageFile});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("사진 미리보기")),
      body: Column(
        children: [
          Expanded(child: Image.file(File(imageFile.path)),
          ),
          Padding(padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(onPressed: () async {
            try {
              final result = await ApiService.uploadPhoto(File(imageFile.path));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(result)),
              );
              Navigator.pop(context); // 촬영 화면으로 돌아가기
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(e.toString())),
              );
            }
          },
            child: const Text("서버 전송"),
          ),
          ),
        ],
      ),
    );
  }
}