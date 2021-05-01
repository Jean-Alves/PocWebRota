import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocwebrota/app/modules/splashscreen/splashscreen_module.dart';

void main() {
  setUpAll(() {
    initModule(SplashscreenModule());
  });
}
