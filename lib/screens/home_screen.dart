import 'package:flutter/material.dart';
import '../data/models/lecture.dart';
import '../data/models/main_module.dart';
import '../data/models/module.dart';
import 'module_screen.dart';
import '../data/content_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Интерактивный учебник по дисциплине "Программирование приложений мобильных устройств"',
          textAlign: TextAlign.center,
          textScaler: TextScaler.linear(0.8),
          maxLines: 3,
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Главы',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: mainModules.length + 1, // +1 для итогового теста
                itemBuilder: (context, index) {
                  if (index < mainModules.length) {
                    final mainModule = mainModules[index];
                    return Card(
                      child: ListTile(
                        title: Text(mainModule.title),
                        subtitle: Text(mainModule.description),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterScreen(mainModule: mainModule),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Card(
                      child: ListTile(
                        title: Text(finalTestModule.title),
                        subtitle: Text(finalTestModule.description),
                        trailing: const Icon(Icons.quiz),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ModuleScreen(module: finalTestModule),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChapterScreen extends StatelessWidget {
  final MainModule mainModule;

  const ChapterScreen({super.key, required this.mainModule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mainModule.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (mainModule.lectures.isNotEmpty) ...[
              const Text(
                'Лекции',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...mainModule.lectures.map((lecture) => _buildLectureCard(context, lecture)).toList(),
              const SizedBox(height: 24),
            ],
            if (mainModule.subModules.isNotEmpty) ...[
              const Text(
                'Интерактивные модули',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...mainModule.subModules.map((module) => _buildModuleCard(context, module)).toList(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLectureCard(BuildContext context, Lecture lecture) {
    // Находим первый связанный модуль для перехода
    Module? targetModule;
    if (lecture.relatedModuleIds.isNotEmpty) {
      int firstModuleId = lecture.relatedModuleIds.first;
      targetModule = modules.firstWhere((m) => m.id == firstModuleId);
    }

    return Card(
      child: InkWell(
        onTap: targetModule != null
            ? () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ModuleScreen(module: targetModule!),
            ),
          );
        }
            : null,
        child: ListTile(
          title: Text(lecture.title),
          subtitle: Text(lecture.description),
          trailing: targetModule != null ? const Icon(Icons.link) : null,
          enabled: targetModule != null,
        ),
      ),
    );
  }

  Widget _buildModuleCard(BuildContext context, Module module) {
    return Card(
      child: ListTile(
        title: Text(module.title),
        subtitle: Text(module.description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ModuleScreen(module: module),
            ),
          );
        },
      ),
    );
  }
}