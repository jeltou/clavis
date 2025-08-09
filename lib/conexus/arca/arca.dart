part of '../conexus.dart';

class Arca {
  final List<String> subscribedTopics;
  StreamController<AbstractNuntius> nunti = StreamController<AbstractNuntius>();

  Arca(this.subscribedTopics) {
    getDistribuo().registerArca(this);
  }

  void subscribeTopic(String topic) {
    subscribedTopics.add(topic);
  }

  void unsubscribeTopic(String topic) {
    subscribedTopics.remove(topic);
  }

  bool hasSubscription(String topic) {
    return subscribedTopics.contains(topic);
  }

  Stream<AbstractNuntius> get observe async* {
    yield* nunti.stream;
  }

  Future<void> receiveNuntius(AbstractNuntius nuntius) async {
    nunti.add(nuntius);
  }

  void send(AbstractNuntius nuntius) {
    getDistribuo().send(nuntius);
  }

  void broadcast(AbstractNuntius nuntius) {
    getDistribuo().broadcast(nuntius);
  }
}
