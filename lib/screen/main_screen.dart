import 'package:flutter/material.dart';
import 'package:kcalai/utils/camera_utils.dart';
import 'package:kcalai/views/camera_view_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Provider 는 CameraView 쪽에서 주입한거라
      // 그 부모 위젯에서도 Provider 를 해줘야함.
      // 원래는 최상위 위젯에서 ChangeNotifier 를 상속받는게 좋은 방법인듯.
      create: (_) => CameraUtils(),
      child: Scaffold(
        body: SafeArea(child: CameraView()),
      ),
    );
  }
}