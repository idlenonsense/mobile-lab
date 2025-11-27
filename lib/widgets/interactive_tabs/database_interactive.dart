// lib/widgets/interactive_tabs/database_interactive.dart

import 'package:flutter/material.dart';

// --- Вспомогательный класс для симуляции задачи ---
class Task {
  int id;
  String name;
  bool completed;
  int? priority; // Добавим для симуляции onUpgrade

  Task({required this.id, required this.name, this.completed = false, this.priority = 0});

  // Для отображения в таблице
  Map<String, dynamic> toMap() {
    return {'_id': id, 'task_name': name, 'completed': completed ? 1 : 0, 'priority': priority};
  }
}

// --- Вспомогательный класс для симуляции базы данных ---
class SimulatedDatabase {
  final List<Task> _tasks = [];
  int _nextId = 1;
  String _statusMessage = 'БД создана';

  String get status => _statusMessage;
  List<Task> get tasks => List.from(_tasks); // Возвращаем копию

  // Симуляция onCreate
  void onCreate() {
    _statusMessage = 'Вызван onCreate. Таблица Tasks создана.';
    // В реальности тут был бы execSQL("CREATE TABLE ...")
  }

  // Симуляция создания БД
  void createDatabase() {
    _tasks.clear();
    _nextId = 1;
    onCreate();
  }

  // Симуляция INSERT
  void insertTask(String name) {
    _tasks.add(Task(id: _nextId++, name: name));
    _statusMessage = 'Добавлена задача: "$name".';
  }

  // Симуляция UPDATE
  void updateTask(int id, {bool? completed, int? priority}) {
    Task? task = _tasks.firstWhere((t) => t.id == id);
    if (completed != null) task.completed = completed;
    if (priority != null) task.priority = priority;
    _statusMessage = 'Задача с ID $id обновлена.';
  }

  // Симуляция DELETE
  void deleteTask(int id) {
    _tasks.removeWhere((t) => t.id == id);
    _statusMessage = 'Удалена задача с ID $id.';
  }
}

class DatabaseInteractive extends StatefulWidget {
  const DatabaseInteractive({super.key});

  @override
  State<DatabaseInteractive> createState() => _DatabaseInteractiveState();
}

class _DatabaseInteractiveState extends State<DatabaseInteractive> {
  final SimulatedDatabase _db = SimulatedDatabase();
  String _inputTaskName = '';
  int _selectedTaskId = -1; // Для UPDATE/DELETE
  bool _newCompletedValue = false;
  int _newPriorityValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Симуляция работы с SQLite (ЛР10)',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // --- Статус БД ---
          Card(
            color: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Статус: ${_db.status}\n',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // --- Левая панель: Управление ---
                Expanded(
                  flex: 3,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Управление БД',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              _db.createDatabase();
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(_db.status)),
                              );
                            },
                            child: const Text('Создать/Очистить БД'),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Операции с данными',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          // INSERT
                          TextField(
                            decoration: const InputDecoration(
                              labelText: 'Название задачи',
                              hintText: 'Введите задачу',
                            ),
                            onChanged: (value) {
                              _inputTaskName = value;
                            },
                          ),
                          const SizedBox(height: 4),
                          ElevatedButton(
                            onPressed: () {
                              if (_inputTaskName.isNotEmpty) {
                                _db.insertTask(_inputTaskName);
                                setState(() {}); // Обновляем список задач
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(_db.status)),
                                );
                              }
                            },
                            child: const Text('INSERT - Добавить задачу'),
                          ),
                          const SizedBox(height: 8),
                          // UPDATE
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'ID задачи (Update)',
                                    hintText: 'ID',
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      int? id = int.tryParse(value);
                                      if (id != null) {
                                        _selectedTaskId = id;
                                      }
                                    }
                                  },
                                ),
                              ),
                              Checkbox(
                                value: _newCompletedValue,
                                onChanged: (value) {
                                  setState(() {
                                    _newCompletedValue = value ?? false;
                                  });
                                },
                              ),
                              Text('Completed'),
                              const SizedBox(width: 8),
                              SizedBox(
                                width: 50,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'P',
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      int? priority = int.tryParse(value);
                                      if (priority != null) {
                                        _newPriorityValue = priority;
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          ElevatedButton(
                            onPressed: () {
                              _db.updateTask(_selectedTaskId, completed: _newCompletedValue, priority: _newPriorityValue);
                              setState(() {}); // Обновляем список задач
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(_db.status)),
                              );
                            },
                            child: const Text('UPDATE - Обновить задачу'),
                          ),
                          const SizedBox(height: 8),
                          // DELETE
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'ID задачи (Delete)',
                                    hintText: 'ID',
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      int? id = int.tryParse(value);
                                      if (id != null) {
                                        _selectedTaskId = id;
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          ElevatedButton(
                            onPressed: () {
                              _db.deleteTask(_selectedTaskId);
                              setState(() {}); // Обновляем список задач
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(_db.status)),
                              );
                            },
                            child: const Text('DELETE - Удалить задачу'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // --- Правая панель: Вывод данных ---
                Expanded(
                  flex: 2,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Содержимое таблицы Tasks',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ListView.builder(
                              itemCount: _db.tasks.length,
                              itemBuilder: (context, index) {
                                Task task = _db.tasks[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(task.name),
                                    subtitle: Text('ID: ${task.id}, Completed: ${task.completed}, Priority: ${task.priority ?? 'N/A'}'),
                                    trailing: Icon(
                                      task.completed ? Icons.check_box : Icons.check_box_outline_blank,
                                      color: task.completed ? Colors.green : null,
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
          ),
        ],
      ),
    );
  }
}