import 'question.dart';

class Module {
  final int id;
  final String title;
  final String description;
  final List<Question> quizQuestions;
  final String labNumber;
  final bool hasInteractive;
  final bool hasTheory;

  Module({
    required this.id,
    required this.title,
    required this.description,
    required this.quizQuestions,
    required this.labNumber,
    this.hasInteractive = true,
    this.hasTheory = true
  });

  Module.withoutInteractive({
    required this.id,
    required this.title,
    required this.description,
    required this.quizQuestions,
    required this.labNumber,
  })  : hasInteractive = false,
        hasTheory = true;

  Module.quizOnly({
    required this.id,
    required this.title,
    required this.description,
    required this.quizQuestions,
    required this.labNumber,
  })  : hasInteractive = false,
        hasTheory = false;
}