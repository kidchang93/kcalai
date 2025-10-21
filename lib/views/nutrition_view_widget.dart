import 'package:flutter/material.dart';
import 'package:kcalai/models/nutrition_model.dart';
import 'package:kcalai/styles/style.dart';

class NutritionViewWidget extends StatelessWidget {
  final NutritionModel nutrition;
  const NutritionViewWidget({super.key, required this.nutrition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                nutrition.text,
                style: AppTextStyles.blackText,
              ),
            ),
          ],
        )
      ),
    );
  }
}
