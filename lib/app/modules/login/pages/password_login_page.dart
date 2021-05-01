import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocwebrota/app/core/app_colors.dart';
import 'package:pocwebrota/app/core/app_images.dart';
import 'package:pocwebrota/app/shared/widgets/CircularProgressIndicator/circular_progress_widget.dart';

import '../login_store.dart';

class PasswordLoginPage extends StatefulWidget {
  final String title;
  const PasswordLoginPage({Key? key, this.title = 'PasswordLoginPage'})
      : super(key: key);
  @override
  PasswordLoginPageState createState() => PasswordLoginPageState();
}

class PasswordLoginPageState
    extends ModularState<PasswordLoginPage, LoginStore> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10, top: 20),
          child: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight:
                        mediaQuery.size.height - mediaQuery.padding.top - 20),
                child: Observer(
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                AppImages.logo,
                                width: 150,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 20,
                              ),
                              child: Text.rich(
                                TextSpan(
                                    text: "Pode Entrar",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.roxo),
                                    children: [
                                      TextSpan(text: "\nque a casa é sua ;)")
                                    ]),
                              ),
                            ),
                            Text(
                              "XXX.XXX.XXX-56",
                              style: TextStyle(
                                  color: AppColors.laranja, fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Modular.to.pop(context);
                              },
                              child: Text(
                                "Não sou eu >",
                                style: TextStyle(color: AppColors.roxo),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 50),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      enableSuggestions: false,
                                      obscureText: !controller.passwordVisible,
                                      decoration: InputDecoration(
                                        labelText: 'Senha',
                                      ),
                                      onChanged: (value) {
                                        controller.setPassword(value);
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      controller.passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: controller.tooglePasswordVisible,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Container(
                            height: 45,
                            child: TextButton(
                              onPressed: controller.password.isEmpty
                                  ? null
                                  : () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: const Text(
                                            'Fim - Tela Home não implementada'),
                                        duration: const Duration(seconds: 3),
                                        action: SnackBarAction(
                                          label: 'OK',
                                          onPressed: () {},
                                        ),
                                      ));
                                    },
                              child: controller.loading
                                  ? CircularProgressWidget()
                                  : Text("Entrar"),
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  onSurface: AppColors.preto,
                                  backgroundColor: controller.password.isEmpty
                                      ? Colors.grey
                                      : AppColors.laranja,
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      30.0,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
