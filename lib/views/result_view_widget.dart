import 'package:flutter/material.dart';
import 'package:kcalai/buttons/custom_button.dart';
import 'package:kcalai/models/button_model.dart';
import 'package:kcalai/home.dart';
import 'package:kcalai/models/prediction.dart';
import 'package:kcalai/screen/main_screen.dart';
import 'package:kcalai/styles/style.dart';

class ResultWidget extends StatefulWidget {
  final List<Prediction> predictions;
  const ResultWidget({super.key, required this.predictions});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    final topPrediction = widget.predictions.reduce((a,b) => a.score > b.score ? a : b);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 위-중앙-아래 구조 배치
      children: [
        Flexible(
          child: ListView(
          shrinkWrap: true,
          children: widget.predictions.map((p) {
            return ListTile(
              title: Text(p.label, style: AppTextStyles.title,),
              trailing: Text((p.score * 100).toStringAsFixed(2) + '%', style: AppTextStyles.title,),
            );
          }).toList(),
        ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Text(
                "해당 음식은 ${(topPrediction.score * 100).toStringAsFixed(2) + '%'}로 ${topPrediction.label}(으)로 보여집니다.\n"
                    "${topPrediction.label}의 칼로리와 영양 정보를\n"
                    "알려 드릴까요?",
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomButton(
                        model: ButtonModel(
                          text: "네",
                          textColor: Colors.white,
                          backgroundColor: Colors.green,
                          borderRadius: 12,
                          onPressed: () {
                            // 버튼 클릭 시 행동
                            print("영양 정보 보기 버튼 클릭");
                          },
                          icon: Icons.info_outline,
                          isExpanded: false, // 필요하면 true
                        ),
                    ),
                  ),
                ],
              )
            ],
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,  // Row 내부 요소를 가운데 정렬
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
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
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen())
                  );
                },
                  child: const Text("홈으로 나가기"),
                )
            )
          ],
        )

      ],
    );
  }
}