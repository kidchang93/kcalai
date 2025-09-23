import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/models/prediction.dart';
import 'package:kcalai/widgets/result_widget.dart';

class ResultScreen extends StatelessWidget {
  final List<Prediction> predictions; // 서버에서 받은 예측 결과
  const ResultScreen({super.key, required this.predictions});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ResultWidget(predictions: predictions)),
    );
  }
}