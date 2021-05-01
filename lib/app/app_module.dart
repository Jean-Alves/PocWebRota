import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocwebrota/app/modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/splashscreen/splashscreen_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashscreenModule()),
    ModuleRoute("/home", module: HomeModule()),
    ModuleRoute("/login", module: LoginModule()),
  ];
}
