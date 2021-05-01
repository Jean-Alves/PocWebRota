import 'package:pocwebrota/app/modules/login/pages/password_login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';

main() {
  group('PasswordPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester
          .pumpWidget(buildTestableWidget(PasswordLoginPage(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}
