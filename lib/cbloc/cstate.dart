/*
Boilerplate class
make states comparable
 */

part of 'cbloc.dart';

int generateHash() {
  Random random = Random();
  return random.nextInt(10000);
}

abstract class CState {
  final int hash = generateHash();

  @override
  bool operator == (Object other) {
    return other.hashCode == hashCode;
  }

  @override
  int get hashCode {
    return hash;
  }
}
