import 'package:flutter/material.dart';

class Module8Theory extends StatelessWidget {
  const Module8Theory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SQLite не клиент-серверная СУБД в привычном понимании. Это встраиваемая библиотека, работающая в том же процессе, что и приложение. Она не требует отдельного сервера, не использует сетевые вызовы и обеспечивает ACID-свойства транзакций даже на устройствах с ограниченными ресурсами. Это делает её идеальной для мобильной платформы, где энергоэффективность, автономность и стабильность критически важны."
                "\nРабота с SQLite в Android проходит через иерархию классов, спроектированную с учётом жизненного цикла приложения и необходимости изоляции потоков. Основной класс — SQLiteDatabase — предоставляет низкоуровневый API для выполнения SQL-запросов, но прямое его использование редко оправдано в современных проектах. Вместо этого Android предлагает более безопасные и удобные обёртки, такие как SQLiteOpenHelper и, в более свежих версиях, Room.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Архитектура SQLite в Android',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Каждое приложение в Android работает в изолированной песочнице. База данных SQLite, созданная приложением, хранится в его частной директории: /data/data/<package_name>/databases/. Это означает, что другие приложения не могут напрямую получить доступ к этим файлам, что обеспечивает базовый уровень безопасности."
                "\nКласс SQLiteOpenHelper играет роль фабрики и жизненного цикла базы данных. Он инкапсулирует логику создания и обновления схемы, гарантируя, что база будет инициализирована ровно один раз и корректно адаптирована при смене версии. Разработчик обязан реализовать два метода: onCreate() и onUpgrade(). Первый вызывается при первом открытии базы и отвечает за создание таблиц. Второй — при обнаружении несоответствия версии, и именно здесь реализуется миграция схемы.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              """
public class MyOpenHelper extends SQLiteOpenHelper {
    private static final String TABLE = "notes";
    private static final String COL_ID = "_id";
    private static final String COL_TITLE = "title";

    public MyOpenHelper(Context context) {
        super(context, "app.db", null, 1);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String sql = "CREATE TABLE " + TABLE + " (" +
                     COL_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                     COL_TITLE + " TEXT NOT NULL);";
        db.execSQL(sql);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Реализация миграции: ALTER TABLE, перенос данных и т.д.
    }
}
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/sqlite.jpg",
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 150,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            'Транзакции, курсоры и безопасность',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Все операции с базой данных в Android выполняются через объект SQLiteDatabase, который может быть открыт в режиме «только для чтения» (getReadableDatabase()) или «для записи» (getWritableDatabase()). Несмотря на название, getReadableDatabase() на практике часто возвращает тот же объект, что и getWritableDatabase(), если устройство не находится в состоянии нехватки памяти."
                "\nДля выполнения DML-операций (INSERT, UPDATE, DELETE) предпочтительнее использовать методы insert(), update(), delete() с объектом ContentValues, а не голый SQL. Это не только повышает читаемость кода, но и защищает от SQL-инъекций, так как значения автоматически экранируются.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              """
ContentValues values = new ContentValues();
values.put("title", userInput);
db.insert("notes", null, values);
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Для чтения данных используется метод query(), возвращающий объект Cursor. Cursor — это не список, а итератор по результатам запроса, который загружает данные постранично и позволяет эффективно работать с большими объёмами информации без загрузки всего результата в память. Работа с ним требует внимания к жизненному циклу: Cursor должен быть закрыт после использования, иначе произойдёт утечка ресурсов.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              """
Cursor cursor = db.query("notes", null, null, null, null, null, null);
try {
    while (cursor.moveToNext()) {
        String title = cursor.getString(cursor.getColumnIndex("title"));
        // обработка
    }
} finally {
    cursor.close();
}
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Современные практики настоятельно рекомендуют использовать try-with-resources, если уровень API позволяет, или, что ещё лучше, абстрагироваться от Cursor полностью через ORM-библиотеки.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Эволюция: от SQLiteOpenHelper к Room',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Хотя SQLiteOpenHelper остаётся рабочим инструментом, Google с 2017 года активно продвигает Room — часть Android Jetpack, представляющую собой надстройку над SQLite. Room решает ключевые проблемы ручного управления базой:"
                "\n- Компиляционная проверка SQL-запросов: ошибки выявляются на этапе сборки, а не в рантайме."
                "\n- Автоматическое преобразование объектов: больше не нужно вручную конвертировать Cursor в POJO."
                "\n- Поддержка реактивных потоков: LiveData и Flow позволяют автоматически обновлять UI при изменении данных."
                "\n- Упрощённая миграция: декларативное описание изменений схемы."
                "\nВ Room вся работа строится вокруг трёх компонентов:"
                "\n- Entity — класс, сопоставленный с таблицей;"
                "\n- DAO (Data Access Object) — интерфейс с методами доступа к данным;"
                "\n- Database — абстрактный класс, объединяющий сущности и DAO.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/room.jpg",
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 150,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            'Ограничения и рекомендации',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "SQLite в Android не поддерживает все возможности полноценных СУБД. Отсутствует, например, RIGHT JOIN, ограничены возможности триггеров и хранимых процедур. Кроме того, база данных блокируется на запись, пока выполняется другая транзакция, что делает работу в фоновых потоках не рекомендацией, а обязательным требованием. Выполнение запросов в основном потоке вызовет android.database.sqlite.SQLiteException на современных версиях Android."
                "\nВажно помнить: SQLite — это инструмент для локального хранения. Если данные должны быть синхронизированы между устройствами или пользователями, требуется интеграция с облачным бэкендом. В таких сценариях локальная база данных выступает как кэш или оффлайн-буфер, а не как источник истины.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}