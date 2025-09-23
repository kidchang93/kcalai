import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/widgets/result_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ResultWidget()),
    );
  }
}