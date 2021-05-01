import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocwebrota/app/modules/splashscreen/splashscreen_page.dart';

import 'splashcreen_store.dart';

class SplashscreenModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashcreenStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashscreenPage()),
  ];
}
