import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pocwebrota/app/modules/login/repositories/login_repository.dart';
import 'package:pocwebrota/app/shared/extensions/string_extension_cpf.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  LoginRepository loginRepository;
  _LoginStoreBase(this.loginRepository);

  @observable
  bool loading = false;

  @observable
  bool rememberMe = false;

  @observable
  bool isCpf = true;

  @observable
  String document = "";
  @observable
  String password = "";

  @observable
  bool passwordVisible = false;
  @action
  void tooglePasswordVisible() {
    passwordVisible = !passwordVisible;
  }

  @action
  void toogleButton(bool cpf) {
    isCpf = cpf;
    document = "";
  }

  @computed
  bool get documentValid => document.isEmpty || document.length < 14
      ? false
      : document.isValid()
          ? false
          : true;

  @computed
  bool get emailValid => document.isEmpty ||
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(document)
      ? false
      : true;

  @action
  void onRememberMeChanged(bool? checked) {
    rememberMe = checked == null ? false : checked;
  }

  void setDocument(String documentText) {
    if (loading) return;
    document = documentText;
  }

  void setPassword(String pass) {
    if (loading) return;
    password = pass;
  }

  @action
  Future<void> onNextPage() async {
    if (loading) return;
    if (document.isEmpty) return;
    loading = true;
    if (isCpf) {
      //valida CPF valido
      if (document.isValid()) {
        var verify = await verifyCpf(document);
        if (verify) {
          Modular.to.navigate("/login/password");
        } else {
          Modular.to.navigate("/login/warningPage");
        }
      }
    } else {
      //valida Email valido

      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(document);

      if (emailValid) {
        var verify = await verifyEmail(document);
        if (verify) {
          Modular.to.navigate("/login/password");
        } else {
          Modular.to.navigate("/login/warningPage");
        }
      }
    }
    loading = false;
  }

  //++++++== API

  Future<bool> verifyCpf(String cpf) async {
    try {
      loading = true;
      var valid = await loginRepository.validCpf(cpf);
      return valid;
    } catch (e) {
      //trata exceção, grava um log, algo do tipo
    }
    loading = false;
    return Future.value(false);
  }

  Future<bool> verifyEmail(String email) async {
    try {
      loading = true;
      var valid = await loginRepository.validEmail(email);
      return valid;
    } catch (e) {
      //trata exceção, grava um log, algo do tipo
    }
    loading = false;
    return Future.value(false);
  }
}
