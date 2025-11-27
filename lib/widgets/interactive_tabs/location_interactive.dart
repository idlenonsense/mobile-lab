import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:async';

class LocationInteractive extends StatefulWidget {
  const LocationInteractive({super.key});

  @override
  State<LocationInteractive> createState() => _LocationInteractiveState();
}

class _LocationInteractiveState extends State<LocationInteractive> {
  // Симуляция LocationManager и LocationListener
  // Начальные координаты (Краснодар)
  double _latitude = 45.0448;
  double _longitude = 38.9763;
  double _accuracy = 10.0;
  final String _provider = 'GPS_PROVIDER';
  bool _isTracking = false; // Симуляция активного отслеживания
  final List<String> _locationHistory = [];

  void _simulateLocationUpdate() {
    // Симулируем получение новых координат
    // Случайное смещение для демонстрации "движения"
    double latOffset = (Random().nextDouble() - 0.5) * 0.001;
    double lonOffset = (Random().nextDouble() - 0.5) * 0.001;
    double accOffset = (Random().nextDouble() - 0.5) * 5;

    setState(() {
      _latitude += latOffset;
      _longitude += lonOffset;
      _accuracy += accOffset;
      _locationHistory.insert(
        0,
        'Lat: ${_latitude.toStringAsFixed(6)}, Lon: ${_longitude.toStringAsFixed(6)}, Acc: ${_accuracy.toStringAsFixed(1)}m',
      );
      if (_locationHistory.length > 10) {
        _locationHistory.removeLast();
      }
    });

    // Показываем SnackBar с новыми координатами
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Обновлено: ${_latitude.toStringAsFixed(6)}, ${_longitude.toStringAsFixed(6)}'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _startTracking() {
    // Симуляция запуска отслеживания
    if (!_isTracking) {
      setState(() {
        _isTracking = true;
      });
      // Таймер для периодического обновления
      Timer.periodic(Duration(seconds: 3), (timer) {
        if (!_isTracking) {
          timer.cancel();
        } else {
          _simulateLocationUpdate();
        }
      });
    }
  }

  void _stopTracking() {
    setState(() {
      _isTracking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Симуляция геолокации (LocationManager, LocationListener)',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Текущее местоположение',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Широта: ${_latitude.toStringAsFixed(6)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Долгота: ${_longitude.toStringAsFixed(6)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Точность: ${_accuracy.toStringAsFixed(1)} м',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Провайдер: $_provider',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _simulateLocationUpdate,
                          child: const Text('Обновить координаты'),
                        ),
                        ElevatedButton(
                          onPressed: _isTracking ? _stopTracking : _startTracking,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isTracking ? Colors.red : null,
                          ),
                          child: Text(_isTracking ? 'Остановить отслеживание' : 'Начать отслеживание'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'История координат (последние 10):',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _locationHistory.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _locationHistory[index],
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          );
                        },
                      ),
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