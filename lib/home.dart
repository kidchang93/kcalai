import 'package:flutter/material.dart';
import 'package:kcalai/buttons/start_button.dart';
import 'package:kcalai/styles/style.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(   // 노치나 상단 ui 피해서 배치
        child: SizedBox(
          width: double.infinity, // Column 폭을 화면 전체로
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center, // 👈 가운데 정렬
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text("K-Cal AI", style: AppTextStyles.title),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text("음식 사진 만으로 칼로리 측정", style: AppTextStyles.body),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(32.0),
                //   child: LoginButton(), // 버튼 위젯 주입
                // ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: StartButton(), // 버튼 위젯 주입
                ),
              ],
            )
        )
      ),
    );
  }
}