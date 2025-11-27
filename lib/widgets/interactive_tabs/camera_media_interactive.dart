import 'package:flutter/material.dart';

// Вспомогательный виджет для симуляции экрана камеры
class _CameraScreen extends StatefulWidget {
  const _CameraScreen();

  @override
  State<_CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<_CameraScreen> {
  final List<String> _imagePaths = [
    'assets/images/canari.png',
    'assets/images/curili.png',
    'assets/images/maldivi.png',
    'assets/images/philippini.png',
  ];
  int _currentIndex = 3;

  bool _isPreviewActive = true;
  String _lastPhotoPath = '';

  void _simulateTakePhoto() {
    // Симуляция автофокуса и съёмки
    setState(() {
      _isPreviewActive = false;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isPreviewActive = true;
        _lastPhotoPath = '/sdcard/Camera/${DateTime.now().millisecondsSinceEpoch}.jpg';
      });
      if (_currentIndex < _imagePaths.length - 1) {
        setState(() {
          _currentIndex++;
        });
      } else {
        _currentIndex = 0;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Фото сохранено: $_lastPhotoPath')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Экран камеры'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(), // Вернуться назад
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // Симуляция SurfaceView (предпросмотра)
            Container(
              width: 300,
              height: 300,
              color: Colors.grey.shade800,
              child: _isPreviewActive
                  ? const Center(
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 50,
                ),
              )
                  : const Center(
                child: Icon(
                  Icons.flash_on,
                  color: Colors.yellow,
                  size: 50,
                ), // Симуляция "вспышки"
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _simulateTakePhoto,
              child: const Text('Сделать фото'),
            ),
            if (_lastPhotoPath.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                'Последнее фото: $_lastPhotoPath',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Image.asset(
                  _imagePaths[_currentIndex],
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.image_not_supported, size: 50),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Вспомогательный виджет для симуляции экрана медиа
class _MediaScreen extends StatefulWidget {
  const _MediaScreen();

  @override
  State<_MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<_MediaScreen> {
  // Симуляция MediaPlayer
  IconData _icon = Icons.play_circle;
  bool _isLooping = false;
  final String _currentMedia = 'https://example.com/sample_video.mp4'; // Заглушка

  void _simulatePlay() {
    setState(() {
      _icon = Icons.pause_circle;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Воспроизведение начато')),
    );
    if (!_isLooping) {
      Future.delayed(const Duration(milliseconds: 5000), () {
        setState(() {
          _icon = Icons.play_circle;
        });
      });
    }
  }

  void _simulatePause() {
    setState(() {
      _icon = Icons.play_circle;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Воспроизведение приостановлено')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Экран медиа'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Адрес медиа: $_currentMedia',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              width: 300,
              height: 200,
              color: Colors.black,
              child: Center(
                child: Icon(
                  _icon,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _simulatePlay,
                  child: const Text('Старт'),
                ),
                ElevatedButton(
                  onPressed: _simulatePause,
                  child: const Text('Пауза'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Зацикленное воспроизведение: '),
                Checkbox(
                  value: _isLooping,
                  onChanged: (value) {
                    setState(() {
                      _isLooping = value ?? false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Режим повтора: ${_isLooping ? 'ВКЛ' : 'ВЫКЛ'}')),
                    );
                    Future.delayed(const Duration(milliseconds: 3000), () {
                      setState(() {
                        _icon = Icons.play_circle;
                      });
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Вспомогательный виджет для симуляции экрана галереи
class _GalleryScreen extends StatefulWidget {
  const _GalleryScreen();

  @override
  State<_GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<_GalleryScreen> {
  // Симуляция списка изображений
  final List<String> _imagePaths = [
    'assets/images/canari.png',
    'assets/images/curili.png',
    'assets/images/maldivi.png',
    'assets/images/philippini.png',
  ];
  int _currentIndex = 0;

  void _nextImage() {
    if (_currentIndex < _imagePaths.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      setState(() {
        _currentIndex = 0;
      });
    }
  }

  void _previousImage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    } else {
      setState(() {
        _currentIndex = _imagePaths.length - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Экран галереи'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(), // Вернуться назад
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Изображение ${_currentIndex + 1} из ${_imagePaths.length}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Image.asset(
                _imagePaths[_currentIndex],
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image_not_supported, size: 50),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _previousImage,
                  child: const Text('Назад'),
                ),
                ElevatedButton(
                  onPressed: _nextImage,
                  child: const Text('Вперед'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Основной интерактивный виджет для модуля "Камера и мультимедиа"
class CameraMediaInteractive extends StatelessWidget {
  const CameraMediaInteractive({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Симуляция приложения "Media"',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Выберите активность:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const _CameraScreen(),
                          ),
                        );
                      },
                      child: const Text('Работа с камерой'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const _MediaScreen(),
                          ),
                        );
                      },
                      child: const Text('Воспроизведение мультимедиа'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const _GalleryScreen(),
                          ),
                        );
                      },
                      child: const Text('Просмотр изображений'),
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