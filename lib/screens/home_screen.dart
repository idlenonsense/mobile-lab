import 'package:flutter/material.dart';
import 'module_screen.dart';
import 'lectures_screen.dart';
import '../data/content_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Интерактивный учебник по дисциплине "Программировние приложений мобильных устройств"',
          textAlign: TextAlign.center,
          textScaler: TextScaler.linear(0.8),
          maxLines: 3,
          overflow: TextOverflow.visible,
          softWrap: true
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Модули',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  final module = modules[index];
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
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LecturesScreen(),
                  ),
                );
              },
              child: const Text('Перейти к списку лекций'),
            ),
          ],
        ),
      ),
    );
  }
}