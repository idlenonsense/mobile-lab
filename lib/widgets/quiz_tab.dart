import 'package:flutter/material.dart';
import '../data/models/question.dart';

class QuizTab extends StatefulWidget {
  final List<Question> questions;

  const QuizTab({super.key, required this.questions});

  @override
  State<QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  int _currentQuestionIndex = 0;
  int? _selectedOptionIndex;
  bool _isAnswered = false;
  int _correctAnswers = 0;

  void _selectOption(int index) {
    if (_isAnswered) return; // Блокируем повторный выбор после ответа

    setState(() {
      _selectedOptionIndex = index;
      _isAnswered = true;
    });

    if (index == widget.questions[_currentQuestionIndex].correctAnswerIndex) {
      setState(() {
        _correctAnswers++;
      });
    }
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = null;
        _isAnswered = false;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _selectedOptionIndex = null;
      _isAnswered = false;
      _correctAnswers = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.questions.isEmpty) {
      return const Center(child: Text('Нет вопросов для этой темы.'));
    }

    final question = widget.questions[_currentQuestionIndex];
    final isLastQuestion = _currentQuestionIndex == widget.questions.length - 1;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Вопрос ${_currentQuestionIndex + 1} из ${widget.questions.length}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Text(
            question.questionText,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ...List.generate(
            question.options.length,
                (index) => Card(
              color: _selectedOptionIndex == index
                  ? (index == question.correctAnswerIndex
                  ? Colors.green.shade100
                  : Colors.red.shade100)
                  : null,
              child: ListTile(
                title: Text(question.options[index]),
                onTap: () => _selectOption(index),
              ),
            ),
          ),
          if (_isAnswered) ...[
            const SizedBox(height: 16),
            if (question.explanation != "")
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  'Объяснение: ${question.explanation}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 16),
            if (isLastQuestion)
              ElevatedButton(
                onPressed: () {
                  // Показать результат и кнопку "Повторить"
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Результаты'),
                        content: Text(
                            'Вы ответили правильно на $_correctAnswers из ${widget.questions.length} вопросов.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Закрыть результаты
                              _resetQuiz();
                            },
                            child: const Text('Пройти снова'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Посмотреть результаты'),
              )
            else
              ElevatedButton(
                onPressed: _nextQuestion,
                child: const Text('Следующий вопрос'),
              ),
          ],
        ],
      ),
    );
  }
}