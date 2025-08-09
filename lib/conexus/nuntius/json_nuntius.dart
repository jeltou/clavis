import '../conexus.dart';

class JsonNuntius extends AbstractNuntius {
  final Map<String, dynamic> data;

  JsonNuntius(this.data, {required super.topic});
}
