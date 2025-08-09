part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent extends CEvent {}

final class ShowSnackBar extends NotificationEvent {
  final String message;

  ShowSnackBar({required this.message});
}

final class ShowErrorSnackBar extends NotificationEvent {
  final String message;

  ShowErrorSnackBar({required this.message});
}

final class ShowAlertDialog extends NotificationEvent {
  final String message;
  final String title;

  ShowAlertDialog({required this.message, required this.title});
}
