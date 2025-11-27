import 'package:flutter/material.dart';
import 'package:mobile_lab/widgets/interactive_tabs/camera_media_interactive.dart';
import 'package:mobile_lab/widgets/interactive_tabs/database_interactive.dart';
import 'package:mobile_lab/widgets/interactive_tabs/gestures_interactive.dart';
import 'package:mobile_lab/widgets/interactive_tabs/library_interactive.dart';
import 'package:mobile_lab/widgets/interactive_tabs/location_interactive.dart';

import 'package:mobile_lab/widgets/interactive_tabs/ui_basics_interactive.dart';
import 'interactive_tabs/navigation_interactive.dart';

class InteractiveTab extends StatefulWidget {
  final int moduleId;

  const InteractiveTab({super.key, required this.moduleId});

  @override
  State<InteractiveTab> createState() => _InteractiveTabState();
}

class _InteractiveTabState extends State<InteractiveTab> {
  String? detectedGesture;
  @override
  Widget build(BuildContext context) {
    // Выбираем, какой интерактив показать в зависимости от ID модуля
    Widget interactiveContent = const SizedBox.shrink();

    if (widget.moduleId == 2) { // Работа с жестами
      interactiveContent = GesturesInteractive(
        onGestureDetected: (gesture) {
          setState(() {
            detectedGesture = gesture;
          });
        },
      );
    } else if (widget.moduleId == 1) { // Основы интерфейсов
      interactiveContent = const UIBasicsInteractive();
    } else if (widget.moduleId == 3) { // Камера и мультимедиа
      interactiveContent = CameraMediaInteractive();
    } else if (widget.moduleId == 4) { // Геолокация
      interactiveContent = LocationInteractive();
    } else if (widget.moduleId == 5) { // Многоэкранная навигация
      interactiveContent = NavigationInteractive(context);
    } else if (widget.moduleId == 7) {
      interactiveContent = ChartInteractive();
    } else if (widget.moduleId == 8) {
      interactiveContent = DatabaseInteractive();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Интерактивная демонстрация',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Expanded(child: interactiveContent),
          if (detectedGesture != null) ...[
            const SizedBox(height: 16),
            Card(
              color: Colors.lightBlue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Распознано: $detectedGesture',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}