import 'package:flutter/material.dart';

class Module4Theory extends StatelessWidget {
  const Module4Theory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "В отличие от настольных систем, где основными инструментами были мышь и клавиатура, мобильные устройства опираются на жесты — интуитивные действия пальцами: касание, смахивание, двойной тап, долгое нажатие и др."
                "\nКорректная и отзывчивая обработка жестов — ключ к хорошему пользовательскому опыту. При этом Android не только позволяет распознавать базовые жесты, но и предоставляет разработчикам унифицированный API для этой задачи.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Архитектура распознавания жестов в Android',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "В Android распознавание жестов централизовано вокруг одного класса — GestureDetector (и его совместимой версии GestureDetectorCompat из библиотеки поддержки). Этот класс выступает как «диспетчер», принимающий «сырые» события касания (MotionEvent) и преобразующий их в логические жесты."
                "\nЭтот класс получает события движения, соответствующие определённому набору жестов пользователя, таких как нажатия вниз и вверх, вертикальные и горизонтальные прокрутки, длинные и короткие нажатия, двойные нажатия и скроллинг. Для более сложных жестов, например масштабирования, в Android есть класс ScaleGestureDetector, который поддерживает взаимодействие с элементами пользовательского интерфейса с помощью жестов и масштабирования. "
                "\nЧтобы использовать GestureDetector, нужно создать собственный класс, который будет обрабатывать события жестов в приложении. Этот класс должен расширять androidx.core.view.GestureDetectorCompat и переопределять соответствующие методы для нужных жестов.",
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
GestureDetector.OnGestureListener — интерфейс для обработки основных жестов:

  onDown(MotionEvent e) — начало касания;

  onShowPress(MotionEvent e) — касание без движения (предварительная стадия);

  onSingleTapUp(MotionEvent e) — завершение одиночного касания;

  onLongPress(MotionEvent e) — долгое удержание (обычно >500 мс);

  onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) — прокрутка («перетаскивание»);

  onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) — быстрое смахивание.

GestureDetector.OnDoubleTapListener — интерфейс для обработки жестов с двойным касанием:

  onDoubleTap(MotionEvent e) — двойной тап распознан;

  onDoubleTapEvent(MotionEvent e) — все события в рамках двойного тапа;

  onSingleTapConfirmed(MotionEvent e) — одиночный тап, подтверждённый (то есть не является первой частью двойного тапа).
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Этот класс можно реализовать двумя способами - полностью либо частично. В первом варианте Activity сама реализует оба интерфейса — OnGestureListener и OnDoubleTapListener. Это оправдано, если приложение должно реагировать на все типы жестов."
                "\nБолее гибкий и современный подход - создание внутреннего класса, унаследованного от SimpleOnGestureListener. Этот класс реализует оба интерфейса, возвращает false во всех методах по умолчанию и позволяет переопределять только нужные методы.",
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
// Полная реализация
GestureDetectorCompat mDetector = new GestureDetectorCompat(this, this);
mDetector.setOnDoubleTapListener(this);

// Частичная реализация
class MyGestureListener extends GestureDetector.SimpleOnGestureListener {
    @Override
    public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
        // Обработка смахивания
        return true;
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
          Text(
            "Чтобы GestureDetector получал события, необходимо перехватывать касания на уровне Activity и передавать их детектору:",
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
@Override
public boolean onTouchEvent(MotionEvent event) {
    mDetector.onTouchEvent(event);
    return super.onTouchEvent(event);
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
            'Пользовательские жесты в Android',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Стандартные жесты — такие как тап, смахивание, двойной клик — охватывают большинство сценариев взаимодействия. Однако в некоторых приложениях требуется более выразительный и уникальный ввод: например, цифровая подпись, рисование символов, жестовое управление (как в старых версиях Android — буква «С» для запуска камеры) или игровой контроллер на основе рисуемых жестов.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Создание жестов с помощью Gesture Builder',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Gesture Builder — это вспомогательное приложение, поставляемое с Android SDK. Оно предустановлено на эмуляторах и позволяет: "
                "\n- рисовать жесты пальцем,"
                "\n- присваивать им имена (например, '1', 'stop', 'heart') "
                "\n- сохранять в файл gestures на SD-карте эмулятора."
                "\nДля повышения точности распознавания рекомендуется сохранять 3–5 вариантов одного и того же жеста с разным наклоном, скоростью и размером."
                "\n\nСамый простой способ импортировать жесты в проект заключается использовании вкладки File Explorer в компоновке (perspective) DDMS. (Если компоновки DDMS нет найти ее можно следующим образом: Window->Open Perspective->Other...->DDMS. Если вкладки File Explorer нет, можно добавить: Window-> Show View-> File Explorer). На вкладке File Explorer найти директорию sdcard/"
                "\nЧтобы скопировать файл жестов с эмулятора в проект, необходимо выбрать его и нажать кнопку «Pull a file from the device». Откроется диалог с предложением выбрать папку, в которую необходимо скопировать жесты, здесь надо найти папку проекта, в ней папку res/raw/ (если папки raw/ нет, ее необходимо создать) и нажать кнопку Сохранить. Для использования созданных жестов в приложении и их распознавания необходимо добавить элемент GestureOverlayView в XML файл активности.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}