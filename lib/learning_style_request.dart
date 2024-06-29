class LearningStyleRequest {
  final int question1;
  final int question2;
  final int question3;
  final int question4;
  final int question5;

  LearningStyleRequest({
    required this.question1,
    required this.question2,
    required this.question3,
    required this.question4,
    required this.question5,
  });

  Map<String, dynamic> toJson() => {
    "Question1": question1,
    "Question2": question2,
    "Question3": question3,
    "Question4": question4,
    "Question5": question5,
  };
}