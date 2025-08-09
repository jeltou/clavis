part of '../conexus.dart';

class Distribuo {
  List<Arca> arcae = [];

  void registerArca(Arca toAdd) {
    arcae.add(toAdd);
  }

  void unregisterArca(Arca toRemove) {
    arcae.remove(toRemove);
  }

  Future<void> send(AbstractNuntius nuntius) async {
    arcae.where((a) => a.hasSubscription(nuntius.topic)).forEach((a) => a.receiveNuntius(nuntius));
  }

  Future<void> broadcast(AbstractNuntius nuntius) async {
    for (Arca arca in arcae) {
      arca.receiveNuntius(nuntius);
    }
  }
}
