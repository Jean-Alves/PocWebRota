import 'package:flutter_test/flutter_test.dart';
import 'package:pocwebrota/app/modules/login/login_store.dart';
import 'package:pocwebrota/app/modules/login/repositories/login_repository.dart';

void main() {
  late LoginStore store;

  setUpAll(() {
    store = LoginStore(LoginRepository());
  });

  test('increment count', () async {
    store.toogleButton(true);
    expect(store.isCpf, equals(true));
  });
}
