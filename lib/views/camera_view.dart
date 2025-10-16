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
        ],
      ),
    );
  }
}
