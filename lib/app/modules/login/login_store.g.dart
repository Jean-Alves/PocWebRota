// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool>? _$documentValidComputed;

  @override
  bool get documentValid =>
      (_$documentValidComputed ??= Computed<bool>(() => super.documentValid,
              name: '_LoginStoreBase.documentValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_LoginStoreBase.emailValid'))
          .value;

  final _$loadingAtom = Atom(name: '_LoginStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$rememberMeAtom = Atom(name: '_LoginStoreBase.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  final _$isCpfAtom = Atom(name: '_LoginStoreBase.isCpf');

  @override
  bool get isCpf {
    _$isCpfAtom.reportRead();
    return super.isCpf;
  }

  @override
  set isCpf(bool value) {
    _$isCpfAtom.reportWrite(value, super.isCpf, () {
      super.isCpf = value;
    });
  }

  final _$documentAtom = Atom(name: '_LoginStoreBase.document');

  @override
  String get document {
    _$documentAtom.reportRead();
    return super.document;
  }

  @override
  set document(String value) {
    _$documentAtom.reportWrite(value, super.document, () {
      super.document = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordVisibleAtom = Atom(name: '_LoginStoreBase.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  final _$onNextPageAsyncAction = AsyncAction('_LoginStoreBase.onNextPage');

  @override
  Future<void> onNextPage() {
    return _$onNextPageAsyncAction.run(() => super.onNextPage());
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void tooglePasswordVisible() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.tooglePasswordVisible');
    try {
      return super.tooglePasswordVisible();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toogleButton(bool cpf) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.toogleButton');
    try {
      return super.toogleButton(cpf);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRememberMeChanged(bool? checked) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.onRememberMeChanged');
    try {
      return super.onRememberMeChanged(checked);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
rememberMe: ${rememberMe},
isCpf: ${isCpf},
document: ${document},
password: ${password},
passwordVisible: ${passwordVisible},
documentValid: ${documentValid},
emailValid: ${emailValid}
    ''';
  }
}
