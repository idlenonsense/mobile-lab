# Интерактивный учебник по мобильной разработке  
**Курсовой проект по дисциплине «Программирование приложений мобильных устройств»**  
Кубанский государственный технологический университет (КубГТУ)

> 📱🎓 Образовательное приложение, охватывающее ключевые темы Android- и кроссплатформенной разработки: архитектура, компоненты, навигация, работа с картами, SQLite, PWA и многое другое.

## 🌐 Демо

Попробуйте учебник прямо в браузере:  
👉 **[https://idlenonsense.github.io/mobile-lab/](https://idlenonsense.github.io/mobile-lab/)**

## 📲 Установка на Android

Скачайте последнюю версию APK:  
📥 [**Скачать APK из Releases**](https://github.com/idlenonsense/mobile-lab/releases)

## 📱 Поддерживаемые платформы

| Платформа | Статус | Комментарий |
|----------|--------|-------------|
| **Android** | ✅ Готово | Установка через APK |
| **Web (PWA)** | ✅ Готово | Работает в любом современном браузере |
| **iOS** | 🚧 Не собрано | Требуется macOS и Xcode |
| **Windows** | 💻 Локальная сборка | `flutter build windows` |

## 🧠 Основные темы

Учебник включает интерактивные разделы по:
- Архитектуре Android (Activity, Fragment, Intent)
- Layout-контейнерам (`LinearLayout`, `RelativeLayout`, `FrameLayout`)
- Работе с картами и GPS
- SQLite и локальному хранению данных
- Визуальным компонентам (`Toast`, `Gallery`, `SurfaceView`)
- HTML5 и современным подходам к мобильной разработке
- PWA и кроссплатформенным технологиям

Каждый раздел сопровождается иллюстрациями и поясняющими схемами.

## 🛠 Технологии

- **Фреймворк**: [Flutter](https://flutter.dev) (язык Dart)
- **Архитектура**: StatefulWidget + навигация через `Navigator`
- **Иконка и метаданные**: настроены через `flutter_launcher_icons`
- **Деплой Web**: GitHub Actions + GitHub Pages
- **Сборка Android**: `flutter build apk --split-per-abi`

## ▶️ Запуск локально

Убедитесь, что установлены [Flutter](https://docs.flutter.dev/get-started/install) и [Git](https://git-scm.com/).

```bash
git clone https://github.com/idlenonsense/mobile-lab.git
cd mobile-lab
flutter pub get
flutter run
