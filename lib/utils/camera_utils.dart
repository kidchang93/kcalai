import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/views/photo_preview.dart';
import 'package:path_provider/path_provider.dart';

class CameraUtils with ChangeNotifier {
  CameraUtils() {
    _initialize();
  }

  late List<CameraDescription> _cameras;
  late CameraController controller;

  bool isLoaded = false;        // 카메라 준비 완료 여부
  bool canTakePicture = false;  // 사진 촬영 가능 여부
  bool isFlashOn = false;       // 플래쉬 on/off 여부

  // 초기 설정
  Future<void> _initialize() async{
    // 사용 가능한 카메라 불러오기
    _cameras = await availableCameras();

    // 카메라 기본 설정
    controller = CameraController(_cameras[0], ResolutionPreset.max,
    imageFormatGroup: ImageFormatGroup.jpeg, enableAudio: false);

    await controller!.initialize().catchError((e) {
      if (e is CameraException && e.code == 'CameraAccessDenied'){
        // 카메라 권한 설정
        debugPrint('카메라 사용 권한이 없습니다.');
      } else {
        // 카메라 오류
        debugPrint('error : $e');
      }
    });

    // 카메라 설정 완료
    isLoaded = controller.value.isInitialized;
    canTakePicture = isLoaded;
    notifyListeners();
  }

  @override
  void dispose(){
    // 카메라 controller 해제
    controller.dispose();
    super.dispose();
  }

  Future<void> takePicture(BuildContext context) async {
    if (!controller!.value.isInitialized || controller!.value.isTakingPicture){
      return;
    }

    try {
      // 임시 저장 장소와 이름 생성
      Directory directory = await getTemporaryDirectory();
      final imgPath = '${directory.path}/${DateTime.now()}.jpeg';
      // 사진 촬영
      final XFile imageFile = await controller!.takePicture();
      final aspectRatio = controller.value.aspectRatio;
      await imageFile.saveTo(imgPath);
      if (context.mounted) {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoPreview(
              imageFile: imageFile,
              aspectRatio: aspectRatio
          ),
        ),
      );
      }
    } catch (e){
      debugPrint('사진 촬영 오류');
    }
  }

  // 플래쉬 토글
  void toggleFlash(){
    if (isFlashOn) {
      controller.setFlashMode(FlashMode.off);
      isFlashOn = false;
    } else {
      controller.setFlashMode(FlashMode.always);
      isFlashOn = true;
    }
    notifyListeners();
  }

  // 카메라 전환
  void changeCameraDirection(){
    if (controller.description.lensDirection == CameraLensDirection.back){
      controller.setDescription(_cameras[0]);
    } else {
      controller.setDescription(_cameras[1]);
    }
  }
}


