import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/widgets/camera_preview_widget.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CameraPreviewWidget()),
    );
  }
}