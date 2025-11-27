// lib/widgets/interactive_tabs/chart_interactive.dart

import 'dart:math' as Math;

import 'package:flutter/material.dart';

// Вспомогательный класс для данных диаграммы
class ChartDataItem {
  String label;
  double value;
  Color color;

  ChartDataItem(this.label, this.value, this.color);
}

class _PieChartPainter extends CustomPainter {
  final List<ChartDataItem> data;
  final List<double> angles; // Рассчитанные углы для каждого сегмента в радианах
  final List<double> startAngles; // Начальные углы для каждого сегмента

  _PieChartPainter(this.data, this.angles, this.startAngles);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = (size.width < size.height ? size.width : size.height) / 2 * 0.8; // 80% от минимальной стороны

    for (int i = 0; i < data.length; i++) {
      paint.color = data[i].color;
      final Rect rect = Rect.fromCircle(center: center, radius: radius);
      canvas.drawArc(rect, startAngles[i], angles[i], true, paint);

      // Рисуем подпись
      // Вычисляем угол для позиционирования текста (центр сегмента)
      double labelAngle = startAngles[i] + angles[i] / 2;
      double labelX = center.dx + (radius / 2) * Math.cos(labelAngle);
      double labelY = center.dy + (radius / 2) * Math.sin(labelAngle);

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: '${data[i].label}\n(${data[i].value.toStringAsFixed(1)})',
          style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(labelX - textPainter.width / 2, labelY - textPainter.height / 2));
    }

    // Рисуем контур круга
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(_PieChartPainter oldDelegate) {
    return oldDelegate.data != data || oldDelegate.angles != angles || oldDelegate.startAngles != startAngles;
  }
}

class ChartInteractive extends StatefulWidget {
  const ChartInteractive({super.key});

  @override
  State<ChartInteractive> createState() => _ChartInteractiveState();
}

class _ChartInteractiveState extends State<ChartInteractive> {
  // Инициализируем с примерными данными
  final List<ChartDataItem> _chartData = [
    ChartDataItem('Bananas', 25.0, Colors.yellow),
    ChartDataItem('Kiwi', 25.0, Colors.green),
    ChartDataItem('Oranges', 25.0, Colors.orange),
    ChartDataItem('Cream', 25.0, Colors.white),
  ];

  // Цвета для автоматического выбора
  final List<Color> _availableColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.brown,
  ];

  // Метод для пересчёта углов
  void _recalculateAngles() {
    double total = _chartData.fold(0, (sum, item) => sum + item.value);
    if (total == 0) {
      // Если все значения 0, не рисуем сегменты
      _startAngles = List.filled(_chartData.length, 0.0);
      _angles = List.filled(_chartData.length, 0.0);
      return;
    }
    double currentStartAngle = -Math.pi / 2; // Начинаем сверху

    _startAngles = [];
    _angles = [];

    for (var item in _chartData) {
      double angle = (item.value / total) * 2 * Math.pi;
      _startAngles.add(currentStartAngle);
      _angles.add(angle);
      currentStartAngle += angle;
    }
  }

  late List<double> _startAngles;
  late List<double> _angles;

  @override
  void initState() {
    super.initState();
    _recalculateAngles();
  }

  void _addDataItem() {
    setState(() {
      int nextColorIndex = _chartData.length % _availableColors.length;
      _chartData.add(ChartDataItem('Item ${_chartData.length + 1}', 10.0, _availableColors[nextColorIndex]));
      _recalculateAngles();
    });
  }

  void _removeDataItem(int index) {
    if (_chartData.length > 1) { // Не позволяем удалить все элементы
      setState(() {
        _chartData.removeAt(index);
        _recalculateAngles();
      });
    }
  }

  void _updateDataItem(int index, String label, double value) {
    setState(() {
      _chartData[index] = ChartDataItem(label, value, _chartData[index].color);
      _recalculateAngles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Симуляция построения диаграммы (ЛР9)',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Левая панель: Управление данными ---
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Данные диаграммы',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ListView.builder(
                              itemCount: _chartData.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Label',
                                              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                                            ),
                                            onChanged: (value) {
                                              _updateDataItem(index, value, _chartData[index].value);
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          flex: 1,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Value',
                                              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                                            ),
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              double? newValue = double.tryParse(value);
                                              if (newValue != null) {
                                                _updateDataItem(index, _chartData[index].label, newValue);
                                              }
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        IconButton(
                                          icon: Icon(Icons.remove, color: Colors.red),
                                          onPressed: () => _removeDataItem(index),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: _addDataItem,
                            child: const Text('Добавить элемент'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // --- Правая панель: Визуализация диаграммы ---
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Визуализация (Pie Chart)',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: CustomPaint(
                              painter: _PieChartPainter(_chartData, _angles, _startAngles),
                              size: Size.infinite, // Занимает доступное пространство
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}