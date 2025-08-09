import 'package:flutter/material.dart';

class AppRouter {
  final Map<String, Widget> routes;

  AppRouter(this.routes);

  Route onGenerateRoute(RouteSettings settings) {
    Widget? page = routes[settings.name];
    if (page != null) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
      );
    }
    return MaterialPageRoute(builder: (_) => const Error404());
  }

  void addRoute(String path, Widget page) {
    routes[path] = page;
  }
}

class Error404 extends StatelessWidget {
  const Error404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Page not found")));
  }
}
