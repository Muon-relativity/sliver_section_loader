# 🚀 Sliver Lazy Load Flutter Example

A lightweight and flexible Flutter project that demonstrates how to lazily load multiple Sliver sections as you scroll. Ideal for content-heavy, performance-optimized apps.

---

## ✨ Features

* 🔁 **Auto-loading Sliver sections** triggered by scroll position
* 🧩 **Mixed content support**: `PageView`, `ListView`, `Carousel`, `Image`, and custom widgets
* ✨ **Shimmer loading effect** for network images
* 🎬 **Animated transitions** (Fade, Slide) per section

---

## 📁 Project Structure

```
lib/
├── main.dart
├── pages/
│   └── sliver_lazy_load_page.dart
├── widgets/
│   ├── auto_sliver_section_loader.dart
│   ├── section_loader.dart
│   └── section/
│       ├── section_item.dart
│       ├── section_item_builder.dart
│       ├── section_animated_wrapper.dart
├── controllers/
│   └── auto_section_loader_controller.dart
```

---

## ▶️ How to Run

```bash
git clone <your-repo-url>
cd <project-folder>
flutter pub get
flutter run
```

---

## 🔧 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  shimmer: ^2.0.0
```

---

## 👨‍💻 Author

**이해준**
Mobile App Developer (Flutter / iOS / Android)
GitHub: [@Muon-github](https://github.com/Muon-relativity

---

## 📄 License

This project is licensed under the MIT License.
