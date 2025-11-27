import 'package:flutter/material.dart';
import '../data/models/module.dart';
import '../widgets/theory_tab.dart';
import '../widgets/interactive_tab.dart';
import '../widgets/quiz_tab.dart';

class ModuleScreen extends StatelessWidget {
  final Module module;

  const ModuleScreen({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [];
    final List<Widget> tabViews = [];

    if (module.hasTheory) {
      tabs.add(const Tab(text: 'Теория'));
      tabViews.add(
        TheoryTab(moduleId: module.id),
      );
    }

    if (module.hasInteractive) {
      tabs.add(const Tab(text: 'Интерактив'));
      tabViews.add(InteractiveTab(moduleId: module.id));
    }

    tabs.add(const Tab(text: 'Тест'));
    tabViews.add(QuizTab(questions: module.quizQuestions));

    if (tabViews.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(module.title),
        ),
        body: const Center(child: Text('Нет доступного содержимого для этого модуля.')),
      );
    }

    return DefaultTabController(
      length: tabViews.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(module.title),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: tabViews,
        ),
      ),
    );
  }
}