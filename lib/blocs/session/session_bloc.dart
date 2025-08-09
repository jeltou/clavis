import 'package:bloc/bloc.dart';

import '../../cbloc/cbloc.dart';
import '../navigation/navigation_nuntius.dart';

part 'session_event.dart';

part 'session_state.dart';

class SessionBloc extends CBloc<SessionEvent, SessionState> {

  SessionBloc() : super(SessionInitial(), subscribedTopics: []) {
    on<SessionEvent>((event, emit) {});
    on<InitSessionEvent>(_initSession);
  }

  Future<void> _initSession(InitSessionEvent event, Emitter emit) async {
    arca.send(PushNamedRouteNavigationNuntius(route: "/"));
  }
}
