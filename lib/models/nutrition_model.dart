class NutritionModel {
  final String text;

  NutritionModel({required this.text});

  factory NutritionModel.fromJson(dynamic json){
    return NutritionModel(
        text: json['response_text'] as String
    );
  }
}