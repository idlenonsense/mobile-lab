import 'package:flutter/material.dart';

// --- Интерактивный виджет для "Многоэкранной навигации" ---
class _DestinationScreen extends StatelessWidget {
  final String destinationName;
  final String imageName;

  const _DestinationScreen({required this.destinationName, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destinationName),
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
              'Добро пожаловать на $destinationName!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Image.asset(
              'assets/images/$imageName.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey.shade300,
                  child: Icon(Icons.image_not_supported, size: 50),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

// Виджет для симуляции вкладки (Fragment)
class _TabContent extends StatelessWidget {
  final String title;
  final String content;
  final String imageName;
  final Color backgroundColor;

  const _TabContent({required this.title, required this.content, required this.imageName, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(
                    'assets/images/$imageName.png',
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey.shade300,
                        child: Icon(Icons.image_not_supported, size: 40),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget NavigationInteractive(BuildContext context) {
  return _NavigationDemoWidgetStatefulWidget();
}

class _NavigationDemoWidgetStatefulWidget extends StatefulWidget {
  @override
  _NavigationDemoWidgetStatefulWidgetState createState() => _NavigationDemoWidgetStatefulWidgetState();
}

class _NavigationDemoWidgetStatefulWidgetState extends State<_NavigationDemoWidgetStatefulWidget> {
  Color _tabBackgroundColor = Colors.blue.shade100;

  void _changeBackgroundColor(Color newColor) {
    setState(() {
      _tabBackgroundColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Данные для списка
    final List<String> destinations = ['Канары', 'Курилы', 'Мальдивы', 'Филиппины'];
    final Map<String, String> imageMap = {
      'Канары': 'canari',
      'Курилы': 'curili',
      'Мальдивы': 'maldivi',
      'Филиппины': 'philippini',
    };

    final List<Tab> tabs = <Tab>[
      const Tab(text: 'Лента'),
      const Tab(text: 'Фото'),
      const Tab(text: 'Карта'),
    ];
    final List<Widget> tabViews = <Widget>[
      _TabContent(
        title: 'Лента Новостей',
        content: 'Здесь отображаются последние новости и обновления о ваших любимых компаниях.',
        imageName: 'news_feed',
        backgroundColor: _tabBackgroundColor,
      ),
      _TabContent(
        title: 'Фотографии',
        content: 'Просмотрите лучшие фотографии и делитесь своими впечатлениями.',
        imageName: 'puppy',
        backgroundColor: _tabBackgroundColor,
      ),
      _TabContent(
        title: 'Карта',
        content: 'Найдите интересные места и постройте маршрут для своего путешествия.',
        imageName: 'map_placeholder',
        backgroundColor: _tabBackgroundColor,
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // --- Симуляция списка ---
            Expanded(
              flex: 1,
              child: Card(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Список направлений (ListActivity)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: destinations.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(destinations[index]),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              // Симуляция перехода на другой экран с помощью Intent
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => _DestinationScreen(
                                    destinationName: destinations[index],
                                    imageName: imageMap[destinations[index]] ?? 'puppy',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // --- Симуляция диалогового окна ---
            ElevatedButton(
              onPressed: () {
                _showColorDialog(context);
              },
              child: const Text('Показать диалог (AlertDialog)'),
            ),
            const SizedBox(height: 16),
            // --- Симуляция слайдинга (Вкладки) ---
            Expanded(
              flex: 2,
              child: Card(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Вкладки и слайдинг (Fragments + ViewPager)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TabBar(
                      tabs: tabs,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: tabViews,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Функция для отображения диалога выбора цвета ---
  void _showColorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Выберите фон'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Хотите поменять фон вкладок?'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ColorButton(color: Colors.red.shade200, onPressed: () => _selectColorAndClose(Colors.red.shade200)),
                  _ColorButton(color: Colors.green.shade200, onPressed: () => _selectColorAndClose(Colors.green.shade200)),
                  _ColorButton(color: Colors.blue.shade100, onPressed: () => _selectColorAndClose(Colors.blue.shade100)),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отмена'),
            ),
          ],
        );
      },
    );
  }

  // --- Вспомогательный виджет для кнопки цвета ---
  Widget _ColorButton({required Color color, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.zero,
      ),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }

  // --- Функция для выбора цвета и закрытия диалога ---
  void _selectColorAndClose(Color color) {
    _changeBackgroundColor(color);
    Navigator.of(context).pop();
    // Показываем SnackBar как в ЛР4
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Фон изменён на выбранный цвет!')),
    );
  }
}

