class Question {
  final String text;

  Question({this.text});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(text: json['text']);
  }
}
