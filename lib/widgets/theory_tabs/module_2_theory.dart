import 'package:flutter/material.dart';

class Module2Theory extends StatelessWidget {
  const Module2Theory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Контейнеры разметки (Layouts) в Android',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "RelativeLayout — тип верстки при котором позиционирование элементов происходит относительно друг друга и относительно главного контейнера. За то, каким образом будут позиционироваться элементы отвечают следующие атрибуты:"
                "\n\nАтрибуты позиционирования относительно контейнера"
                "\nandroid:layout_alignParentBottom – Низ элемента находится внизу контейнера"
                "\nandroid:layout_alignParentLeft – Левая часть элемента прилегает к левой части контейнера"
                "\nandroid:layout_alignParentRight – Правая часть элемента прилегает к правой части контейнера"
                "\nandroid:layout_alignParentTop – Элемент находится в верхней части контейнера"
                "\nandroid:layout_centerHorizontal – Элемент позиционируется по центру относительно горизонтального размера контейнера"
                "\nandroid:layout_centerInParent – Элемент позиционируется по центру относительно горизонтального и вертикального размеров размера контейнера"
                "\nandroid:layout_centerVertical – Элемент позиционируется по центру относительно вертикального размера контейнера"
                "\n\nАтрибуты позиционирования относительно других элементов. В качестве значений этих атрибутов ставятся id элемента относительно которого будет производится позиционирование."
                "\nandroid:layout_above – Распологает элемент над указанным"
                "\nandroid:layout_below – Распологает элемент под указанным"
                "\nandroid:layout_toLeftOf – Распологает элемент слева от указанного"
                "\nandroid:layout_toRightOf – Распологает элемент справа от указанного"
                "\n\nВыравнивание относительно других элементов."
                "\nandroid:layout_alignBaseline – Выравнивает baseline элемента с baseline указаннго элемента"
                "\nandroid:layout_alignBottom – Выравнивает низ элемента по низу указанного элемента"
                "\nandroid:layout_alignLeft – Выравнивает левый край элемента с левым краем указанного элемента"
                "\nandroid:layout_alignRight – Выравнивает правый край элемента с правым краем указанного элемента"
                "\nandroid:layout_alignTop – Выравнивает верхнюю часть элемента в соответствие с верхней частью указанного элемента",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/relativeLayout.png",
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
            "\nLinearLayout — тип верстки при котором область верстки делится на строки и в каждую строку помещается один элемент. Разбиение может быть вертикальное или горизонтальное, тип разбиения указывается в атрибуте LinearLayout android:orientation. Внутри верстки возможно комбинировать вертикальную и горизонтальную разбивки, а кроме того, возможна комбинация нескольких разных типов верстки например использование LinearLayout внутри FrameLayout.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/linearLayout.png",
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
            "\nFrameLayout — тип верстки внутри которого может отображаться только один элемент в строке. Т.е. если внутри FrameLayout вы поместите несколько элементов, то следующий будет отображаться поверх предыдущего.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/frameLayout.png",
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
            'Основные UI-компоненты',
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
// TextView используется для отображения текста на экране. Его можно использовать как для статического текста, так и для динамически обновляемого текста
val textView: TextView = findViewById(R.id.textView)
textView.text = "Привет"

// Button используется для создания интерактивной кнопки. Вы можете настроить кнопку для выполнения действий при её нажатии.
val button: Button = findViewById(R.id.button)
button.setOnClickListener {
    // Действие при нажатии
}

// ImageView используется для отображения изображений на экране.
val imageView: ImageView = findViewById(R.id.imageView)
imageView.setImageResource(R.drawable.my_image)

// EditText используется для получения пользовательского ввода текста. Он позволяет пользователям вводить и редактировать текст.
val editText: EditText = findViewById(R.id.editText)
val userInput: String = editText.text.toString()

// Макеты используются для упорядочивания элементов пользовательского интерфейса. Распространенные макеты включают LinearLayout и RelativeLayout. Их описание представлено выше
<LinearLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:orientation="vertical">

    <!-- Дочерние элементы распологаются здесь -->

</LinearLayout>

// ListView используется для отображения прокручиваемого списка элементов. Он был в значительной степени заменен RecyclerView, но вы все еще можете встретить его в старых кодовых базах.
val listView: ListView = findViewById(R.id.listView)
listView.adapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, listOf("Item 1", "Item 2"))


// RecyclerView - это более гибкий и эффективный способ отображения списков элементов. Он широко используется в современных разработках для Android.
val recyclerView: RecyclerView = findViewById(R.id.recyclerView)
recyclerView.adapter = MyAdapter(data)
recyclerView.layoutManager = LinearLayoutManager(this)

// SnackBar - это легкий компонент обратной связи, который обычно используется для отображения краткого сообщения в нижней части экрана.
val snackbar = Snackbar.make(view, "Message to display", Snackbar.LENGTH_SHORT)
snackbar.show()
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Работа с ресурсами на примере strings.xml',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "strings.xml — файл в Android-разработке, который определяет строковые ресурсы — тексты, которые используются в приложении. Например, название приложения, текст кнопок, ярлыков."
                "\n Он необходим для замены захардкоженных строк — вместо этого строки, определённые в файле будут доступны по всему приложению. Так же использование файлов ресурсов упрощают локализацию — файл помогает создавать ресурсы для разных языков, при этом ссылки на строки автоматически конвертируются в нужный язык."
                "\nФайл strings.xml находится в проекте в папке res/values. Каждый ресурс определяется с помощью элемента <string>. Атрибут name содержит название ресурса.",
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
// <resources>  
// <string name="app_name">Интерактивный учебник</string>  
// <string name="welcome_message">Это пример кода!</string>  
// <string name="button_text">Нажать</string>  
// </resources>  
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Файл strings.xml позволяет создавать ресурсы для разных языков. Для каждого дополнительного языка создаётся отдельный каталог с постфиксом-локалью, например, values-ru/ для русского языка, values-fr/ для французского языка."
                "\nОсобенности:"
                "\n- Каждый файл strings.xml содержит пары «ключ-значение» — ключи (идентификаторы) должны быть одинаковыми для всех языков, а значения — переведёнными строками."
                "\n- При запуске приложения выбирается та локализация, которая соответствует системному языку устройства. Например, если текущий язык — русский, будет выбираться локализация ресурсов из файла strings-ru.xml.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Фон и визуальное оформление',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Чтобы изменить цвет фона на чёрный, нужно в XML-коде главной активности написать одну строку в блоке <RelativeLayout> элемента: 'android:background='#000000'' после этого цвет фона изменится на чёрный."
                "\nДля того, чтобы на фон установить собственный рисунок нужно сначала в папке res/ создать папку drawable/, после чего поместить в эту папку изображение. После этого в папке drawable/ нужно создать файл background.xml, важно при создании выбрать параметр bitmap. Как только новый файл открылся, пропишем в него одну строчку,"
                "с указанием на то, откуда и какой файл использовать. Вернемся в редактор XML-кода, туда, где прописывали цвет фона. Вместо строки android:background='#000000' напишем ссылку на XML-файл android:background='@drawable/background'. Сохраняем и видим результат – новый фон."
                "В background.xml также можно установить android:tileMode='repeat', чтобы вместо растянутого изображения использовалось его посторение, эдакая черепичная заливка",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/blackBackground.png",
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
            'Доступность',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Атрибут android:contentDescription в Android — это метка контента для элементов интерфейса, которые передают информацию в графическом виде (ImageView, ImageButton, CheckBox и др.). Цель — помочь пользователям с ограниченными возможностями распознавать элементы с помощью сервисов специальных возможностей, например программ чтения с экрана."
                "\nМетки контента кратко и понятно описывают назначение элемента или связанное с ним действие. Без них некоторым пользователям будет сложно определять назначение элементов интерфейса и взаимодействовать с ними."
                "\nЗначение атрибута android:contentDescription зачитывается вслух, если пользователь активировал инструменты для воспроизведения текста в настройках специальных возможностей."
                "\nВ некоторых случаях метки контента не требуются — например, если элемент не передаёт информацию в графическом виде или выполняет декоративную функцию. В этом случае для атрибута android:contentDescription задаётся значение @null",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}