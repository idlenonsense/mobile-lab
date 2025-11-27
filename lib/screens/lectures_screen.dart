import 'package:flutter/material.dart';
import '../data/content_data.dart';
import '../data/models/module.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лекции'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: lectures.length,
          itemBuilder: (context, index) {
            final lecture = lectures[index];
            String relatedModulesString = 'Нет связанных интерактивных модулей';
            if (lecture.relatedModuleIds.isNotEmpty) {
              List<String> relatedTitles = [];
              for (int id in lecture.relatedModuleIds) {
                Module? module = modules.firstWhere((m) => m.id == id, orElse: () => Module(id: -1, title: 'Неизвестно', description: '', quizQuestions: [], labNumber: ''));
                if (module.id != -1) {
                  relatedTitles.add(module.title);
                }
              }
              relatedModulesString = relatedTitles.join(', ');
            }

            return Card(
              child: ListTile(
                title: Text(lecture.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // важно!
                  children: [
                    Text(lecture.description),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Связанные интерактивные модули: $relatedModulesString',
                        style: TextStyle(color: Colors.cyan),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}