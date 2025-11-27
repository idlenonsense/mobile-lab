import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Интерактивный Учебник',
      debugShowCheckedModeBanner: false, // Отключаем баннер Debug
      theme: ThemeData(
        useMaterial3: true, // Включаем Material 3
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // Цветовая схема
      ),
      home: const HomeScreen(), // Начальный экран
    );
  }
}