import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/widgets/photo_preview_widget.dart';

class CameraPreviewWidget extends StatefulWidget{
  const CameraPreviewWidget({super.key});

  @override
  State<CameraPreviewWidget> createState() => _CameraPreviewWidget();

}

class _CameraPreviewWidget extends State<CameraPreviewWidget>{
  late List<CameraDescription> cameras;
  CameraController? controller;
  bool isCameraReady = false;

  @override
  void initState(){
    super.initState();
    initCamera();
  }
  Future<void> initCamera() async {
    cameras = await availableCameras();
    if(cameras.isNotEmpty) {
      controller = CameraController(cameras[0], ResolutionPreset.medium);
      await controller!.initialize();
      setState(() {
        isCameraReady = true;
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isCameraReady
        ? Stack(
      children: [
        CameraPreview(controller!),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Center(
            child: FloatingActionButton(
              child: const Icon(Icons.camera_alt),
                onPressed: () async {
                  final image = await controller!.takePicture();
                  // 촬영 후 미리보기 화면으로 이동
                  if (!mounted) return;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhotoPreviewWidget(imageFile: image),
                    ),
                  );
                }
            )
          )
        )
      ],
    )
        : const Center(child: CircularProgressIndicator());
  }
}