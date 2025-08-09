part of 'cbloc.dart';

@immutable
abstract class CEvent {}

class ArcaEvent extends CEvent {
  final AbstractNuntius nuntius;

  ArcaEvent(this.nuntius);
}
