import 'package:flutter/material.dart';

class Module7Theory extends StatelessWidget {
  const Module7Theory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Сторонние библиотеки не просто «готовый код», это расширение самой экосистемы Android. Они позволяют реализовывать сложные функции — от построения графиков и обработки изображений до интеграции с облачными сервисами — без необходимости изобретать колесо."
                "В Android концепция «библиотеки» имеет несколько уровней: от простых JAR-файлов до полноценных Android-библиотек (AAR), включающих ресурсы, манифест и даже собственные активности. Понимание этих различий критически важно для корректного подключения и использования внешнего кода в проекте. Исторически Android-разработка прошла путь от ручного копирования библиотек в папку libs до современных систем управления зависимостями, таких как Gradle и Maven Central. Однако даже сегодня знание низкоуровневых механизмов остаётся необходимым для отладки, интеграции устаревших решений или работы в изолированных средах.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Архитектурные модели библиотек',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Наиболее простой формат — JAR (Java Archive). Это архив, содержащий скомпилированный байт-код Java-классов и, при необходимости, метаданные в виде манифеста. JAR-библиотеки не содержат ресурсов Android (XML-макеты, строки, изображения) и не могут объявлять компоненты приложения (активности, сервисы). Они подходят для логики, полностью независимой от платформы: математические вычисления, парсинг данных, криптография."
                "\nДля задач, требующих интеграции с UI или системными сервисами Android, был создан формат AAR (Android Archive). AAR — это расширенный JAR, включающий:"
                "\n1. classes.jar — скомпилированный код;"
                "\n2. res/ — ресурсы (макеты, drawable, values);"
                "\n3. AndroidManifest.xml — объявления компонентов и разрешений;"
                "\n4. R.txt — таблица ресурсов для корректного связывания;"
                "\n5. ProGuard-правила и другие метаданные."
                "\nИменно AAR позволяет библиотекам, таким как AChartEngine, предоставлять готовые экраны (например, GraphicalActivity) и управлять собственными элементами интерфейса. При подключении AAR в проект все её ресурсы и компоненты сливаются с основным приложением на этапе сборки, что создаёт иллюзию «родного» кода."
                "\nСовременный Android-стек пошёл ещё дальше, внедрив динамические функциональные модули (Dynamic Feature Modules), позволяющие загружать код и ресурсы по требованию. Это редко используется в сторонних библиотеках, но демонстрирует эволюцию подхода: от статической компоновки к гибкой, модульной архитектуре.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Механизмы подключения',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "В ранние годы Android-разработки (до появления Android Studio и Gradle) подключение библиотеки означало буквальное перетаскивание файла .jar или .aar в папку libs проекта. Эта операция была простой, но чреватой проблемами:"
                "\n- отсутствие версионирования;"
                "\n- невозможность автоматического разрешения транзитивных зависимостей;"
                "\n- nриск конфликтов имён классов;"
                "\n- сложность обновления."
                "С появлением Gradle и Maven-репозиториев (JCenter, Maven Central, Google’s Maven) ситуация кардинально изменилась. Теперь достаточно добавить одну строку в файл build.gradle:",
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
implementation 'com.github.PhilJay:MPAndroidChart:v3.1.0'
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Система сборки автоматически:"
                "\n1. Скачивает указанную версию библиотеки из репозитория;"
                "\n2. Разрешает все её зависимости;"
                "\n3. Включает код и ресурсы в APK;"
                "\n4. Позволяет легко управлять версиями и проверять лицензии."
                "\nТем не менее, в учебных или корпоративных средах по-прежнему встречаются ситуации, когда библиотека доступна только в виде локального файла. В таком случае Gradle также поддерживает локальные зависимости:",
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
implementation files('libs/achartengine-1.2.0.jar')
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Это гибридный подход, сочетающий удобство системы сборки с необходимостью ручного управления файлами.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Жизненный цикл интеграции',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Подключение библиотеки — лишь первый шаг. Многие Android-библиотеки требуют декларативной настройки в AndroidManifest.xml. Например, если библиотека содержит активность, её необходимо объявить, иначе система не сможет её запустить. Это не ограничение, а важный аспект безопасности и прозрачности: разработчик должен быть в курсе, какие компоненты становятся частью его приложения.",
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
// <activity android:name="org.achartengine.GraphicalActivity" />
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Эта строка сообщает системе, что GraphicalActivity — это легитимный экран приложения, и на него могут ссылаться Intent'ы. Без этого объявления попытка запустить активность приведёт к ActivityNotFoundException."
                "\nКроме того, библиотеки могут требовать разрешений (permissions). Например, библиотека для загрузки данных с сервера может потребовать INTERNET, а для сохранения графиков — WRITE_EXTERNAL_STORAGE. Эти разрешения также объявляются в манифесте библиотеки и автоматически сливаются с манифестом приложения. Однако начиная с Android 6.0, опасные разрешения всё равно требуют динамического запроса."
                "\nЕщё один тонкий момент - контекст. Многие методы библиотек (особенно связанные с UI или системными сервисами) требуют передачи Context. Важно понимать разницу между Activity и Application контекстом: передача Application-контекста в UI-компоненты может привести к утечке памяти, так как он привяжет жизненный цикл компонента к циклу всего приложения.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Пример: построение визуализаций через декларативный API',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Рассмотрим типичный паттерн использования библиотеки для визуализации данных. Вместо ручной отрисовки на Canvas, разработчик оперирует высокоуровневыми абстракциями: модель данных, рендерер и фабрика диаграмм."
                "Сначала создаётся модель — например, CategorySeries, которая хранит пары «метка–значение»:",
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
CategorySeries series = new CategorySeries("Распределение");
series.add("Яблоки", 30);
series.add("Апельсины", 20);
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Затем настраивается внешний вид через DefaultRenderer:",
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
DefaultRenderer renderer = new DefaultRenderer();
renderer.setChartTitle("Фруктовый салат");
renderer.setLabelsColor(Color.BLACK);
renderer.setZoomEnabled(true);
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Для каждой категории задаётся отдельный стиль через SimpleSeriesRenderer:",
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
SimpleSeriesRenderer r1 = new SimpleSeriesRenderer();
r1.setColor(Color.RED);
renderer.addSeriesRenderer(r1);
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Наконец, библиотека генерирует Intent, который запускает отдельную активность с диаграммой:",
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
Intent intent = ChartFactory.getPieChartIntent(context, series, renderer, "Заголовок");
startActivity(intent);
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/achartEngine.png",
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
            'Безопасность, лицензирование и поддержка',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "Использование стороннего кода несёт с собой риски. Во-первых, безопасность: библиотека имеет доступ ко всем тем же ресурсам, что и ваше приложение. Вредоносная или уязвимая библиотека может украсть данные, отправить их на удалённый сервер или вызвать отказ в обслуживании."
                "\nВо-вторых, лицензирование. Многие open-source библиотеки распространяются под лицензиями (MIT, Apache 2.0, GPL), которые накладывают обязательства: указание авторства, открытие изменённого кода и т.д. Нарушение лицензионных условий может повлечь юридические последствия."
                "\nВ-третьих, поддержка. Проект может быть заброшен (как AChartEngine, чей последний коммит датируется 2014 годом). В таком случае вы остаётесь один на один с багами, несовместимостями с новыми версиями Android и отсутствием документации."
                "\nПоэтому перед подключением библиотеки важно оценить:"
                "\n- активность репозитория (коммиты, issue, pull request);"
                "\n- количество звёзд и форков;"
                "\n- наличие документации и примеров;"
                "\n- лицензию;"
                "\n- зависимости от других библиотек.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}