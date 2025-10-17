import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/screen/result_screen.dart';
import 'package:kcalai/services/api_service.dart';
import 'package:kcalai/styles/style.dart';
import 'package:photo_view/photo_view.dart';

class PhotoPreview extends StatefulWidget {
  final XFile imageFile;
  final double aspectRatio;
  const PhotoPreview({
    super.key,
    required this.imageFile,
    required this.aspectRatio,
  });

  @override
  State<PhotoPreview> createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends State<PhotoPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // 상단 영역 ( 플래쉬 + 닫기 버튼 )
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 28,
                    color: Colors.white,
                  ),
                  ),
                  // Text('미리보기', style: AppTextStyles.whiteText,),
                  // 플래쉬 토글 버튼
                  // IconButton(onPressed: () {
                  //   context.read<CameraUtils>().toggleFlash();
                  // }, icon: Icon(
                  //   cameraUtils.isFlashOn ? Icons.flash_on_outlined : Icons.flash_off_outlined,
                  //   size: 28,
                  //   color: Colors.white,
                  // ),
                  // ),
                  // 닫기 버튼

                ],
              ),
            ),
            // 카메라 프리뷰 (중앙, 남은 공간 전체 사용)
            Expanded(
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(12),
                  child: PhotoView(
                    imageProvider: FileImage(File(widget.imageFile.path)),
                    minScale: PhotoViewComputedScale.covered,
                    maxScale: PhotoViewComputedScale.covered * 3.0,
                    backgroundDecoration:
                    const BoxDecoration(color: Colors.black),
                  ),
                ),
            ),
            // 하단 영역
            Padding(
              padding: const EdgeInsets.only(bottom:32, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: () async {
                    try {
                      
                      final predictions = await ApiService.uploadPhoto(
                        File(widget.imageFile.path),
                      );

                      if (!mounted) return; // ✅ context 안전성 보장

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
                      style: TextButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12) //  둥근 모서리
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        backgroundColor: Colors.white,
                      ),
                      child: Text('서버 전송', style: AppTextStyles.blackText),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
