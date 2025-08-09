part of 'debug.dart';

void dPrint(dynamic msg) {
  if (kDebugMode) {
    DateTime now = DateTime.now();
    String formatDt =
        "${now.year}-"
        "${now.month < 10 ? '0${now.month}' : now.month}-"
        "${now.day < 10 ? '0${now.day}' : now.day} "
        "${now.hour < 10 ? '0${now.hour}' : now.hour}:"
        "${now.minute < 10 ? '0${now.minute}' : now.minute}:"
        "${now.second < 10 ? '0${now.second}' : now.second}."
        "${now.microsecond < 10
            ? '00${now.microsecond}'
            : now.microsecond < 100
            ? '0${now.microsecond}'
            : now.microsecond}";
    if (msg.runtimeType == String) {
      String offset = List<String>.generate(36, (index) => '-').join();
      msg = msg.split('\n').join('\n$offset');
    }
    log("$formatDt:\t$msg");
  }
}
