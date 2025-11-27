import 'package:flutter/material.dart';

class Module5Theory extends StatelessWidget {
  const Module5Theory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            'Класс Camera',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Класс Camera используется для настройки параметров захвата изображений, запуска/остановки предварительного просмотра, привязки изображений и извлечения кадров для "
      "кодирования видео. Этот класс является клиентом службы Camera, которая управляет аппаратным обеспечением камеры."
                "Чтобы получить доступ к камере устройства, вы должны объявить разрешение Manifest.permission.Camera в вашем манифесте Android. Также не забудьте включить элемент манифеста <uses-feature>, чтобы указать функции камеры, используемые вашим приложением."
                "\n\nCтарый API предоставлял чрезвычайно ограниченный контроль над аппаратными возможностями камеры и не мог эффективно использовать новые функции, появлявшиеся в смартфонах — RAW-съёмку, ручную фокусировку, настройку выдержки, HDR в реальном времени."
                "\nЕго заменил Camera2 API — полноценный, низкоуровневый интерфейс, работающий на основе асинхронных запросов и состояний. Вместо простых вызовов вроде camera.takePicture(), вы формируете цепочку захвата (CaptureRequest), указываете, куда записывать данные, как обрабатывать предпросмотр и как реагировать на события"
                ". Этот API сложен, но мощен: он позволяет реализовать всё, что может аппаратура."
                "\nДля большинства приложений, где не требуется максимальная гибкость, Google разработал ещё один слой над Camera2 — CameraX. Этот Jetpack-компонент скрывает всю сложность Camera2, предоставляет простой жизненный цикл, автоматические коррекции ориентации и поддержку превью, захвата изображений и анализа кадров. CameraX работает с Android 5.0+, но при этом использует Camera2 на устройствах, где он доступен, и переключается на старый API на устаревших устройствах."
                "Важно отметить: даже при использовании устаревшего API, как в лабораторной, необходимо корректно управлять ресурсами — открывать камеру в onResume() и освобождать в onPause(). Это связано с тем, что система не даёт одновременно нескольким приложениям доступ к камере. Нарушение этого правила приведёт к краху приложения или конфликту с другими программами.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Использование SurfaceView для предпросмотра',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Для отображения «живого» изображения с камеры используется компонент SurfaceView. Он создаёт поверхность, на которую система может напрямую выводить видеопоток. Чтобы связать камеру с этим компонентом, используется объект SurfaceHolder, а его обратные вызовы (surfaceCreated, surfaceChanged) позволяют точно контролировать момент, когда поверхность готова к отображению. Сам процесс съёмки включает два этапа:"
                "\n1. Автофокусировка — повышает качество снимка и улучшает пользовательский опыт"
                "\n2. Вызов takePicture() — после успешного фокуса делается снимок, и данные передаются в callback.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/surfaceView.png",
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
            'Сохранение на SD-карту',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Полученное изображение (в формате JPEG) представляет собой массив байтов. Чтобы сохранить его, достаточно открыть FileOutputStream и записать данные в файл:",
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
FileOutputStream os = new FileOutputStream("/sdcard/CameraExample/" + System.currentTimeMillis() + ".jpg");
os.write(data);
os.close();
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Для этого приложению требуются два разрешения в манифесте:",
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
// <uses-permission android:name="android.permission.CAMERA" />
// <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Данный подход полностью устарел в современном Android. Начиная с Android 10 (API 29), Google ввёл Scoped Storage — модель, при которой каждое приложение работает в своём изолированном пространстве. Даже при наличии разрешения на запись во внешнее хранилище, приложение не может напрямую обращаться к произвольным путям вроде /sdcard/. Вместо этого вы должны использовать либо частный каталог приложения (getExternalFilesDir()), либо системные медиаколлекции через MediaStore."
                "\nScoped Storage был внедрён для защиты приватности пользователей: раньше любое приложение с WRITE_EXTERNAL_STORAGE могло читать все фотографии, документы и другие файлы на устройстве. Теперь же, чтобы сохранить изображение в общую галерею, вы создаёте запись через ContentResolver и MediaStore.Images.Media.EXTERNAL_CONTENT_URI, и система сама определяет, куда поместить файл."
                "\nЕсли вы пишете приложение, совместимое с Android 10+, использование прямых путей (/sdcard/...) недопустимо. В рамках учебного проекта это можно временно обойти флагом requestLegacyExternalStorage, но в продакшене такой подход приведёт к отклонению приложения в Google Play."
                "\nХотя API Camera устарел (в новых версиях Android рекомендуется использовать Camera2), он остаётся отличным учебным инструментом для понимания принципов работы с аппаратными ресурсами.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Воспроизведение аудио и видео: MediaPlayer и асинхронная подготовка',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Для воспроизведения мультимедиа Android предоставляет класс MediaPlayer - универсальный инструмент для работы с аудио и видео из локальных файлов, ресурсов или сети."
                "Его поведение строго детерминировано машиной состояний: при создании он находится в состоянии Idle, затем переходит в Initialized после setDataSource(), дальше — в Prepared после prepare() или prepareAsync(), и только после этого можно вызывать start(). Неправильная последовательность вызовов приводит к исключениям и нестабильности."
                "\nКлючевая ошибка новичков — игнорирование связи MediaPlayer с жизненным циклом Activity. Если не вызвать release() в onDestroy() (или лучше — в onStop()), объект MediaPlayer продолжит удерживать системные ресурсы даже после закрытия экрана. Это классический источник утечек памяти и непредвиденного поведения."
                "\nВ современной разработке MediaPlayer всё чаще заменяют на ExoPlayer — библиотеку от Google, которая предлагает гораздо больше возможностей: поддержка DASH, HLS, SmoothStreaming, кастомные аудио/видео декодеры, расширенная аналитика, гибкая обработка ошибок и полную интеграцию с архитектурными компонентами через Media3. "
                "\nExoPlayer особенно выгоден для сложных кейсов: стриминга, адаптивного качества, обработки метаданных. Однако для простого локального воспроизведения, как в учебной работе, MediaPlayer остаётся допустимым выбором."
                "\nАсинхронная подготовка через prepareAsync() критически важна при работе с сетевыми потоками или большими файлами: синхронный prepare() заблокирует UI-поток, вызывая 'заморозку' интерфейса, что нарушает Experience Guidelines от Google.",
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
mediaPlayer.setOnPreparedListener(mp -> mp.start());
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Галерея: динамическая загрузка изображений',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "GalleryActivity демонстрирует работу с файловой системой и динамическим отображением контента. Ключевой момент — поиск изображений при каждом входе в активность (в onResume()), что гарантирует актуальность списка после возврата из CameraActivity."
                "Поиск файлов реализован рекурсивно: ",
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
private ArrayList<String> searchImage(File dir) {
    ArrayList<String> imagesFinded = new ArrayList<>();
    for (File f : dir.listFiles()) {
        if (!f.isDirectory()) {
            String ext = getFileExt(f.getAbsolutePath());
            if (ext.equals("jpg") || ext.equals("png") || ext.equals("jpeg")) {
                imagesFinded.add(f.getAbsolutePath());
            }
        }
    }
    return imagesFinded;
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
            "Отображение происходит через ImageView.setImageURI()"
                "\nХотя этот метод устарел в современных версиях Android (из-за проблем с безопасностью и производительностью), в учебных целях он остаётся простым и рабочим."
                "Навигация по изображениям реализована через инкремент/декремент индекса:",
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
public void onNext(View v) {
    if (currentImage + 1 < images.size()) {
        currentImage++;
        updatePhoto(Uri.parse(images.get(currentImage)));
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
            "assets/images/galleryActivity.png",
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