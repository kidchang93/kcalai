import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcalai/home.dart';
import 'package:kcalai/models/prediction.dart';
import 'package:kcalai/screen/main_screen.dart';

class ResultWidget extends StatefulWidget {
  final List<Prediction> predictions;
  const ResultWidget({super.key, required this.predictions});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView(
          children: widget.predictions.map((p) {
            return ListTile(
              title: Text(p.label),
              trailing: Text((p.score * 100).toStringAsFixed(2) + '%'),
            );
          }).toList(),
        ),
        ),
        Padding(padding: const EdgeInsets.all(0.0),
        child: ElevatedButton(onPressed: () {
          // 다시 촬영 화면으로 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen(),
            )
          );
        }, 
          child: const Text("다시 촬영"),
        ),
        ),
        Padding(padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen())
          );
          }, child: const Text("홈으로 나가기"),
        )
        )
      ],
    );
  }
}