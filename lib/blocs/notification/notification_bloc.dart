import 'package:bloc/bloc.dart';
import 'package:clavis/blocs/notification/notification_nuntius.dart';
import 'package:meta/meta.dart';

import '../../cbloc/cbloc.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends CBloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial(), subscribedTopics: []) {
    on<NotificationEvent>((event, emit) {});
    on<ShowSnackBar>(_showSnackBar);
    on<ShowErrorSnackBar>(_showErrorSnackBar);
    on<ShowAlertDialog>(_showAlertDialog);
  }

  Future<void> _showSnackBar(ShowSnackBar event, Emitter emit) async {
    emit(ShowSnackBarState(event.message));
  }

  Future<void> _showErrorSnackBar(ShowErrorSnackBar event, Emitter emit) async {
    emit(ShowErrorSnackBarState(event.message));
  }

  Future<void> _showAlertDialog(ShowAlertDialog event, Emitter emit) async {
    emit(ShowAlertDialogState(event.message, event.title));
  }

  @override
  Future<void> handleArca(ArcaEvent event, Emitter emit) async {
    if (event.nuntius is ShowSnackBarNotifcationNuntius) {
      add(ShowSnackBar(message: (event.nuntius as ShowSnackBarNotifcationNuntius).message));
      return;
    }
    if (event.nuntius is ShowDialogNotifcationNuntius) {
      add(ShowAlertDialog(message: (event.nuntius as ShowDialogNotifcationNuntius).message, title: (event.nuntius as ShowDialogNotifcationNuntius).title));
      return;
    }
  }
}
