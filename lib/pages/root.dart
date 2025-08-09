import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/navigation/navigation_bloc.dart';
import '../blocs/notification/notification_bloc.dart';
import '../blocs/session/session_bloc.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();
    context.read<SessionBloc>().add(InitSessionEvent());
  }

  void showSnackBar(BuildContext context, Widget content) {
    SnackBar snackBar = SnackBar(
      dismissDirection: DismissDirection.none,
      behavior: SnackBarBehavior.floating,
      content: content,
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> showAlertDialog(BuildContext context, String title, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Okay'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: MultiBlocListener(
        listeners: [
          BlocListener<NavigationBloc, NavigationState>(
            listener: (context, state) {
              if (state is NavigationPushNamedState) {
                Navigator.pushNamed(context, state.routeName);
              }
              if (state is NavigationReplacementPushNamedState) {
                Navigator.pushReplacementNamed(context, state.routeName);
              }
              if (state is NavigationPushNamedAndRemoveUntilState) {
                bool finish = false;
                Navigator.pushNamedAndRemoveUntil(context, state.routeName, (r) {
                  if (r.settings.name == state.routeName && !finish) {
                    finish = true;
                    return false;
                  }
                  return finish;
                });
              }
              if (state is NavigationPopState) {
                Navigator.pop(context);
              }
            },
          ),
          BlocListener<NotificationBloc, NotificationState>(
            listener: (context, state) {
              if (state is ShowSnackBarState) {
                showSnackBar(context, Text(state.message));
              }
              if (state is ShowErrorSnackBarState) {
                showSnackBar(context, Text(state.message, style: const TextStyle(color: Colors.red)));
              }
              if (state is ShowAlertDialogState) {
                showAlertDialog(context, state.title, state.message);
              }
            },
          ),
        ],
        child: Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
