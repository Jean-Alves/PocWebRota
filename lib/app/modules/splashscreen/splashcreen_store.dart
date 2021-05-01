import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splashcreen_store.g.dart';

class SplashcreenStore = _SplashcreenStoreBase with _$SplashcreenStore;

abstract class _SplashcreenStoreBase with Store {
  _SplashcreenStoreBase() {
    timeWait();
  }

  Future<void> timeWait() async {
    await Future.delayed(Duration(seconds: 2));
    //aguarda 2 segundos para ir para próxima pagina,
    //// com o modular nao preciso injetar o contexto, com isso posso manipular
    /// o navigator dentro da store
    Modular.to.pushReplacementNamed("/login");
  }
}
