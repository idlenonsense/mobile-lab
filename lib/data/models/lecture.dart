class Lecture {
  final int id;
  final String title;
  final String description;
  final List<int> relatedModuleIds; // Список ID тем, связанных с лекцией

  Lecture({
    required this.id,
    required this.title,
    required this.description,
    required this.relatedModuleIds,
  });
}