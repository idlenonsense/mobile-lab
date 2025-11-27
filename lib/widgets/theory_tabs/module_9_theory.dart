import 'package:flutter/material.dart';

class Module9Theory extends StatelessWidget {
  const Module9Theory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            'Архитектура гибридного приложения',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Ядром любого гибридного приложения является компонент WebView. Это не полноценный браузер, а встраиваемый движок рендеринга, который позволяет отображать веб-контент внутри нативного приложения. На Android это android.webkit.WebView, на iOS — WKWebView. WebView загружает локальные HTML-файлы из ресурсов приложения и выполняет вложенный JavaScript, создавая иллюзию полноценного пользовательского интерфейса."
                "\nОднако «голый» WebView не даёт доступа к камере, геолокации, сенсорам или файловой системе — эти возможности блокируются политикой безопасности браузера. Чтобы преодолеть это ограничение, используется механизм моста (bridge) между JavaScript и нативным кодом. Гибридные фреймворки предоставляют этот мост в виде JavaScript-библиотек, которые на самом деле вызывают нативные методы через специальный интерфейс. Например, вызов navigator.geolocation.getCurrentPosition() в вебе может использовать стандартный API браузера, но в гибридном приложении он перенаправляется на LocationManager в Android или CLLocationManager в iOS."
                "\nВ Intel XDK эта абстракция реализована через объект intel.xdk, который предоставляет унифицированный API для работы с устройством:",
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
// Скрытие стартового экрана после загрузки
intel.xdk.device.hideSplashScreen();

// Блокировка перехода устройства в спящий режим
intel.xdk.device.managePower(true, false);

// Управление ориентацией экрана
intel.xdk.device.setRotateOrientation("any");
intel.xdk.device.setAutoRotate(true);
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Этот паттерн — подписка на событие через addEventListener — является каноническим для DOM-ориентированных приложений. Он отражает асинхронную природу веба: разработчик не контролирует момент, когда ресурсы станут доступны, но может реагировать на соответствующие уведомления. Такой подход требует мышления в терминах реактивности, а не последовательного выполнения кода.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/architecture.png",
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
          Image.asset(
            "assets/images/intel.png",
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
            'Ограничения и компромиссы гибридного подхода',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Несмотря на привлекательность идеи «писать один раз — запускать везде», гибридная разработка не является универсальным решением. Её основные ограничения лежат в трёх плоскостях:"
                "\nПроизводительность. WebView не оптимизирован для сложных анимаций или интенсивных вычислений. Прокрутка длинных списков, плавные переходы между экранами, сложная графика — всё это может работать с заметными подтормаживаниями по сравнению с нативным кодом. Современные фреймворки (например, Ionic с использованием CSS-ускорений) значительно сократили этот разрыв, но он по-прежнему существует."
                "\nПользовательский опыт. Каждая мобильная платформа имеет свои гайдлайны (Material Design, Human Interface Guidelines). Гибридное приложение, как правило, выглядит «одинаково везде», что может нарушать ожидания пользователя. Создание двух наборов стилей (один для Android, другой для iOS) сводит на нет одно из главных преимуществ подхода."
                "\nДоступ к новым API. Когда Apple или Google выпускают новую функцию (например, Face ID или складной экран), нативные разработчики получают к ней доступ немедленно. Гибридным фреймворкам требуется время, чтобы обернуть эту функциональность в JavaScript API. В результате гибридное приложение всегда отстаёт от переднего края возможностей платформы."
                "\nТем не менее, для огромного класса задач — формы, списки, простые диаграммы, карты, чаты — этих ограничений недостаточно, чтобы отказаться от гибридного подхода. Особенно когда скорость разработки и стоимость поддержки являются критическими факторами.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Жизненный цикл и событийная модель',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "В отличие от нативных приложений, где жизненный цикл управляется операционной системой через методы вроде onCreate() или viewDidLoad(), гибридное приложение живёт в мире DOM и событий JavaScript. Его инициализация начинается с загрузки HTML-документа, но ключевой момент — ожидание готовности платформы."
                "\nСтандартная ловушка новичков — попытка вызвать intel.xdk API сразу в <script>, до того как движок успел инициализироваться. Чтобы этого избежать, фреймворки предоставляют специальное событие готовности, которое гарантирует, что все нативные мосты подключены и готовы к работе.",
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
var onDeviceReady = function() {
    intel.xdk.device.hideSplashScreen();
    // Теперь можно безопасно вызывать любые API
};
document.addEventListener("intel.xdk.device.ready", onDeviceReady, false);
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Этот паттерн — подписка на событие через addEventListener — является каноническим для DOM-ориентированных приложений. Он отражает асинхронную природу веба: разработчик не контролирует момент, когда ресурсы станут доступны, но может реагировать на соответствующие уведомления. Такой подход требует мышления в терминах реактивности, а не последовательного выполнения кода.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Эволюция инструментов',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Intel XDK, упомянутый в лабораторной работе, является историческим примером среды для гибридной разработки. Он был построен на базе Apache Cordova (известного также как PhoneGap) и добавлял удобный графический интерфейс, эмулятор и облачную сборку. Однако сам Intel прекратил поддержку XDK в 2017 году, и сегодня он представляет в основном академический интерес."
                "\nСовременный стек гибридной разработки выглядит иначе. Apache Cordova остаётся «ядром» — открытым, сообщественным проектом, предоставляющим базовый мост между JS и нативом. Ionic Framework добавляет к нему богатую библиотеку UI-компонентов и инструменты для CLI-сборки. Capacitor, разработанный тем же сообществом, что и Ionic, предлагает более современную архитектуру с лучшей интеграцией в нативные проекты и поддержкой не только мобильных, но и десктопных платформ."
                "\nИнтересно, что идея гибридного подхода не умерла, а трансформировалась. Современные решения, такие как React Native или Flutter, также используют «единый код», но вместо WebView они рендерят нативные компоненты, полностью обходя веб-движок. Это компромисс: вы теряете знание HTML/CSS, но получаете производительность, близкую к нативной.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'HTML5',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Одним из ключевых достижений HTML5 стало введение семантических элементов, таких как <header>, <nav>, <main>, <section>, <article>, <aside>, <footer>. В отличие от безликих <div>, эти теги несут в себе смысловую нагрузку, делая структуру документа понятной не только разработчикам, но и вспомогательным технологиям: скринридерам, поисковым роботам, агрегаторам контента."
                "\nСемантика — это не вопрос стиля, а вопрос доступности и масштабируемости. Когда разметка отражает логическую организацию информации, её проще поддерживать, тестируемость растёт, а контент становится независимым от представления. Это особенно важно в мобильных приложениях, где один и тот же контент может отображаться на экранах самых разных размеров и форм-факторов."
                "\n\nHTML5 ввёл несколько уровней абстракции для хранения данных на стороне клиента. Наиболее простой — localStorage — представляет собой постоянное хранилище в виде пар «ключ–значение», доступное даже после закрытия браузера. Его объём ограничен (обычно 5–10 МБ), но для хранения настроек, кэша или небольших пользовательских данных он идеален.",
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
localStorage.setItem('username', 'Руслан');
let name = localStorage.getItem('username');
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Для более сложных сценариев существует IndexedDB — полноценная объектно-ориентированная база данных в браузере. Она поддерживает транзакции, индексацию, асинхронные запросы и может хранить мегабайты данных (вплоть до 50% доступного места на диске). IndexedDB лежит в основе оффлайн-приложений: почтовых клиентов, редакторов документов, карт."
                "\nТретий уровень — Cache API в связке с Service Workers — позволяет кэшировать не только данные, но и сетевые ресурсы (HTML, CSS, JS, изображения), обеспечивая мгновенную загрузку приложения даже без интернета."
                "\n\nОдно из самых революционных нововведений HTML5 — Service Workers. Это скрипты, работающие в фоне, независимо от вкладки браузера. Они перехватывают сетевые запросы, управляют кэшем, реализуют push-уведомления и даже позволяют приложению запускаться без подключения к интернету.w"
                "\nВ паре с Web App Manifest (JSON-файлом с метаданными) Service Workers превращают веб-сайт в Progressive Web App (PWA) — приложение, которое можно установить на устройство, запускать с домашнего экрана и использовать как нативное. Такие приложения уже используют Twitter, Spotify, Starbucks и десятки других компаний."
                "\n\nHTML5 предоставляет огромные возможности, но не в ущерб безопасности. Все чувствительные API — геолокация, камера, микрофон, уведомления — требуют явного разрешения пользователя. Браузер никогда не предоставит доступ без запроса, а пользователь в любой момент может отозвать это разрешение."
                "\nКроме того, все API подчиняются политике одного источника (Same-Origin Policy) и песочнице браузера: скрипт не может читать файлы с диска напрямую (только через FileReader после выбора пользователем), не может делать запросы на произвольные домены без CORS, не может получать доступ к памяти других вкладок."
                "\nЭти ограничения делают веб-платформу одновременно мощной и безопасной.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/html5.jpg",
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
        ],
      ),
    );
  }
}