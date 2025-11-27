import 'models/module.dart';
import 'models/lecture.dart';
import 'models/question.dart';

// Тема "Жесты"
final List<Question> _gestureQuiz = [
  Question(
    questionText: "Какой класс используется в Android для распознавания стандартных жестов, таких как смахивание, двойной тап или долгое нажатие?",
    options: ["GestureOverlayView", "MotionEvent", "GestureDetectorCompat", "GestureLibrary"],
    correctAnswerIndex: 2,
    explanation: "Класс GestureDetectorCompat (и его устаревший аналог GestureDetector) используется для отслеживания стандартных жестов. Он работает с интерфейсами OnGestureListener и OnDoubleTapListener или наследником SimpleOnGestureListener.",
  ),
  Question(
    questionText: "Какой метод интерфейса OnGestureListener вызывается при жесте «смахивание» (быстрое движение пальцем по экрану)?",
    options: ["onScroll()", "onSwipe()", "onFling()", "onMove()"],
    correctAnswerIndex: 2,
    explanation: "Метод onFling() вызывается именно при жесте смахивания, когда фиксируется начальное и конечное положение пальца, а также скорость движения. Это отличает его от onScroll(), который реагирует на медленное пролистывание.",
  ),
  Question(
    questionText: "Какой класс следует наследовать, чтобы реализовать обработку только части стандартных жестов, не реализуя все методы интерфейсов?",
    options: ["SimpleOnGestureListener", "GestureListener", "BasicGestureHandler", "GestureAdapter"],
    correctAnswerIndex: 0,
    explanation: "SimpleOnGestureListener — это вспомогательный класс с пустыми реализациями всех методов интерфейсов. Наследуя его, можно переопределить только нужные методы (например, только onFling()), не засоряя код ненужными заглушками.",
  ),
  Question(
    questionText: "Где хранятся пользовательские жесты, созданные с помощью приложения Gesture Builder на эмуляторе Android?",
    options: ["В папке /data/data/", "В SharedPreferences", "В res/drawable/", "В файле gestures на SD-карте эмулятора"],
    correctAnswerIndex: 3,
    explanation: "Приложение Gesture Builder сохраняет все созданные жесты в файл с именем gestures, который хранится на SD-карте эмулятора (обычно в /sdcard/ или /storage/emulated/0/). Этот файл затем копируется в проект",
  ),
  Question(
    questionText: "Какой элемент интерфейса используется для захвата пользовательских (нестандартных) жестов в XML-разметке?",
    options: ["GestureView", "MotionOverlay", "GestureOverlayView", "TouchEventFrame"],
    correctAnswerIndex: 2,
    explanation: "GestureOverlayView — это прозрачный слой, который можно поместить поверх других элементов интерфейса. Он перехватывает жесты пользователя и передаёт их в обработчик OnGesturePerformedListener.",
  ),
  Question(
    questionText: "Как загрузить пользовательские жесты из ресурсов приложения в коде Java?",
    options: ["GestureLibraries.fromRawResource(this, R.raw.gestures)", "GestureLibrary.loadFromAssets('gestures')", "new GestureLibrary(R.drawable.gestures)", "GestureBuilder.import(R.string.gestures)"],
    correctAnswerIndex: 0,
    explanation: "Для загрузки файла с жестами, помещённого в папку res/raw/, используется статический метод GestureLibraries.fromRawResource(), который возвращает объект GestureLibrary. Затем вызывается метод load() для фактической загрузки данных.",
  )
];

// Тема "Основы интерфейсов"
final List<Question> _uiBasicsQuiz = [
  Question(
    questionText: "Какое значение атрибута android:layout_width или android:layout_height указывает, что элемент должен занимать всё доступное пространство родительского контейнера?",
    options: ["wrap_content", "fill_parent", "match_parent", "exact_parent"],
    correctAnswerIndex: 2,
    explanation: "Значение match_parent указывает, что элемент должен растягиваться на всю ширину или высоту родительского контейнера. Оно заменило устаревший fill_parent, хотя функционально они идентичны.",
  ),
  Question(
    questionText: "Для чего используется атрибут android:hint в элементе EditText?",
    options: ["Для установки цвета текста", "Для задания стандартного текста, отображаемого до ввода пользователем", "Для ограничения количества вводимых символов", "Для установки фокуса на поле ввода"],
    correctAnswerIndex: 1,
    explanation: "Атрибут android:hint показывает подсказку («placeholder»), которая исчезает при начале ввода. Рекомендуется использовать строковый ресурс (@string/...) для поддержки локализации."
  ),
  Question(
    questionText: "Как правильно задать фон активности в виде повторяющегося узора (тайлинга)?",
    options: ["Установить android:background='@drawable/image' и задать android:tileMode='repeat' в том же элементе", "Создать XML-файл в папке drawable/, описать в нём <bitmap> с android:src и android:tileMode='repeat', затем использовать его как фон", "Использовать <ImageView> с android:scaleType='repeat'", "Применить CSS-подобное свойство background-repeat в layout-файле"],
    correctAnswerIndex: 1,
    explanation: "Тайлинг в Android реализуется через XML-файл ресурса типа bitmap, где указывается изображение и режим tileMode='repeat'. Этот файл затем подключается как фон через android:background='@drawable/имя_файла'.",
  ),
  Question(
    questionText: "Какой из перечисленных контейнеров позволяет позиционировать дочерние элементы относительно друг друга или родителя?",
    options: ["LinearLayout", "FrameLayout", "RelativeLayout", "ConstraintLayout"],
    correctAnswerIndex: 2,
    explanation: "RelativeLayout позволяет задавать позицию дочерних элементов с помощью таких атрибутов, как layout_below, layout_alignParentLeft и т.д., что даёт гибкость в позиционировании.",
  ),
  Question(
    questionText: "Для чего используется атрибут android:contentDescription в ImageView?",
    options: ["Для отображения подписи под изображением", "Для улучшения SEO в мобильных приложениях", "Для обеспечения доступности — озвучки содержимого изображения для пользователей с нарушениями зрения", "Для кэширования изображения в памяти"],
    correctAnswerIndex: 2,
    explanation: "Атрибут contentDescription используется системой специальных возможностей (например, TalkBack) для озвучивания содержимого изображения, что важно для инклюзивного дизайна.",
  )
];

// Тема "Камера и мультимедиа"
final List<Question> _cameraQuiz = [
  Question(
    questionText: "Какой класс Android используется для воспроизведения аудио- и видеофайлов?",
    options: ["AudioManager", "SoundPool", "MediaPlayer", "MediaRecorder"],
    correctAnswerIndex: 2,
    explanation: "Класс MediaPlayer предоставляет функционал для воспроизведения аудио и видео из различных источников (локальных файлов, URI, потоков). Он поддерживает как синхронную (prepare()), так и асинхронную (prepareAsync()) подготовку к воспроизведению.",
  ),
  Question(
    questionText: "Какой метод класса Camera необходимо вызвать для выполнения снимка?",
    options: ["captureImage()", "takePicture()", "shoot()", "recordFrame()"],
    correctAnswerIndex: 1,
    explanation: "Метод takePicture() запускает процесс съёмки. Он принимает до четырёх колбэков: для затвора, raw-данных, postview и JPEG-изображения. В лабораторной работе используется последний параметр для сохранения снимка в файл.",
  ),
  Question(
    questionText: "Для корректной работы с камерой в Android-приложении необходимо:",
    options: ["Добавить разрешения CAMERA и WRITE_EXTERNAL_STORAGE в AndroidManifest.xml", "Вызвать Camera.newInstance()", "Использовать Intent с действием ACTION_IMAGE_CAPTURE", "Подключить внешнюю библиотеку CameraX"],
    correctAnswerIndex: 0,
    explanation: "Без явного указания разрешений в манифесте приложение не сможет получить доступ к камере или записать снимок на внешнее хранилище. Это обязательное требование для API уровня ниже 23 (до появления runtime permissions).",
  ),
  Question(
    questionText: "Какой элемент интерфейса используется для отображения видеопотока в MediaPlayer?",
    options: ["SurfaceView", "VideoView", "ImageView", "TextureView"],
    correctAnswerIndex: 0,
    explanation: "В лабораторной работе для отображения видео используется SurfaceView, которому через mediaPlayer.setDisplay() передаётся SurfaceHolder. Хотя VideoView проще в использовании, в данном случае цель — демонстрация низкоуровневой работы с MediaPlayer и SurfaceView.",
  ),
  Question(
    questionText: "В каком методе жизненного цикла активности рекомендуется освобождать ресурсы MediaPlayer?",
    options: ["onPause()", "onStop()", "onResume()", "onDestroy()"],
    correctAnswerIndex: 3,
    explanation: "В лабораторной работе освобождение ресурсов (mediaPlayer.release()) выполняется в onDestroy(), чтобы гарантировать корректное завершение работы проигрывателя при полном уничтожении активности. Однако на практике может потребоваться освобождение и в onPause(), если активность теряет фокус",
  )
];

// Тема "Геолокация"
final List<Question> _locationQuiz = [
  Question(
    questionText: "Какой системный сервис Android используется для получения геолокационных данных?",
    options: ["LocationManager", "LocationProvider", "GeolocationManager", "GPSListener"],
    correctAnswerIndex: 0,
    explanation: "LocationManager — это системный сервис, через который приложение запрашивает доступ к данным о местоположении. Он получается с помощью getSystemService(Context.LOCATION_SERVICE).",
  ),
  Question(
    questionText: "Какой метод интерфейса LocationListener вызывается при изменении координат устройства?",
    options: ["onLocationUpdate()", "onLocationChanged()", "onCoordinatesChanged()", "onPositionRefresh()"],
    correctAnswerIndex: 1,
    explanation: "Метод onLocationChanged(Location location) вызывается каждый раз, когда система обнаруживает изменение местоположения устройства. В нём можно получить широту и долготу через location.getLatitude() и location.getLongitude().",
  ),
  Question(
    questionText: "Какое разрешение необходимо объявить в AndroidManifest.xml для доступа к данным GPS?",
    options: ["ACCESS_LOCATION", "ACCESS_COARSE_LOCATION", "USE_GPS_PROVIDER", "ACCESS_FINE_LOCATION"],
    correctAnswerIndex: 3,
    explanation: "Разрешение ACCESS_FINE_LOCATION требуется для получения данных с высокой точностью (например, от GPS). Для менее точных данных (через сотовые вышки или Wi-Fi) достаточно ACCESS_COARSE_LOCATION.",
  ),
  Question(
    questionText: "Какой параметр в методе requestLocationUpdates() задаёт минимальное расстояние (в метрах), при котором будет вызвано обновление координат?",
    options: ["Первый параметр", "Второй параметр", "Третий параметр", "Четвёртый параметр"],
    correctAnswerIndex: 2,
    explanation: "Сигнатура метода: requestLocationUpdates(String provider, long minTime, float minDistance, LocationListener listener). Третий параметр (minDistance) — это минимальное расстояние в метрах, при перемещении на которое произойдёт обновление.",
  ),
  Question(
    questionText: "Какой провайдер местоположения обеспечивает наиболее точные данные?",
    options: ["NETWORK_PROVIDER", "PASSIVE_PROVIDER", "CELL_PROVIDER", "GPS_PROVIDER"],
    correctAnswerIndex: 3,
    explanation: "GPS_PROVIDER использует спутниковую навигацию и предоставляет наиболее точные координаты (до нескольких метров), в отличие от NETWORK_PROVIDER, который опирается на Wi-Fi и вышки сотовой связи.",
  )
];

// Тема "Многоэкранная навигация"
final List<Question> _navQuiz = [
  Question(
    questionText: "Какой класс Android используется для создания активности, содержащей только список без дополнительной разметки?",
    options: ["ListActivity", "Activity", "FragmentActivity", "ScrollViewActivity"],
    correctAnswerIndex: 0,
    explanation: "Класс ListActivity специально предназначен для упрощённого отображения списка. Он автоматически создаёт макет со ListView, поэтому отдельный XML-файл разметки не обязателен.",
  ),
  Question(
    questionText: "Какой компонент Android отвечает за связь данных (например, массива строк) с отображаемым списком?",
    options: ["Intent", "Bundle", "Handler", "Adapter"],
    correctAnswerIndex: 3,
    explanation: "Адаптер (например, ArrayAdapter) связывает источники данных (массивы, списки) с элементами интерфейса, такими как ListView или RecyclerView, преобразуя каждый элемент данных в отдельный элемент списка.",
  ),
  Question(
    questionText: "Для запуска новой активности из текущей в Android необходимо использовать:",
    options: ["Toast", "AlertDialog", "Intent", "Bundle"],
    correctAnswerIndex: 2,
    explanation: "Intent — это объект, который описывает «намерение» запустить другую активность. Он передаётся методу startActivity(), чтобы открыть новое окно приложения.",
  ),
  Question(
    questionText: "Какой метод используется для отображения кратковременного всплывающего сообщения пользователю?",
    options: ["Toast.makeText().show()", "showDialog()", "makeText()", "Alert.show()"],
    correctAnswerIndex: 0,
    explanation: "Класс Toast позволяет показывать краткие уведомления в виде всплывающих сообщений. Для отображения используется цепочка: Toast.makeText(context, message, duration).show().",
  ),
  Question(
    questionText: "Какой класс используется для создания диалогового окна с возможностью выбора из списка?",
    options: ["DialogFragment", "AlertDialog.Builder", "PopupWindow", "Notification.Builder"],
    correctAnswerIndex: 1,
    explanation: "AlertDialog.Builder позволяет гибко настроить диалоговое окно, включая заголовок, список вариантов (setItems), кнопки и обработчики. Именно он используется в лабораторной работе для выбора цвета фона.",
  ),
  Question(
    questionText: "Что необходимо сделать при создании новой активности, чтобы Android «увидел» её и разрешил запуск?",
    options: ["Просто создать .java-файл", "Добавить активность в файл strings.xml", "Указать её в build.gradle", "Зарегистрировать активность в AndroidManifest.xml"],
    correctAnswerIndex: 3,
    explanation: "Каждая активность должна быть объявлена в манифесте с помощью тега <activity>. Без этого система не сможет запустить активность, даже если она существует в коде.",
  )
];

final List<Question> _basicsQuiz = [
  Question(
    questionText: "Какой элемент файла AndroidManifest.xml обязательно должен присутствовать и описывает каждую отдельную активность приложения?",
    options: ["<service>", "<intent-filter>", "<activity>", "<provider>"],
    correctAnswerIndex: 2,
    explanation: "Каждая активность (Activity) в приложении должна быть объявлена в манифесте с помощью тега <activity>, иначе система не сможет её запустить.",
  ),
  Question(
    questionText: "В какой папке проекта Android хранятся исходные Java-файлы (включая классы активностей)?",
    options: ["gen/", "res/", "assets/", "src/"],
    correctAnswerIndex: 3,
    explanation: "Папка src/ содержит все исходные файлы на языке Java, включая классы активностей, таких как MainActivity.java.",
  ),
  Question(
    questionText: "Что из перечисленного НЕ рекомендуется использовать в качестве имени пакета приложения, если вы планируете публиковать его в Google Play?",
    options: ["com.example.project", "com.myname.guessgame", "ru.belgorod.university", "io.github.ruslan.app"],
    correctAnswerIndex: 0,
    explanation: "Имена пакетов с префиксом com.example зарезервированы для примеров и не допускаются в Google Play, так как они не являются уникальными и не принадлежат разработчику.",
  ),
  Question(
    questionText: "Какой файл автоматически генерируется средой разработки и содержит идентификаторы всех ресурсов (строк, макетов, изображений и т.д.)?",
    options: ["strings.xml", "R.java", "AndroidManifest.xml", "build.gradle"],
    correctAnswerIndex: 1,
    explanation: "Файл R.java создаётся автоматически и содержит статические целочисленные идентификаторы для всех ресурсов проекта. Его нельзя редактировать вручную.",
  ),
  Question(
    questionText: "Какой метод в классе активности вызывается при первом создании активности и используется для инициализации интерфейса?",
    options: ["onStart()", "onResume()", "onCreate()", "onInit()"],
    correctAnswerIndex: 2,
    explanation: "Метод onCreate() — это точка входа в активность. В нём обычно вызывают setContentView() и инициализируют элементы интерфейса с помощью findViewById().",
  ),
  Question(
    questionText: "Как правильно получить строковый ресурс из файла strings.xml в Java-коде?",
    options: ["getString(R.string.app_name)", "R.string.app_name", "@string/app_name", "getResources().getText(R.string.app_name)"],
    correctAnswerIndex: 0,
    explanation: "Метод getString() (или getResources().getString()) возвращает локализованное строковое значение из ресурсов. Прямое использование R.string.app_name возвращает только ID (целое число).",
  ),
];

final List<Question> _libraryQuiz = [
  Question(
    questionText: "Какой файл библиотеки необходимо поместить в проект для её подключения в Android (в среде Eclipse)?",
    options: [".jar-файл в папку res/libs", ".jar-файл в папку libs", ".so-файл в папку assets", "Исходный код библиотеки в папку src"],
    correctAnswerIndex: 1,
    explanation: "В среде Eclipse сторонние Java-библиотеки подключаются путём копирования .jar-файла в папку libs проекта. После этого библиотека автоматически добавляется в build path.",
  ),
  Question(
    questionText: "Что необходимо добавить в файл AndroidManifest.xml, чтобы корректно использовать активности из сторонней библиотеки (например, AChartEngine)?",
    options: ["Разрешение <uses-permission>", "Объявление <service>", "Объявление <activity> с полным именем класса библиотеки", "Тег <library> в корне манифеста"],
    correctAnswerIndex: 2,
    explanation: "Некоторые библиотеки (включая AChartEngine) запускают собственные активности. Их необходимо явно объявить в манифесте, например:  <activity android:name='org.achartengine.GraphicalActivity' />.",
  ),
  Question(
    questionText: "Какой класс из библиотеки AChartEngine используется для хранения данных диаграммы (например, подписей и значений)?",
    options: ["CategorySeries", "DefaultRenderer", "PieChart", "ChartFactory"],
    correctAnswerIndex: 0,
    explanation: "Класс CategorySeries представляет собой набор пар «метка–значение», которые отображаются на диаграмме (например, «Apples» → 30).",
  ),
  Question(
    questionText: "Какой объект отвечает за визуальное оформление диаграммы в AChartEngine (цвета, заголовки, легенда и т.д.)?",
    options: ["CategorySeries", "SimpleSeriesRenderer", "DefaultRenderer", "GraphicalTheme"],
    correctAnswerIndex: 2,
    explanation: "DefaultRenderer управляет общими параметрами отображения диаграммы: цветами меток, размером шрифта, включением зума, наличием легенды и заголовка.",
  ),
  Question(
    questionText: "Для чего создаётся объект SimpleSeriesRenderer в AChartEngine?",
    options: ["Для настройки стиля отдельного сегмента (например, цвета одного сектора круговой диаграммы)", "Для указания типа диаграммы (круговая, столбчатая и т.д.)", "Для загрузки данных из внешнего источника", "Для управления анимацией при отображении"],
    correctAnswerIndex: 0,
    explanation: "Каждый элемент в CategorySeries (например, один фрукт в диаграмме) имеет свой SimpleSeriesRenderer, через который задаётся цвет, толщина линии и другие визуальные параметры.",
  ),
];

final List<Question> _databaseQuiz = [
  Question(
    questionText: "Какой класс в Android рекомендуется использовать для управления жизненным циклом базы данных SQLite (создание, обновление)?",
    options: ["SQLiteDatabase", "SQLiteManager", "ContentValues", "SQLiteOpenHelper"],
    correctAnswerIndex: 3,
    explanation: "Класс SQLiteOpenHelper является вспомогательным и упрощает работу с базой данных, автоматически вызывая методы onCreate() при первом создании и onUpgrade() при изменении версии БД.",
  ),
  Question(
    questionText: "В каком методе класса-наследника SQLiteOpenHelper создаётся таблица базы данных?",
    options: ["onInitialize()", "onStart()", "onOpen()", "onCreate()"],
    correctAnswerIndex: 3,
    explanation: "Метод onCreate(SQLiteDatabase db) вызывается один раз при первом создании базы данных и используется для выполнения DDL-запросов, например CREATE TABLE.",
  ),
  Question(
    questionText: "Какой объект используется для хранения пар «столбец–значение» при вставке записи в таблицу SQLite в Android?",
    options: ["ContentValues", "Cursor", "HashMap", "Bundle"],
    correctAnswerIndex: 0,
    explanation: "ContentValues — это специализированный контейнер для хранения значений, привязанных к именам столбцов. Он используется методом SQLiteDatabase.insert().",
  ),
  Question(
    questionText: "Какой метод класса SQLiteDatabase возвращает объект Cursor с результатами запроса?",
    options: ["get()", "read()", "executeQuery()", "query()"],
    correctAnswerIndex: 3,
    explanation: "Метод query() позволяет выполнить SELECT-запрос с указанием таблицы, столбцов, условий и сортировки, возвращая результат в виде Cursor.",
  ),
  Question(
    questionText: "Какой метод используется для удаления всех записей из таблицы в SQLite (без удаления самой таблицы)?",
    options: ["SQLiteDatabase.dropTable()", "SQLiteDatabase.delete() с whereClause = null", "ContentValues.clear()", "SQLiteDatabase.clear()"],
    correctAnswerIndex: 1,
    explanation: "Метод delete(String table, String whereClause, String[] whereArgs) удаляет строки, соответствующие условию. Если whereClause = null, удаляются все строки.",
  ),
];

final List<Question> _intelQuiz = [
  Question(
    questionText: "Какой технологический стек лежит в основе мобильных приложений, разрабатываемых в Intel XDK?",
    options: ["C# + Xamarin", "Kotlin + Jetpack Compose", "HTML5 + CSS + JavaScript", "Java + XML"],
    correctAnswerIndex: 2,
    explanation: "Intel XDK — это кроссплатформенная среда, позволяющая создавать мобильные приложения на основе веб-технологий: HTML5, CSS и JavaScript. Приложение компилируется в нативный формат (например, APK) с помощью Apache Cordova.",
  ),
  Question(
    questionText: "Какой скрипт подключается по умолчанию в пустом шаблоне Intel XDK для обеспечения взаимодействия с устройством?",
    options: ["cordova.js", "intelxdk.js", "device.js", "mobileapi.js"],
    correctAnswerIndex: 1,
    explanation: "Файл intelxdk.js предоставляет доступ к API устройства — управление ориентацией, сенсорами, заставкой, питанием и др. Он автоматически включается при создании проекта.",
  ),
  Question(
    questionText: "Какое событие используется для определения момента полной готовности Intel XDK API и устройства к работе?",
    options: ["window.onload", "intel.xdk.device.ready", "document.ready", "deviceready"],
    correctAnswerIndex: 1,
    explanation: "Событие intel.xdk.device.ready генерируется после инициализации всех компонентов Intel XDK. Только после его срабатывания можно безопасно вызывать методы вроде hideSplashScreen() или setAutoRotate().",
  ),
  Question(
    questionText: "Какой метод вызывается для скрытия заставки (splash screen) после загрузки приложения в Intel XDK?",
    options: ["intel.xdk.app.hide()", "intel.xdk.splash.hide()", "intel.xdk.device.hideSplashScreen()", "window.hideSplash()"],
    correctAnswerIndex: 2,
    explanation: "Этот метод вызывается внутри обработчика события intel.xdk.device.ready, чтобы убрать начальную заставку и показать основной интерфейс приложения.",
  ),
  Question(
    questionText: "Каким образом можно протестировать приложение на реальном устройстве с помощью Intel XDK?",
    options: ["Отправить APK-файл через Bluetooth", "Подключить устройство по USB и нажать «Run»", "Скопировать HTML-файлы на устройство и открыть в браузере", "Установить специальное приложение App Preview и отсканировать QR-код из Intel XDK"],
    correctAnswerIndex: 3,
    explanation: "Intel XDK генерирует QR-код на вкладке Test. После установки приложения App Preview на устройство и сканирования QR-кода, проект загружается и запускается в реальном времени.",
  ),
];

final List<Question> _finalQuiz = [
  Question(
    questionText: "Какой API используется для работы с 3D-графикой?",
    options: ["Canvas", "OpenGL ES", "SQLite", "Retrofit"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой файл содержит основную конфигурацию Android-приложения?",
    options: ["build.gradle", "strings.xml", "AndroidManifest.xml", "styles.xml"],
    correctAnswerIndex: 2,
    explanation: "",
  ),
  Question(
    questionText: "Какой layout позволяет располагать элементы друг под другом?",
    options: ["FrameLayout", "GridLayout", "LinearLayout", "RelativeLayout"],
    correctAnswerIndex: 2,
    explanation: "",
  ),
  Question(
    questionText: "Какой язык программирования чаще всего используется для разработки Android-приложений?",
    options: ["Swift", "C#", "Python", "Kotlin"],
    correctAnswerIndex: 3,
    explanation: "",
  ),
  Question(
    questionText: "Какая библиотеки используются для работы с сетью?",
    options: ["Retrofit", "SQLite", "Room"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Какой API используюется для 3D-графики?",
    options: ["Canvas", "WebGL", "Vulkan"],
    correctAnswerIndex: 2,
    explanation: "",
  ),
  Question(
    questionText: "Какой сенсор доступен в Android?",
    options: ["Датчик влажности", "Гироскоп", "Термистор"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какую среду разработки можно использовать для создания Android-приложений?",
    options: ["PyCharm", "Visual Studio Code (без плагинов)", "Xcode", "IntelliJ IDEA"],
    correctAnswerIndex: 3,
    explanation: "",
  ),
  Question(
    questionText: "При разработке интерфейсов для сложных адаптивных интерфейсов используется...",
    options: ["RelativeLayout", "LinearLayout", "ConstraintLayout"],
    correctAnswerIndex: 2,
    explanation: "",
  ),
  Question(
    questionText: "Для сборки Android-приложений используют...",
    options: ["Logcat", "Room", "Dagger", "Gradle"],
    correctAnswerIndex: 3,
    explanation: "",
  ),
  Question(
    questionText: "Какой файл определяет разрешения, требуемые приложением?",
    options: ["styles.xml", "AndroidManifest.xml", "build.gradle", "strings.xml"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой формат данных чаще всего используется для хранения информации на устройстве?",
    options: ["XML", "SQLite", "JSON", "CSV"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой метод используется для обновления игрового экрана?",
    options: ["onCreate()", "onDraw()", "onPause()", "onResume()"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой компонент отвечает за отрисовку 2D-графики?",
    options: ["Canvas", "MediaPlayer", "SensorManager", "Intent"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Какой вид анимации поддерживается в Android?",
    options: ["XML Animation", "View Animation", "Gradle Animation"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой основной компонент приложения существует в Android?",
    options: ["XML", "Gradle", "Activity"],
    correctAnswerIndex: 2,
    explanation: "",
  ),
  Question(
    questionText: "Какой принцип важен при разработке игр?",
    options: ["Оптимизация производительности", "Работа с базой данных", "Сетевая безопасность"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Какой компонент используется для фоновых задач?",
    options: ["WorkManager", "Activity", "Fragment"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Для сенсоров используют...",
    options: ["GestureDetector", "BiometricPrompt", "CameraX", "SensorManager"],
    correctAnswerIndex: 3,
    explanation: "",
  ),
  Question(
    questionText: "Как называется основной строительный блок интерфейса в Android?",
    options: ["Service", "Activity", "BroadcastReceiver", "ContentProvider"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой компонент Android используется для выполнения длительных операций в фоне?",
    options: ["Activity", "Service", "Fragment", "Intent"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой API используется для определения местоположения?",
    options: ["Wi-Fi API", "NFC API", "Bluetooth API", "Location API"],
    correctAnswerIndex: 3,
    explanation: "",
  ),
  Question(
    questionText: "Какой компонент используется для воспроизведения аудио?",
    options: ["Camera", "MediaPlayer", "SensorManager", "LocationManager"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой файл используется для описания интерфейса в Android?",
    options: ["styles.xml", "build.gradle", "AndroidManifest.xml"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Какой язык программирования поддерживается для разработки Android-приложений?",
    options: ["C++ (без NDK)", "Java", "Swift"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой компонент помогает в навигации между экранами?",
    options: ["BroadcastReceiver", "Service", "Intent"],
    correctAnswerIndex: 2,
    explanation: "",
  ),
  Question(
    questionText: "Какой способ передачи данных между Activity существует?",
    options: ["Bundle", "BroadcastReceiver", "ContentProvider"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Для безопасности используют...",
    options: ["Coroutines", "Glide", "Retrofit", "Biometric"],
    correctAnswerIndex: 3,
    explanation: "",
  ),
  Question(
    questionText: "Какой файл определяет разметку экрана в Android?",
    options: ["AndroidManifest.xml", "activity_main.xml", "build.gradle", "strings.xml"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какая среда разработки является официальной для Android?",
    options: ["Visual Studio", "Eclipse", "Android Studio", "Xcode"],
    correctAnswerIndex: 2,
    explanation: "",
  ),
  Question(
    questionText: "Какой элемент управления используется для ввода текста?",
    options: ["EditText", "Button", "TextView", "ImageView"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Какой вид Android-приложений вы знаете?",
    options: ["Гибридные", "Десктопные", "Консольные"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Какую базу данных можно использовать в Android?",
    options: ["MySQL (без сервера)", "PostgreSQL", "Room"],
    correctAnswerIndex: 2,
    explanation: "",
  ),
  Question(
    questionText: "Какой формат данных используется в мобильных HTML5-приложениях?",
    options: ["SQLite (в веб-приложениях)", "LocalStorage", "Room"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "WorkManager выполняет ... задачи",
    options: ["отложенные", "сетевые", "UI"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Какая технология используется для создания кроссплатформенных мобильных приложений?",
    options: ["Java", "HTML5", "Kotlin", "Swift"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой компонент Android отвечает за управление жизненным циклом приложения?",
    options: ["ApplicationManager", "WindowManager", "PackageManager", "ActivityManager"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Какой компонент используется для работы с сенсорами устройства?",
    options: ["SQLiteDatabase", "Camera", "MediaPlayer", "SensorManager"],
    correctAnswerIndex: 3,
    explanation: "",
  ),
  Question(
    questionText: "Какой движок часто используется для разработки игр на Android?",
    options: ["OpenGL", "Unity", "SQLite", "Retrofit"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой файл является обязательным для Android-приложения?",
    options: ["README.md", "build.gradle", "settings.json"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какая технология применяется для определения местоположения?",
    options: ["Bluetooth Low Energy", "Wi-Fi Positioning", "NFC"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой движок подходит для разработки игр?",
    options: ["LibGDX", "Retrofit", "Room"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Какой layout-менеджер используется в Android?",
    options: ["FlexLayout", "CanvasLayout", "LinearLayout"],
    correctAnswerIndex: 2,
    explanation: "",
  ),
  Question(
    questionText: "Какой формат используется для хранения данных в HTML5-приложениях?",
    options: ["Firebase", "SharedPreferences", "SQLite", "LocalStorage"],
    correctAnswerIndex: 3,
    explanation: "",
  ),
  Question(
    questionText: "Какой язык используется в Intel XDK для разработки приложений?",
    options: ["Java", "JavaScript", "Kotlin", "C#"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какой инструмент позволяет разрабатывать приложения с использованием веб-технологий?",
    options: ["Android Studio", "Intel XDK", "Xcode", "Unity"],
    correctAnswerIndex: 1,
    explanation: "",
  ),
  Question(
    questionText: "Какое преимущество у Intel XDK?",
    options: ["Работа только с Java", "Нативная компиляция", "Кроссплатформенность"],
    correctAnswerIndex: 2,
    explanation: "",
  ),
  Question(
    questionText: "Какие функции выполняет Android Emulator?",
    options: ["Эмуляция различных устройств и конфигураций", "Публикация приложений в Google Play", "Компиляция исходного кода"],
    correctAnswerIndex: 0,
    explanation: "",
  ),
  Question(
    questionText: "Firebase предоставляет ... для разработчиков",
    options: ["локальную БД", "Dagger", "аналитику"],
    correctAnswerIndex: 2,
    explanation: "",
  ),
];

// Список всех модулей
List<Module> modules = [
  Module.withoutInteractive(
    id: 6,
    title: "Введение в разработку мобильных приложений",
    description: "Тема, связанная с лабораторными работами 1 и 2.",
    quizQuestions: _basicsQuiz,
    labNumber: "ЛР 1-2",
  ),
  Module(
    id: 1,
    title: "Основы интерфейсов",
    description: "Тема, связанная с лабораторной работой 3.",
    quizQuestions: _uiBasicsQuiz,
    labNumber: "ЛР 3",
  ),
  Module(
    id: 5,
    title: "Многоэкранная навигация",
    description: "Тема, связанная с лабораторной работой 4.",
    quizQuestions: _navQuiz,
    labNumber: "ЛР 4",
  ),
  Module(
    id: 2,
    title: "Работа с жестами",
    description: "Тема, связанная с лабораторными работами 5 и 6.",
    quizQuestions: _gestureQuiz,
    labNumber: "ЛР 5–6",
  ),
  Module(
    id: 3,
    title: "Камера и мультимедиа",
    description: "Тема, связанная с лабораторной работой 7.",
    quizQuestions: _cameraQuiz,
    labNumber: "ЛР 7",
  ),
  Module(
    id: 4,
    title: "Геолокация",
    description: "Тема, связанная с лабораторной работой 8.",
    quizQuestions: _locationQuiz,
    labNumber: "ЛР 8",
  ),
  Module(
    id: 7,
    title: "Использование сторонних библиотек",
    description: "Тема, связанная с лабораторной работой 9.",
    quizQuestions: _libraryQuiz,
    labNumber: "ЛР 9",
  ),
  Module(
    id: 8,
    title: "Работа с базами данных в Android",
    description: "Тема, связанная с лабораторной работой 10.",
    quizQuestions: _databaseQuiz,
    labNumber: "ЛР 10",
  ),
  Module.withoutInteractive(
    id: 9,
    title: "IntelXDK",
    description: "Тема, связанная с лабораторной работой 11.",
    quizQuestions: _intelQuiz,
    labNumber: "ЛР 11",
  ),
  Module.quizOnly(
    id: 10,
    title: "Итоговый тест",
    description: "Тест, содержащий вопросы по всей дисциплине.",
    quizQuestions: _finalQuiz,
    labNumber: "ЛР 1-11",
  ),
];

// Список всех лекций
List<Lecture> lectures = [
  Lecture(
    id: 1,
    title: "1. Тема: Основы разработки мобильных приложений",
    description: "        Архитектура и особенности платформы Android, основные инструменты и среды программирования, использование эмуляторов для тестирования. Примеры мобильных приложений.",
    relatedModuleIds: [6],
  ),
  Lecture(
    id: 2,
    title: "2. Тема: Виды приложений и их структура",
    description: "        Архитектурные принципы, классификация и внутреннее устройство приложений Android: основные типы приложений, ключевые компоненты, роль файла манифеста, аспекты безопасности.",
    relatedModuleIds: [6, 1],
  ),
  Lecture(
    id: 3,
    title: "3. Тема: Основные этапы разработки приложения с использованием Android IDE",
    description: "        Последовательность создания мобильного приложения: от инициализации проекта и формирования базовой структуры через настройку пользовательского интерфейса до реализации программной логики, обеспечивающей функциональность приложения.",
    relatedModuleIds: [1],
  ),
  Lecture(
    id: 4,
    title: "4. Тема: Визуальный дизайн интерфейсов",
    description: "        Основные блоки визуального оформления, типичные элементы управления и принципы проектирования эффективной навигации внутри приложения.",
    relatedModuleIds: [1, 2],
  ),
  Lecture(
    id: 5,
    title: "5. Тема: Разработка многооконных приложений",
    description: "        Методы создания приложений с несколькими экранами: архитектура многооконных решений, использование диалоговых окон, организация навигации между несколькими активностями, реализация перелистывания.",
    relatedModuleIds: [3, 5],
  ),
  Lecture(
    id: 6,
    title: "6. Тема: Использование возможностей смартфона в приложениях",
    description: "        Интеграция аппаратных функций устройства в мобильные приложения: работа с мультимедийными данными, использование камеры для захвата контента и применение систем позиционирования для обеспечения геолокационных функций.",
    relatedModuleIds: [3, 4],
  ),
  Lecture(
    id: 7,
    title: "7. Тема: Использование библиотек",
    description: "        Подключение и применение внешних библиотек: способы интеграции, обзор популярных решений, ключевые принципы обеспечения безопасности при использовании стороннего кода.",
    relatedModuleIds: [7],
  ),
  Lecture(
    id: 8,
    title: "8. Тема: Работа с базами данных",
    description: "        Принципы хранения и управления данными в мобильных приложениях: основы работы с базами данных и способы их подключения.",
    relatedModuleIds: [8],
  ),
  Lecture(
    id: 9,
    title: "9. Тема: Работа с графикой и анимацией",
    description: "        Ключевые аспекты визуального оформления и динамики в мобильных приложениях: методы создания анимаций, основы работы с 2D- и 3D-графикой, базовые принципы проектирования и реализации игровых приложений",
    relatedModuleIds: [3],
  ),
  Lecture(
    id: 10,
    title: "10. Тема: Новое поколение инструментальных средств разработки мобильных HTML5-приложений. Intel XDK",
    description: "        Кроссплатформенная среда разработки Intel XDK, ориентированная на создание мобильных приложений с использованием веб-технологий: основные возможности и применяемые технологии (HTML5, CSS3, JavaScript, инструменты сборки, отладки и развёртывания приложений на различных мобильных платформах).",
    relatedModuleIds: [9],
  ),
];