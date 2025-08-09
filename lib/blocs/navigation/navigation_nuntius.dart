import '../../conexus/conexus.dart';

const String navigationTopic = "CALVIS_NAVIGATION";

abstract class AbstractNavigationNuntius extends AbstractNuntius {
  AbstractNavigationNuntius() : super(topic: navigationTopic);
}

class PopRouteNavigationNuntius extends AbstractNavigationNuntius {
  PopRouteNavigationNuntius();
}

class PushNamedRouteNavigationNuntius extends AbstractNavigationNuntius {
  final String route;
  PushNamedRouteNavigationNuntius({required this.route});
}

class ReplacementPushNamedNavigationNuntius extends AbstractNavigationNuntius {
  final String route;
  ReplacementPushNamedNavigationNuntius({required this.route});
}
