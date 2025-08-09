import 'package:bloc/bloc.dart';
import 'package:clavis/blocs/navigation/navigation_nuntius.dart';
import 'package:meta/meta.dart';
import '../../cbloc/cbloc.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends CBloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial(), subscribedTopics: [navigationTopic]) {
    on<NavigationEvent>((event, emit) {});
    on<NavigationPushNamed>(_pushNamed);
    on<NavigationReplacementPushNamed>(_replacementPushNamed);
    on<NavigationPushNamedAndRemoveUntil>(_pushNamedAndRemoveUntil);
    on<NavigationPop>(_navigateBack);
  }

  Future<void> _navigateBack(NavigationPop event, Emitter emit) async {
    emit(NavigationPopState());
  }

  Future<void> _pushNamed(NavigationPushNamed event, Emitter emit) async {
    emit(NavigationPushNamedState(event.routeName, event.data));
  }

  Future<void> _replacementPushNamed(NavigationReplacementPushNamed event, Emitter emit) async {
    emit(NavigationReplacementPushNamedState(event.routeName, event.data));
  }

  Future<void> _pushNamedAndRemoveUntil(NavigationPushNamedAndRemoveUntil event, Emitter emit) async {
    emit(NavigationPushNamedAndRemoveUntilState(event.routeName, event.data));
  }

  @override
  Future<void> handleArca(ArcaEvent event, Emitter emit) async {
    if (event.nuntius is PopRouteNavigationNuntius) {
      add(NavigationPop());
      return;
    }
    if (event.nuntius is PushNamedRouteNavigationNuntius) {
      add(NavigationPushNamed((event.nuntius as PushNamedRouteNavigationNuntius).route));
      return;
    }
  }
}
