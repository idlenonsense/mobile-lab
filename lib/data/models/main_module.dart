import 'lecture.dart';
import 'module.dart';

class MainModule {
  final int id;
  final String title;
  final String description;
  final List<Module> subModules;
  final List<Lecture> lectures;

  MainModule({
    required this.id,
    required this.title,
    required this.description,
    required this.subModules,
    required this.lectures,
  });
}