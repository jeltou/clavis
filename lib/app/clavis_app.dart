import 'package:clavis/cbloc/cbloc.dart';
import 'package:clavis/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/navigation/navigation_bloc.dart';
import '../blocs/notification/notification_bloc.dart';
import '../pages/root.dart';
import '../router/router.dart';

class MaterialClavisApp extends StatefulWidget {
  final String? title;
  final Map<String, Widget> routes;
  final Size designSize;
  final CBloc? navigationBloc;
  final CBloc? notificationBloc;
  final CBloc? sessionBloc;
  final List<CBloc>? blocs;

  const MaterialClavisApp({
    super.key,
    required this.routes,
    required this.designSize,
    this.title,
    this.sessionBloc,
    this.navigationBloc,
    this.notificationBloc,
    this.blocs,
  });

  @override
  State<MaterialClavisApp> createState() => _MaterialClavisAppState();
}

class _MaterialClavisAppState extends State<MaterialClavisApp> {
  Map<String, Widget> defaultRoutes = {"@ROOT@": Root(), "/": Home()};
  late final AppRouter appRouter;
  late final CBloc navigationBloc;
  late final CBloc notificationBloc;

  @override
  void initState() {
    super.initState();
    widget.routes.forEach((r, w) => defaultRoutes[r] = w);
    appRouter = AppRouter(defaultRoutes);
    navigationBloc = widget.navigationBloc ?? NavigationBloc();
    navigationBloc = widget.notificationBloc ?? NotificationBloc();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: widget.designSize,
      minTextAdapt: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => navigationBloc),
            BlocProvider(create: (context) => notificationBloc),
            ...?widget.blocs?.map((b) => BlocProvider(create: (context) => b)),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: widget.title,
            onGenerateRoute: appRouter.onGenerateRoute,
            initialRoute: "@ROOT@",
            localizationsDelegates: [DefaultMaterialLocalizations.delegate],
          ),
        );
      },
    );
  }
}
