import 'package:fores/fores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // configuration file are searched in assets/config/
  final config = Config();

  // Example: Accessing a nested value in config/app.yaml
  final apiUrl = await config.getValueByPath('app/api/url');
  dPrint(apiUrl);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, Widget> routes = {"/": const Home(), "/page1": const Page1(), "/page2": const Page2()};

  @override
  Widget build(BuildContext context) {
    return MaterialForesApp(routes: routes, designSize: const Size(360, 690));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), automaticallyImplyLeading: false),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => getDistribuo().send(PushNamedRouteNavigationNuntius(route: "/page1")), // route with pop sub (conexus)
            child: Text("Page1"),
          ),
          ElevatedButton(onPressed: () => context.read<NavigationBloc>().add(NavigationPushNamed("/page2")), child: Text("Page1")), // route with bloc
          ElevatedButton(
            onPressed: () => getDistribuo().send(ShowSnackBarNotifcationNuntius(message: "Hello")),
            child: Text("Show Snackbar"),
          ),
          ElevatedButton(
            onPressed: () => getDistribuo().send(ShowDialogNotifcationNuntius(title: "Title", message: "Hello")),
            child: Text("Show Dialog"),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), automaticallyImplyLeading: false),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => getDistribuo().send(PopRouteNavigationNuntius()), // route with pop sub
            child: Text("Back"),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), automaticallyImplyLeading: false),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(), // nativ
            child: Text("Back"),
          ),
        ],
      ),
    );
  }
}
