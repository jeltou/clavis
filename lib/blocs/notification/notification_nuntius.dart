import '../../conexus/conexus.dart';

const String notificationTopic = "CALVIS_NOTIFICATION";

abstract class AbstractNotifcationNuntius extends AbstractNuntius {
  AbstractNotifcationNuntius() : super(topic: notificationTopic);
}

class ShowSnackBarNotifcationNuntius extends AbstractNotifcationNuntius {
  final String message;

  ShowSnackBarNotifcationNuntius({required this.message});
}

class ShowDialogNotifcationNuntius extends AbstractNotifcationNuntius {
  final String title;
  final String message;

  ShowDialogNotifcationNuntius({required this.title, required this.message});
}
