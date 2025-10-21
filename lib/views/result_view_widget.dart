import 'package:flutter/material.dart';
import 'package:kcalai/buttons/custom_button.dart';
import 'package:kcalai/models/button_model.dart';
import 'package:kcalai/home.dart';
import 'package:kcalai/models/prediction.dart';
import 'package:kcalai/screen/main_screen.dart';
import 'package:kcalai/services/send_to_api_service.dart';
import 'package:kcalai/styles/style.dart';

class ResultWidget extends StatefulWidget {
  final List<Prediction> predictions;
  const ResultWidget({super.key, required this.predictions});


  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final topPrediction = widget.predictions.reduce((a,b) => a.score > b.score ? a : b);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 위-중앙-아래 구조 배치
      children: [
        Flexible(
          child: ListView(
          shrinkWrap: true,  // 내부 높이만큼만 사용
            // physics: const NeverScrollableScrollPhysics(),  // 스크롤 비활성화
          children: widget.predictions.map((p) {
            return ListTile(
              title: Text(p.label, style: AppTextStyles.title,),
              trailing: Text((p.score * 100).toStringAsFixed(2) + '%', style: AppTextStyles.title,),
            );
          }).toList(),
        ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(
            children: [
              Text(
                "해당 음식은 ${(topPrediction.score * 100).toStringAsFixed(2) + '%'}로 ${topPrediction.label}(으)로 보여집니다.\n"
                    "${topPrediction.label}의 칼로리와 영양 정보를\n"
                    "알려 드릴까요?",
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 10),
                    child: CustomButton(
                        model: ButtonModel(
                          text: "네",
                          textColor: Colors.white,
                          backgroundColor: Color(0xFF9A93DA),
                          borderRadius: 12,
                          onPressed: () {
                            // TopPrediction 의 결과 값을 기반으로 요청
                            SendToAPIService.sendFoodNameToAPI(context, topPrediction.label);
                          },
                          icon: Icons.search,
                          isExpanded: false, // 필요하면 true
                        ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  children: [
                    // 원하는 음식의 이름을 직접 입력해서 검색.
                    Text(
                      "일치하는 음식이 없나요? 직접 입력해보세요!",
                      style: AppTextStyles.redText,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            labelText: "음식 이름을 입력하세요.",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) => SendToAPIService.sendFoodNameToAPI(context, _controller.text.trim()),
                        ),
                    ),
                    const SizedBox(width: 8),
                    CustomButton(
                        model: ButtonModel(
                          text: "검색하기",
                          textColor: Colors.white,
                          backgroundColor: Color(0xFF9A93DA),
                          borderRadius: 12,
                          onPressed: () {
                            // TopPrediction 의 결과 값을 기반으로 요청
                            SendToAPIService.sendFoodNameToAPI(context, _controller.text.trim());
                          },
                          icon: Icons.search,
                          isExpanded: false, // 필요하면 true
                        ),
                    )
                  ],
                ),
              ),

            ],
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,  // Row 내부 요소를 가운데 정렬
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomButton(
                model: ButtonModel(
                  text: "다시 촬영",
                  textColor: Colors.white,
                  backgroundColor: Color(0xFF9A93DA),
                  borderRadius: 12,
                  onPressed: () {
                    // 다시 촬영 화면으로 이동
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen(),
                        )
                    );
                  },
                  icon: Icons.camera_alt,
                  isExpanded: false, // 필요하면 true
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomButton(
                model: ButtonModel(
                  text: "홈으로 나가기",
                  textColor: Colors.white,
                  backgroundColor: Color(0xFF9A93DA),
                  borderRadius: 12,
                  onPressed: () {
                    // 홈으로 나가기
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen())
                    );
                  },
                  icon: Icons.undo,
                  isExpanded: false, // 필요하면 true
                ),
              ),
            ),
          ],
        )

      ],
    );
  }
}