import 'package:pocwebrota/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocwebrota/app/modules/login/pages/password_Login_page.dart';
import 'package:pocwebrota/app/modules/login/repositories/login_repository.dart';
import 'package:pocwebrota/app/shared/pages/warning_page.dart';

import 'login_page.dart';
import 'pages/document_login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore(i())),
    Bind((i) => LoginRepository())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ChildRoute('/document', child: (_, args) => DocumentLoginPage()),
    ChildRoute('/password', child: (_, args) => PasswordLoginPage()),
    ChildRoute('/warningPage', child: (_, args) => WarningPage())
  ];
}
