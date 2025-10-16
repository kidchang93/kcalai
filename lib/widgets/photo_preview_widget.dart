import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/screen/result_screen.dart';
import 'package:kcalai/services/api_service.dart';

class PhotoPreviewWidget extends StatefulWidget {
  final XFile imageFile;
  const PhotoPreviewWidget({super.key, required this.imageFile});

  @override
  State<PhotoPreviewWidget> createState() => _PhotoPreviewWidgetState();
}

class _PhotoPreviewWidgetState extends State<PhotoPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Image.file(File(widget.imageFile.path)),
            ),
            Positioned(
              bottom: 64,
              left: 128,
              right: 128,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final predictions = await ApiService.uploadPhoto(
                      File(widget.imageFile.path),
                    );

                    if (!mounted) return; // ✅ context 안전성 보장

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
                    if (!mounted) return;
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