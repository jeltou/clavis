# Fores 🔑

**Fores**  is a modular architecture library for Flutter that elegantly combines communication, routing, and configuration in larger projects.

## ✨ Features

- **Config**  
  Load and manage app configurations centrally via YAML files.

- **CBloc**  
  Extension of [flutter_bloc] where blocs can directly communicate with each other via **Conexus**.

- **Conexus**  
  Lightweight **pub/sub** mechanism for message exchange between modules.

- **Router**  
  Integrated router for structured navigation.

- **ScreenUtil Init**  
  Simple initialization of [flutter_screenutil] for responsive UI.

---

## 📦 Installation

Add **fores** to your `pubspec.yaml`:

```yaml
dependencies:
  fores: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Quick Start


```dart
import 'package:fores/fores.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, Widget> routes = {"/": const Home()}; // Home is the init route

  @override
  Widget build(BuildContext context) {
    return MaterialforesApp(routes: routes, designSize: const Size(360, 690));
  }
}
```

### Example: Cbloc

```dart

class ExampleBoc extends CBloc<ExampleEvent, ExampleState> {

  // Define here which topics should be subscribed to.
  ExampleBoc () : super(ExampleInitial(), subscribedTopics: ["topic1","topic2", ]) {
    on<ExampleEvent>((event, emit) {});
  }

  void test()  {
    arca.send(JsonNuntius(topic: "topic1", data: {"hello": "world"}));
  }


  // overide this Function to handle publisched messages
  @override
  Future<void> handleArca(ArcaEvent event, Emitter emit) async {
    print(event.nuntius.topic);
    if (event.nuntius is JsonNuntius) {
      print((event.nuntius as JsonNuntius).data);
      return;
    }
  }
}

```


### Example: CBloc Communication

```dart
class SessionBloc extends CBloc<SessionEvent, SessionState> {

  SessionBloc() : super(SessionInitial(), subscribedTopics: []) {
    on<SessionEvent>((event, emit) {});
    on<InitSessionEvent>(_initSession);
  }

  Future<void> _initSession(InitSessionEvent event, Emitter emit) async {
    arca.send(PushNamedRouteNavigationNuntius(route: "/"));
  }
}

```

---

### Example: Config
The config is searched for in assets/config/*.yaml

```dart
// .yaml
// app:
//   api:
//     url: www.example.com

final config = Config();
final apiUrl = await config.getValueByPath('app/api/url');
```

---

### Example: Router
The / route must be overwritten; this is addressed after initialization.

```dart
class _MyAppState extends State<MyApp> {
  Map<String, Widget> routes = {"/": const Home(), "/page1": const Page1(), "/page2": const Page2()};

  @override
  Widget build(BuildContext context) {
    return MaterialforesApp(routes: routes, designSize: const Size(360, 690));
  }
}


// You can now navigate via conexus
getDistribuo().send(PushNamedRouteNavigationNuntius(route: "/page1")

// in the Cbloc
arca.send(PushNamedRouteNavigationNuntius(route: "/page1")

//or via bloc.
context.read<NavigationBloc>().add(NavigationPushNamed("/page2"))

//or nativ
Navigator.pushNamed(context, '/second')

```

---

## 📚 Used Libraries

fores uses the following libraries and must mention them in documentation:

- [flutter_bloc: ^9.1.0](https://pub.dev/packages/flutter_bloc) – State Management
- [flutter_screenutil: ^5.9.3](https://pub.dev/packages/flutter_screenutil) – Responsive Layout
- [yaml: ^3.1.2](https://pub.dev/packages/yaml) – YAML Parsing

---

## 📜 License

This project is licensed under the **MIT License**.  
Please also note the licenses of the used libraries:

- **flutter_bloc** – MIT License
- **flutter_screenutil** – Apache-2.0
- **yaml** – MIT License

See the `LICENSE` file for details.

---

[flutter_bloc]: https://pub.dev/packages/flutter_bloc
[flutter_screenutil]: https://pub.dev/packages/flutter_screenutil

