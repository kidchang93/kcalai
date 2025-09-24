import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/screen/result_screen.dart';
import 'package:kcalai/services/api_service.dart';

class PhotoPreviewWidget extends StatelessWidget{
  final XFile imageFile;
  const PhotoPreviewWidget({super.key, required this.imageFile});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 1. 화면 전체에 사진 표시, 원본 해상도 유지
            Center(
              child: Image.file(
                File(imageFile.path),
                // fit을 없애면 원본 해상도로 표시됨
                // fit: BoxFit.none,
              ),
            ),

            // 2. 버튼은 사진 위에 겹치게
            Positioned(
              bottom: 64,
              left: 128,
              right: 128,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final predictions =
                    await ApiService.uploadPhoto(File(imageFile.path));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("업로드 및 예측 완료")),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultScreen(predictions: predictions),
                      ),
                    );
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
      ),
    );
  }
}