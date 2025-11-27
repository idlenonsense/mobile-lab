import 'package:flutter/material.dart';

class Module3Theory extends StatelessWidget {
  const Module3Theory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Переход между экранами: Activity и Intent',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Activity — это компонент Android, представляющий один экран с пользовательским интерфейсом. Каждое окно вашего приложения — это отдельная Activity (или их комбинация). По умолчанию, Activity не знает о существовании других Activity, и общение между ними осуществляется через механизм Intent."
                "\nIntent (намерение) — это объект-сообщение, который запрашивает действие у другого компонента системы. Он может использоваться для:"
                "\n- Запуска другой Activity внутри приложения;"
                "\n- Открытия веб-страницы в браузере;"
                "\n- Отправки email;"
                "\n- Запуска фоновой службы."
                "\n\nСуществует два типа Intent:"
                "\n- Явные (explicit) — указывают конкретный компонент (например, класс SettingsActivity);"
                "\n- Неявные (implicit) — описывают желаемое действие (например, «открыть карту»), а система выбирает подходящее приложение."
                "\nДля перехода между экранами внутри одного приложения используются явные Intent:",
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
Intent intent = new Intent(MainActivity.this, DetailActivity.class);
startActivity(intent);
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Важно: каждая Activity обязательно должна быть зарегистрирована в файле AndroidManifest.xml, иначе система не сможет её найти и выбросит ActivityNotFoundException."
                "\n\nЯвный intent указывает идентификатор конкретного компонента, который нужно запустить — чаще всего это используется, чтобы запустить из одной activity другую внутри одного приложения (при этом intent может даже не содержать другой полезной информации)."
                "\nНеявный intent обязательно должен указывать действие, которое нужно сделать. Каждая activity (и другие компоненты) указывают в манифесте приложения, какие intent’ы они готовы обрабатывать (например, ACTION_VIEW для ссылок с доменом https://example.com). Система выбирает подходящий компонент среди установленных и запускает его."
                "\nЕсли в системе есть несколько activity, которые готовы обработать intent, пользователю будет предоставлен выбор. Обычно это случается, когда установлено несколько аналогичных приложений, например несколько браузеров или фоторедакторов. Кроме того, приложение может явно попросить систему показать диалог выбора (на самом деле при этом переданный intent оборачивается в новый intent с ACTION_CHOOSER) — это обычно используется для создания красивого диалога Share",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/intentImage.png",
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
            'ListActivity: упрощённая работа со списками',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Класс ListActivity — это специализированная Activity, предназначенная для отображения списков. Она автоматически создаёт ListView и предоставляет удобные методы вроде setListAdapter() и getListView()."
                "\nПри использовании ListActivity не требуется создавать XML-разметку вручную, если вам подходит стандартный вид списка. Однако если вы хотите кастомизировать интерфейс (добавить кнопку сверху, фон и т.д.), лучше использовать обычную Activity и вручную добавлять ListView."
                "\nАдаптер связывает данные и UI. Для простых текстовых списков часто используется ArrayAdapter с системным макетом",
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
ArrayAdapter<String> adapter = new ArrayAdapter<>(
    this,
    android.R.layout.simple_list_item_1,
    items
);
setListAdapter(adapter);
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Здесь android.R.layout.simple_list_item_1 — это встроенный в Android XML-макет, содержащий один TextView. Он идеален для быстрого прототипирования"
                "\n\nListView берет содержимое для отображения через адаптер. Адаптер расширяется классом BaseAdapter и отвечает за модель данных для списка и за расположение этих данных в его элементах."
                "\nВ Андроиде есть два стандартных адаптера: ArrayAdapter и CursorAdapter. ArrayAdapter управляет данными, основанными на массивах или списках, в то время, как SimpleCursorAdapter управляет содержимым из базы данных. Так же вы можете разработать свой Адаптер, расширяющий эти два класса или же класс BaseAdapter."
                "\nСамый важный метод Адаптера — getView(). Он вызывается для каждого элемента списка, чтобы определить как и какие данные должны в нем отображаться. getVew() так же содержит параметр convertView, который позволяет использовать заново уже существующий элемент списка, который уже не отображается, т.к. пользователь пролистнул его с видимой части дисплея. Если convertView не пустой, он может быть использован заново, чтобы не грузить шаблон, что приводит к значительному приросту производительности, т.к. подгрузка XML файла достаточно ресурсоемка."
                "\nОтображение большого количества данных на мобильном устройстве должно быть реализовано максимально эффективно. Поэтому ListView создает виды (виджеты) по необходимости и подкрепляет их к иерархии видов. Стандартный Адаптер ListView удаляет виды, например, если элемент больше не отображается, он будет стерт и только его содержимое поменяется. Если вы используете свой адаптер, то вы должны так же предусмотреть это, чтобы избежать проблем с производительностью.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Обратная связь и взаимодействие',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Для создания простых уведомлений в Android используется класс Toast. Фактически Toast представляет всплывающее окно с некоторым текстом, которое отображается в течение некоторого времени."
                "Объект Toast нельзя создать в коде разметки xml, например, в файл activity_main.xml. Toast можно использовать только в коде java."
                "\nВ обработчике отображается всплывающее окно. Для его создания применяется метод Toast.makeText(), в который передается три параметра: текущий контекст (текущий объект activity), отображаемый текст и время отобажения окна."
                "В качестве времени показа окна мы можем использовать целочисленное значение - колическо миллисекунд или встроенные константы Toast.LENGTH_LONG (3500 миллисекунд) и Toast.LENGTH_SHORT (2000 миллисекунд)."
                "Для самого отображения окна вызывается метод show()",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/toastImage.png",
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
            "AlertDialog: это диалоговое окно для различных сообщений приложения, например «Вы хотите купить мое приложение?» или что то в этом роде. AlertDialog поддерживает три кнопки — утвердительную (OK), отрицательную (Cancel) и нейтральную (Later)",
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
AlertDialog.Builder builder = new AlertDialog.Builder(activity);
builder.setTitle(R.string.dialog_about_title);
builder.setMessage(R.string.dialog_about_message);
builder.setCancelable(true);
builder.setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() { // Кнопка ОК
	@Override
	public void onClick(DialogInterface dialog, int which) {
		dialog.dismiss(); // Отпускает диалоговое окно					
	}
});
AlertDialog dialog = builder.create();
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Пример AlertDialog представлен в разделе 'Интерактив'",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Современная навигация: Вкладки и слайдинг',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Fragment — модульная часть activity, у которой свой жизненный цикл и свои обработчики различных событий. Android добавил фрагменты с API 11, для того, чтобы разработчики могли разрабатывать более гибкие пользовательские интерфейсы на больших экранах, таких как экраны планшетов. Через некоторое время была написана библиотека, которая добавляет поддержку фрагментов в более старые версии."
                "\nViewPager — это контейнер, позволяющий «листать» содержимое влево и вправо. В сочетании с TabLayout (из библиотеки Material Design) он создаёт привычный паттерн «вкладки с перелистыванием», как в Google Play или Twitter."
                "\nКаждая вкладка обычно представлена отдельным Fragment. Адаптер (FragmentPagerAdapter или FragmentStatePagerAdapter) отвечает за создание и управление этими фрагментами."
                "\nФрагменты должны быть независимыми и переиспользуемыми, поэтому прямая передача данных через конструктор не рекомендуется. Вместо этого используется Bundle",
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
Bundle args = new Bundle();
args.putInt("section_number", position + 1);
fragment.setArguments(args);
              """,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace', // Для моноширинного шрифта, если доступен
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Внутри Fragment данные извлекаются в onCreate() или onCreateView().",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Image.asset(
            "assets/images/fragmentImage.png",
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