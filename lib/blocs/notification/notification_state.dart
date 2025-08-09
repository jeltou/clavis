part of 'notification_bloc.dart';

@immutable
sealed class NotificationState extends CState {}

final class NotificationInitial extends NotificationState {}

final class ShowSnackBarState extends NotificationState {
  final String message;

  ShowSnackBarState(this.message);
}

final class ShowErrorSnackBarState extends NotificationState {
  final String message;

  ShowErrorSnackBarState(this.message);
}

final class ShowAlertDialogState extends NotificationState {
  final String message;
  final String title;

  ShowAlertDialogState(this.message, this.title);
}
