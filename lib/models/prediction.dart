class Prediction {
  final String label;
  final double score;

  Prediction({required this.label, required this.score});

  factory Prediction.fromJson(Map<String, dynamic> json){
    return Prediction(
    label: json['label'] as String,
    score: (json['score'] as num).toDouble(),
    );
  }
}