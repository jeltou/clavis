library;

import 'dart:async';

part 'arca/arca.dart';

part 'distribuo/distribuo.dart';

part 'nuntius/nuntius.dart';

Distribuo? _distribuo;

Distribuo getDistribuo() {
  _distribuo ??= Distribuo();
  return _distribuo!;
}
