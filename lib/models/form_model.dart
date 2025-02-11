// import 'dart:convert';

// class Question {
//   final int id;
//   final String question;
//   final String questionType;
//   final String answerType;
//   final String hintText;
//   final bool isMandatoryField;
//   final String? reValidation;

//   Question({
//     required this.id,
//     required this.question,
//     required this.questionType,
//     required this.answerType,
//     required this.hintText,
//     required this.isMandatoryField,
//     this.reValidation,
//   });

//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       id: json['id'],
//       question: json['question'],
//       questionType: json['questionType'],
//       answerType: json['answerType'],
//       hintText: json['hintText'],
//       isMandatoryField: json['isMandatoryField'],
//       reValidation: json['reValidation'],
//     );
//   }
// }

// class FormModel {
//   final String name;
//   final List<Question> questions;

//   FormModel({required this.name, required this.questions});

//   factory FormModel.fromJson(Map<String, dynamic> json) {
//     return FormModel(
//       name: json['getUserForm']['name'],
//       questions: (json['getUserForm']['questions'] as List)
//           .map((q) => Question.fromJson(q))
//           .toList(),
//     );
//   }
// }

class Question {
  final int id;
  final String question;
  final String questionType;
  final String answerType;
  final String hintText;
  final bool isMandatoryField;
  final String? reValidation;

  Question({
    required this.id,
    required this.question,
    required this.questionType,
    required this.answerType,
    required this.hintText,
    required this.isMandatoryField,
    this.reValidation,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      questionType: json['questionType'],
      answerType: json['answerType'],
      hintText: json['hintText'],
      isMandatoryField: json['isMandatoryField'],
      reValidation: json['reValidation'],
    );
  }
}

class FormModel {
  final String name;
  final List<Question> questions;

  FormModel({required this.name, required this.questions});

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      name: json['getUserForm']['name'],
      questions: (json['getUserForm']['questions'] as List)
          .map((q) => Question.fromJson(q))
          .toList(),
    );
  }
}
