library;

import 'dart:async';
import 'dart:math';
import 'package:fores/conexus/conexus.dart';
import 'package:fores/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cevent.dart';

part 'cstate.dart';

abstract class CBloc<E, S extends CState> extends Bloc<CEvent, S> {
  final List<String> subscribedTopics;
  Distribuo distribuo = getDistribuo();
  Config config = Config();
  late final Arca arca;
  late final StreamSubscription nuntiusStream;

  CBloc(super.initialState, {required this.subscribedTopics}) {
    on<ArcaEvent>(handleArca);
    arca = Arca(subscribedTopics);
    nuntiusStream = arca.observe.listen((nuntius) {
      add(ArcaEvent(nuntius));
    });
  }

  @override
  Future<void> close() {
    nuntiusStream.cancel();
    return super.close();
  }

  @protected
  Future<void> handleArca(ArcaEvent event, Emitter emit) async {}
}
