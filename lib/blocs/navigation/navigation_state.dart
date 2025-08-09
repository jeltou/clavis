part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState extends CState {}

final class NavigationInitial extends NavigationState {}

final class NavigationPopState extends NavigationState {}

final class NavigationPushNamedState extends NavigationState {
  final String routeName;
  final Map<String, dynamic> data;

  NavigationPushNamedState(this.routeName, this.data);
}

final class NavigationReplacementPushNamedState extends NavigationState {
  final String routeName;
  final Map<String, dynamic> data;

  NavigationReplacementPushNamedState(this.routeName, this.data);
}

final class NavigationPopAndPushNamedState extends NavigationState {
  final String routeName;
  final Map<String, dynamic> data;

  NavigationPopAndPushNamedState(this.routeName, this.data);
}

final class NavigationPushNamedAndRemoveUntilState extends NavigationState {
  final String routeName;
  final Map<String, dynamic> data;

  NavigationPushNamedAndRemoveUntilState(this.routeName, this.data);
}
