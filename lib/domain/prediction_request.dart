class PredictionRequest {
  final DateTime dob;
  final PredictionFocus focus;

  PredictionRequest({required this.dob, required this.focus});
}

enum PredictionFocus { cinta, karir, keuangan }