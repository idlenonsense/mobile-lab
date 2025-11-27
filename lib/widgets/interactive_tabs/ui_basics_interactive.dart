import 'package:flutter/material.dart';

class _UIBasicsDemoWidget extends StatefulWidget {
  const _UIBasicsDemoWidget();

  @override
  State<_UIBasicsDemoWidget> createState() => _UIBasicsDemoWidgetState();
}

class _UIBasicsDemoWidgetState extends State<_UIBasicsDemoWidget> {
  // Состояния для симуляции элементов интерфейса
  String _inputHint = "Введите запрос";
  String _buttonText = "Go!";
  String _imageSource = "puppy";
  final String _bgSource = "starring";
  bool _bgTiled = true;

  // Состояния для перетаскивания элементов
  final double _imageX = 0;
  final double _imageY = 0;
  final bool _imageDragged = false;

  // Состояния для симуляции оценки
  bool _liked = false;
  bool _disliked = false;

  // Controllers для TextField
  late TextEditingController _hintController;
  late TextEditingController _buttonTextController;
  late TextEditingController _inputFieldController;

  @override
  void initState() {
    super.initState();
    _hintController = TextEditingController(text: _inputHint);
    _buttonTextController = TextEditingController(text: _buttonText);
    _inputFieldController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _hintController.dispose();
    _buttonTextController.dispose();
    super.dispose();
  }

  void _resetFeedback() {
    setState(() {
      _liked = false;
      _disliked = false;
    });
    switch(_imageSource) {
      case "puppy":
        setState(() {
          _imageSource = "water";
        });
      case "water":
        setState(() {
          _imageSource = "dust";
        });
      case "dust":
        setState(() {
          _imageSource = "puppy";
        });
      default:
        setState(() {
          _imageSource = "puppy";
        });
    }
  }

  void _onInvalidSearch() {
    if (_inputFieldController.text != "") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('По запросу "${_inputFieldController.text}" ничего не найдено. (Попробуйте поиск по доступным изображениям. Например: "water")'))
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('По запросу "$_inputHint" ничего не найдено. (Попробуйте поиск по доступным изображениям. Например: "water")'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // --- Симуляция главного экрана приложения ---
          Expanded(
            flex: 2,
            child: Container(
              // Симуляция фона приложения
              decoration: BoxDecoration(
                color: _bgTiled ? Colors.transparent : Colors.white70,
                image: _bgTiled
                    ? DecorationImage(
                  image: AssetImage('assets/images/$_bgSource.png'),
                  fit: BoxFit.fill, // Упрощённая симуляция замощения
                )
                    : null,
              ),
              child: Column(
                children: [
                  // --- Top Bar: EditText и Button ---
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _inputFieldController,
                            decoration: InputDecoration(
                              hintText: _inputHint,
                              border: OutlineInputBorder(),
                              filled: true,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            String inputText = _inputFieldController.text;
                            if (inputText != "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Поиск по запросу: "$inputText"')),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Поиск по запросу: "$_inputHint"')),
                              );
                            }
                            switch(inputText){
                              case "puppy":
                              case "water":
                              case "dust":
                                setState(() {
                                  _imageSource = inputText;
                                });
                              default:
                                Future.delayed(Duration(seconds: 3), _onInvalidSearch);
                            }
                          },
                          child: Text(_buttonText),
                        ),
                      ],
                    ),
                  ),
                  // --- FrameLayout: ImageView ---
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Stack(
                        children: [
                          // Симуляция ImageView
                          Center(
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/$_imageSource.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: DragTarget<String>(
                                builder: (context, candidateData, rejectedData) {
                                  return Container(
                                    color: candidateData.isNotEmpty
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.transparent,
                                    child: candidateData.isEmpty
                                        ? Container()
                                        : Center(
                                      child: Icon(
                                        Icons.image,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  );
                                },
                                onAccept: (data) {
                                  if (data.startsWith('image_')) {
                                    String newImageName = data.substring(6);
                                    setState(() {
                                      _imageSource = newImageName;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          // Визуализация смещения при перетаскивании
                          if (_imageDragged)
                            Positioned(
                              left: _imageX,
                              top: _imageY,
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Icon(
                                  Icons.image,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _liked = true;
                              _disliked = false;
                            });
                            Future.delayed(Duration(seconds: 1), _resetFeedback);
                          },
                          icon: Icon(Icons.thumb_up),
                          label: Text('Like'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _liked ? Colors.green : null,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _disliked = true;
                              _liked = false;
                            });
                            Future.delayed(Duration(seconds: 1), _resetFeedback);
                          },
                          icon: Icon(Icons.thumb_down),
                          label: Text('Dislike'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _disliked ? Colors.red : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // --- Панель управления для изменения свойств элементов ---
          const Divider(height: 20),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Настройки интерфейса:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  // Изменение Hint для EditText
                  TextField(
                    controller: _hintController,
                    decoration: InputDecoration(
                      labelText: 'strings.xml/edit_message',
                      hintText: 'Например: Enter your text here',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _inputHint = value;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  // Изменение текста для Button
                  TextField(
                    controller: _buttonTextController,
                    decoration: InputDecoration(
                      labelText: 'strings.xml/button_send',
                      hintText: 'Например: Go!',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _buttonText = value;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  // Переключение режима фона
                  Row(
                    children: [
                      Checkbox(
                        value: _bgTiled,
                        onChanged: (value) {
                          setState(() {
                            _bgTiled = value ?? false;
                          });
                        },
                      ),
                      Text('Фон с замощением (Tiled)'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Доступные изображения (перетащите на экран):'),
                  Wrap(
                    spacing: 4.0,
                    runSpacing: 4.0,
                    children: [
                      for (String imgName in ['puppy', 'water', 'dust'])
                        Draggable<String>(
                            data: 'image_$imgName',
                            feedback: Material(
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/$imgName.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(color: Colors.blue),
                                ),
                              ),
                            ),
                            child: Column(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/$imgName.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      border: Border.all(color: Colors.blue),
                                    ),
                                  ),
                                  Text(imgName)
                                ]
                            )
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UIBasicsInteractive extends StatelessWidget {
  const UIBasicsInteractive({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UIBasicsDemoWidget(); // Возвращаем наш внутренний Stateful Widget
  }
}