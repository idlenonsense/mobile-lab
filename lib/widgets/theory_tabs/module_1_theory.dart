import 'package:flutter/material.dart';

class Module1Theory extends StatelessWidget {
  const Module1Theory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABT Bundle и создание проекта',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "ADT Bundle — сборник инструментов и компонентов для разработки приложений под Android. Он включает в себя основные компоненты Android SDK и версию Eclipse IDE со встроенным ADT (Android Developer Tools). Чтобы создать проект, зайдите в меню File->New->Android Application Project. В появившемся окне обязательно нужно прописать имя приложения, имя проекта, а также имя пакета (package). Лучше не оставлять его именем example, т.к. пакет с таким именем нельзя разместить в Google Play.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "Чтобы создать проект, зайдите в меню File->New->Android Application Project. В появившемся окне обязательно нужно прописать имя приложения, имя проекта, а также имя пакета (package). Лучше не оставлять его именем example, т.к. пакет с таким именем нельзя разместить в Google Play.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "Minimum Required SDK - минимальная версия Android, которую будет поддерживать приложение. Чаще всего по умолчанию указывается версия 2.2, чтобы поддерживать как можно больше устройств. Если определенная функция вашего приложения работает только на более новых версиях Android, и это не является критическим для основного набора функций приложения, вы можете включить ее в качестве опции на версиях, которые поддерживают его.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "Target SDK - версия Android, под которую будет написано ваше приложение; определяет максимальную версию Android, на которой вы тестировали приложение. Это нужно для режимов совместимости.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "Compile With определяет, возможности какой версии Android будет использовать приложение.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Структура Android-проекта',
            style: Theme.of(context).textTheme.titleMedium,
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
src — исходный код на Java
res — ресурсы приложения
res/layout — XML-разметка интерфейса
res/values — строки, цвета, стили (strings.xml)
gen — автогенерируемые файлы (в т.ч. R.java)
AndroidManifest.xml — описание компонентов, разрешений, метаданных приложения
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Понятие Activity и его жизненный цикл',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Activity — это основная часть любого Android приложения, с которой взаимодействует пользователь. То есть, это сам интерфейс или экран, на котором происходит взаимодействие в определенном состоянии. В Activity располагаются всевозможные элементы: кнопки, фрагменты, изображения и другие элементы View. View – это визуальный интерфейс приложения в том или ином статусе, с которым взаимодействует пользователь.. Одной из особенностью активностей является её жизненный цикл.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "Activity берет начало в момент старта приложения. Система дает такому приложению высокий приоритет. Дальнейшее состояние activity помогает понять, что с ним делать, в какой момент освободить ресурсы, связанные с ним, и так далее. Эта приоритезации позволяет, например, в некоторых случаях не блокировать входящие звонки.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "Когда activity переходит из одного состояния в другое, система Android делает вызов методов (callback) обратного жизненного цикла activity, и параллельно генерирует уведомление о конкретной стадии после каждого действия.",
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
// Например
OnCreate(). Вызывается при создании activity. В нем появляется интерфейс, код самого макета, кнопки и другие функциональные элементы формы.

OnStart(). Вызывается при появлении activity на экране.

OnResume(). Activity на экране, с ним можно взаимодействовать, оно в фокусе.

OnPause(). Само приложение activity находится в состоянии паузы, не в фокусе. С ним нельзя взаимодействовать, но частично можно видеть на экране. Например, в виде диалогового окна, под другим activity. 

OnStop(). В этом методе activity переходит в состояние Stopped, то есть полностью невидима. В методе onStop следует освобождать используемые ресурсы, которые не нужны пользователю, когда он не взаимодействует с activity. При этом в памяти устройства остаются все элементы интерфейса, с которыми в дальнейшем можно взаимодействовать. Например, в случае, если в поле приложения был введен текст в момент когда activity было в статусе OnResume(), а затем активити было переведено в статус OnStop() и обратно в OnResume(), введенный текст сохранится. 

onDestroy(). Завершение работы activity происходит посредством вызова метода onDestroy, который возникает или при вызове finish(), или если система решит убить activity в силу конфигурационных причин (например, поворот экрана или при многооконном режиме).
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/activityImage.png",
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
            'Создание эмулятора в ABT Bundle',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Чтобы создать виртуальное устройство, нажмите кнопку New. Появится окно создания. Вам нужно назвать устройство и выбрать обязательные характеристики: Device - модель вашего устройства, и Target - версия Android. Также можно изменять дополнительные параметры: размер sd-карты, встроенной памяти и т.п. "
                "\n   Теперь можно запускать приложение. Для этого нужно нажать на кнопку Run (белый треугольник в зеленом кружке) на панели инструментов. Проблемы с запуском можно отследить в консоли. "
                "\n   Если приложение не запускается, попробуйте нажать на черный треугольник справа от кнопки Run, выбрать Run Configurations, затем во вкладке Target выбрать созданное устройство и запустить проект снова.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/emulatorImage.png",
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
            'AndroidManifest.xml и его структура',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "AndroidManifest.xml - файл в формате xml, который описывает основные свойства проекта, разрешение на использование ресурсов устройства и др. "
                "\n Первый обязательный элемент <manifest> является корневым элементом файла, должен содержать обязательный элемент <application> и все остальные элементы по необходимости",
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
// Атрибуты элемента <manifest>
xmlns:android - определяет пространство имен Android, всегда должен иметь значение: "http://schemas.android.com/apk/res/android". Обязательный атрибут.

package - полное имя пакета, в котором располагается приложение. Обязательный атрибут. Имя должно быть уникальным, может содержать заглавные и строчные латинские буквы, числа и символ подчеркивания. Однако начинаться должно только с буквы. Для избежания конфликтов с другими разработчиками рекомендуется использовать имя вашего сайта (если он есть) записанное в обратном порядке. Если вы опубликовали свое приложение, вы не можете менять имя пакета, т.к. имя пакета служит уникальным идентификатором для приложения и в случае его смены приложение будет рассматриваться, как совсем другое и пользователи предыдущей версии не смогут его обновить.

android:versionCode - внутренний номер версии приложения не виден пользователю. Этот номер используется только для определения является ли одна версия более современной по сравнению с другой, больший номер показывает более позднюю версию.

android:versionNumber- номер версии, является строкой и используется только для того, чтобы показать пользователю номер версии приложения.
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
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
// Атрибуты элемента <uses-sdk>
android:minSdkVersion - указывает значение минимального уровня API, необходимого для работы приложения. Система Android не позволит установить приложение, если уровень API ниже, чем уровень, указанный в этом атрибуте. Внимание: если этот атрибут не указан, система установит значение по умолчанию равным "1", которое означает, что приложение совместимо со всеми версиями Android. И в случае, если приложение не совместимо со всеми версиями, установка пройдет на любую версию Android, а во время работы приложение сломается, когда попытается обратиться к недоступным элементам API. Поэтому необходимо всегда указывать значение этого атрибута.

android:targetSdkVersion - указывает уровень API целевой платформы Android приложения, если этот атрибут пропущен, по умолчанию принимается значение android:minSdkVersion.

android:maxSdkVersion - указывает максимальное значение уровня API, под который разрабатывалось приложение. Если значение этого атрибута ниже, чем уровень API соответствующий версии Android, на которую устанавливается приложение, то система не позволит установить такое приложение.
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
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
// Атрибуты элемента <application>
android:allowBackup- определяет разрешение для приложения участвовать в резервном копировании и восстановлении. Если значение этого атрибута false, то для приложения никогда не может быть создана резервная копия, даже если проводится резервное копирование всей системы целиком. По умолчанию значение этого атрибута равно true.

android:icon - определяет иконку для приложения целиком, а также иконку по умолчанию для компонентов приложения, которая может быть переопределена атрибутом android:icon каждого компонента. Задается как ссылка на графический ресурс, содержащий изображение.

android:label - определяет видимый для пользователя заголовок приложения целиком, а также заголовок по умолчанию для компонентов приложения, который может быть переопределен атрибутом android:label каждого компонента. Задается как ссылка на строковый ресурс".

android:theme - определяет тему по умолчанию для всех активностей приложения, может быть переопределен атрибутом android:theme каждой активности. Задается как ссылка на стилевой ресурс.".
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
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
// Атрибуты элемента <activity>
android:name - определяет имя класса, который задает активность. Значение атрибута должно полностью определять имя класса с указанием пакета, в котором располагается класс. Можно использовать сокращенную запись ".MainActivity", в этом случае добавляется имя пакета, определенное соответствующим атрибутом элемента <manifest>.

android:configChanges- перечисляет изменения конфигурации, которыми может управлять активность. Если конфигурация меняется во время работы, то по умолчанию активность останавливается и перезапускается. Если же изменение конфигурации указано в этом атрибуте, то при появлении этого изменения активность не перезапускается, вместо этого она продолжает работать и вызывает метод onConfigurationChanged().

android:label - определяет видимый пользователю заголовок активности, если он отличается от общего заголовка приложения. Задается как ссылка на строковый ресурс.

android:theme - определяет тему активности, если она отличается от общей темы приложения, заданной соответствующим атрибутом элемента <application>. Задается как ссылка на стилевой ресурс..
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
          ),
        ],
      ),
    );
  }
}