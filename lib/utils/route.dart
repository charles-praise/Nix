import '../export.dart';

class RoutesName {
  static const String splashScreen = 'splashscreen';
}

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const Splashscreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('No routes generated'),
            ),
          );
        });
    }
  }
}
