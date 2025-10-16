import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/utils/camera_utils.dart';
import 'package:provider/provider.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          context.watch<CameraUtils>().isLoaded
              ? Positioned.fill(
                child: CameraPreview(
                    context.watch<CameraUtils>().controller
                ),
          )
          : const Center(
              child : CircularProgressIndicator()
          ),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 플래쉬 토글 버튼
                    IconButton(onPressed: () {
                      context.read<CameraUtils>().toggleFlash();
                    }, icon: Icon(
                        context.read<CameraUtils>().isFlashOn ? Icons.flash_on_outlined : Icons.flash_off_outlined,
                    size: 24,
                    color: Colors.black,
                    ),
                    ),

                    // 닫기 버튼
                    IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: const Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black,
                    ),
                    ),
                  ],
                )
              ),
              )
          ),
          SafeArea(child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 64),
              child: GestureDetector(
                onTap: () {
                  // 사진 촬영 함수 호출
                  context.read<CameraUtils>().takePicture(context);
                },
                child: Icon(
                  Icons.circle,
                  size: 64,
                  color: context.read<CameraUtils>().canTakePicture ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
