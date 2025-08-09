part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent extends CEvent {}

final class NavigationPushNamed extends NavigationEvent {
  final String routeName;
  final Map<String, dynamic> data;

  NavigationPushNamed(this.routeName, {this.data = const {}});
}

final class NavigationReplacementPushNamed extends NavigationEvent {
  final String routeName;
  final Map<String, dynamic> data;

  NavigationReplacementPushNamed(this.routeName, {this.data = const {}});
}

final class NavigationPopAndPushNamed extends NavigationEvent {
  final String routeName;
  final Map<String, dynamic> data;

  NavigationPopAndPushNamed(this.routeName, {this.data = const {}});
}

final class NavigationPushNamedAndRemoveUntil extends NavigationEvent {
  final String routeName;
  final Map<String, dynamic> data;

  NavigationPushNamedAndRemoveUntil(this.routeName, {this.data = const {}});
}

final class NavigationPop extends NavigationEvent {}
