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
  bool _showGuide = true;

  @override
  void initState() {
    super.initState();
    // 2초 후 안내 메시지 숨기기
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showGuide = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cameraUtils = context.watch<CameraUtils>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // 카메라 프리뷰 (4:3 비율)
            Center(
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF4CAF50).withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: cameraUtils.isLoaded 
                      ? CameraPreview(cameraUtils.controller)
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                  ),
                ),
              ),
            ),

            // 상단 컨트롤 영역
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 뒤로 가기 버튼
                    _buildControlButton(
                      icon: Icons.arrow_back_ios,
                      onPressed: () => Navigator.pop(context),
                    ),

                    const Spacer(),

                    // 플래쉬 토글 버튼
                    _buildControlButton(
                      icon: cameraUtils.isFlashOn ? Icons.flash_on : Icons.flash_off,
                      onPressed: () => context.read<CameraUtils>().toggleFlash(),
                      isActive: cameraUtils.isFlashOn,
                    ),

                    const SizedBox(width: 8),

                    // 전면/후면 카메라 전환
                    _buildControlButton(
                      icon: Icons.cameraswitch,
                      onPressed: () => context.read<CameraUtils>().changeCameraDirection(),
                    ),
                  ],
                ),
              ),
            ),

            // 중앙 안내 텍스트 (1초 후 사라짐)
            AnimatedOpacity(
              opacity: _showGuide ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.camera_alt, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "음식을 프레임에 맞춰주세요",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // 하단 촬영 버튼 영역
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 32, top: 32),
                child: Center(
                  child: GestureDetector(
                    onTap: () => cameraUtils.takePicture(context),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                        color: cameraUtils.canTakePicture 
                          ? Color(0xFF4CAF50).withOpacity(0.3)
                          : Colors.grey.withOpacity(0.3),
                      ),
                      child: Icon(
                        Icons.camera,
                        size: 32,
                        color: cameraUtils.canTakePicture ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
    bool isActive = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isActive 
          ? Color(0xFF4CAF50).withOpacity(0.8)
          : Colors.black.withOpacity(0.5),
        shape: BoxShape.circle,
        border: isActive 
          ? Border.all(color: Colors.white, width: 2)
          : null,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 26,
          color: Colors.white,
        ),
      ),
    );
  }
}
