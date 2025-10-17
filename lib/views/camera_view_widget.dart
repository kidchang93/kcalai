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
    final cameraUtils = context.watch<CameraUtils>();

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
                  // 뒤로 가기 버튼
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 28,
                    color: Colors.white,
                  ),
                  ),

                  // 플래쉬 토글 버튼
                  IconButton(
                    onPressed: () => context.read<CameraUtils>().toggleFlash(),
                    icon: Icon(
                    cameraUtils.isFlashOn ? Icons.flash_on_outlined : Icons.flash_off_outlined,
                    size: 28,
                    color: Colors.white,
                  ),
                  ),

                  // 전면/후면 카메라 전환
                  IconButton(
                    onPressed: () => context.read<CameraUtils>().changeCameraDirection(),
                    icon: const Icon(
                      Icons.cameraswitch,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),

                  // // 그리드/가이드라인 토글 (예시)
                  // IconButton(
                  //   onPressed: () {
                  //     // TODO: grid toggle 기능 추가
                  //   },
                  //   icon: const Icon(
                  //     Icons.grid_on,
                  //     size: 28,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
          ),
            // 카메라 프리뷰 (중앙, 남은 공간 전체 사용)
            Expanded(
              child: cameraUtils.isLoaded ? ClipRRect(
                // borderRadius: BorderRadius.circular(12),
                // child: AspectRatio(aspectRatio: cameraUtils.controller.value.aspectRatio,
                // child: CameraPreview(cameraUtils.controller),
                // ),
                child: CameraPreview(cameraUtils.controller),
              )
              : const Center(child: CircularProgressIndicator(),)
            ),
            // 하단 영역
            Padding(
                padding: const EdgeInsets.only(bottom:32, top: 16),
              child: GestureDetector(
                onTap: () => cameraUtils.takePicture(context),
                child: Icon(
                  Icons.circle,
                  size: 72,
                  color: cameraUtils.canTakePicture ? Colors.white : Colors.grey
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
