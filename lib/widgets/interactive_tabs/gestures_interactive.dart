import 'package:flutter/material.dart';

// --- Интерактивный виджет для модуля "Жесты" ---
class _DrawingCanvas extends StatefulWidget {
  final Function(List<Offset> points)? onGestureDrawn;
  const _DrawingCanvas({super.key, this.onGestureDrawn});

  @override
  State<_DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<_DrawingCanvas> {
  List<Offset> _currentPoints = [];
  final List<List<Offset>> _allStrokes = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        setState(() {
          _currentPoints = [details.localPosition];
        });
      },
      onPanUpdate: (details) {
        setState(() {
          _currentPoints.add(details.localPosition);
        });
      },
      onPanEnd: (details) {
        setState(() {
          _allStrokes.add(List.from(_currentPoints));
          _currentPoints.clear();
        });
        widget.onGestureDrawn?.call(_allStrokes.last);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: CustomPaint(
          painter: _GesturePainter(_allStrokes, _currentPoints),
          size: Size.infinite,
        ),
      ),
    );
  }

  void clearCanvas() {
    setState(() {
      _allStrokes.clear();
      _currentPoints.clear();
    });
  }

  List<List<Offset>> get strokes => List.from(_allStrokes);
}

class _GesturePainter extends CustomPainter {
  final List<List<Offset>> allStrokes;
  final List<Offset> currentStroke;

  _GesturePainter(this.allStrokes, this.currentStroke);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;

    for (var stroke in allStrokes) {
      if (stroke.length > 1) {
        for (int i = 0; i < stroke.length - 1; i++) {
          canvas.drawLine(stroke[i], stroke[i + 1], paint);
        }
      }
    }

    if (currentStroke.length > 1) {
      for (int i = 0; i < currentStroke.length - 1; i++) {
        canvas.drawLine(currentStroke[i], currentStroke[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(_GesturePainter oldDelegate) =>
      oldDelegate.allStrokes != allStrokes || oldDelegate.currentStroke != currentStroke;
}

class GesturesInteractive extends StatefulWidget {
  final Function(String gesture)? onGestureDetected;

  const GesturesInteractive({super.key, this.onGestureDetected});

  @override
  State<GesturesInteractive> createState() => _GestureDemoWidgetState();
}

class _GestureDemoWidgetState extends State<GesturesInteractive> {
  Color _color = Colors.lightBlue;
  String? _customGestureResult;
  final GlobalKey<_DrawingCanvasState> _drawingCanvasKey = GlobalKey<_DrawingCanvasState>();

  // Функция для симуляции распознавания "нарисованного" жеста
  void _simulateCustomGestureRecognition(List<Offset> gesturePoints) {
    if (gesturePoints.length > 10) {
      double totalDistance = 0;
      for (int i = 0; i < gesturePoints.length - 1; i++) {
        totalDistance += (gesturePoints[i+1] - gesturePoints[i]).distance;
      }
      if (totalDistance > 300) {
        setState(() {
          _customGestureResult = 'Распознан сложный жест.';
        });
      } else {
        setState(() {
          _customGestureResult = 'Распознан короткий жест.';
        });
      }
    } else {
      setState(() {
        _customGestureResult = 'Жест слишком короткий или не распознан.';
      });
    }
    // Уведомляем основной экран о "пользовательском жесте"
    widget.onGestureDetected?.call(_customGestureResult ?? 'Custom Gesture Drawn');
  }

  void _changeColor() {
    switch(_color) {
      case Colors.lightBlue:
        setState(() {
          _color = Colors.green;
        });
      case Colors.green:
        setState(() {
          _color = Colors.redAccent;
        });
      default:
        setState(() {
          _color = Colors.lightBlue;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Стандартные жесты на всей области',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          widget.onGestureDetected?.call('Касание - onSingleTapUp');
                          _changeColor();
                        },
                        onDoubleTap: () {
                          widget.onGestureDetected?.call('Двойное касание - onDoubleTap');
                          _changeColor();
                        },
                        onLongPress: () {
                          widget.onGestureDetected?.call('Долгое нажатие - onLongPress');
                          _changeColor();
                        },
                        // Обработка свайпа (аналог onFling, но проще)
                        onVerticalDragEnd: (details) {
                          if (details.velocity.pixelsPerSecond.dy < 0) {
                            widget.onGestureDetected?.call('Свайп вверх - onFling (up)');
                            _changeColor();
                          } else if (details.velocity.pixelsPerSecond.dy > 0) {
                            widget.onGestureDetected?.call('Свайп вниз - onFling (down)');
                            _changeColor();
                          }
                        },
                        onHorizontalDragEnd: (details) {
                          if (details.velocity.pixelsPerSecond.dx > 0) {
                            widget.onGestureDetected?.call('Свайп вправо - onFling (right)');
                            _changeColor();
                          } else if (details.velocity.pixelsPerSecond.dx < 0) {
                            widget.onGestureDetected?.call('Свайп влево - onFling (left)');
                            _changeColor();
                          }
                        },
                        child: Container(
                          color: _color,
                          child: const Center(
                            child: Text(
                              'Сделайте стандартный жест (например, касание или свайп)',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // --- Пользовательские жесты (из ЛР6) ---
          Expanded(
            flex: 1,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Симуляция пользовательского жеста (ЛР6)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: _DrawingCanvas(
                        key: _drawingCanvasKey,
                        onGestureDrawn: _simulateCustomGestureRecognition,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Очищаем холст
                            _drawingCanvasKey.currentState?.clearCanvas();
                            setState(() {
                              _customGestureResult = null;
                            });
                          },
                          child: const Text('Очистить'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}