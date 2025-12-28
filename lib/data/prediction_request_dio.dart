class PredictionRequestDio {
  final String dob;
  final String focus;

  PredictionRequestDio({required this.dob, required this.focus});

  Map<String, dynamic> toJson() {
    return {'dob': dob, 'focus': focus};
  }
}