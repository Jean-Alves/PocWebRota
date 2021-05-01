import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocwebrota/app/core/app_colors.dart';
import 'package:pocwebrota/app/core/app_images.dart';
import 'package:pocwebrota/app/modules/login/widgets/custom_button_login_widget.dart';
import 'package:pocwebrota/app/shared/widgets/CircularProgressIndicator/circular_progress_widget.dart';

import '../login_store.dart';

class DocumentLoginPage extends StatefulWidget {
  @override
  _DocumentLoginPageState createState() => _DocumentLoginPageState();
}

class _DocumentLoginPageState
    extends ModularState<DocumentLoginPage, LoginStore> {
  var _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
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
                                      color: AppColors.roxo,
                                    ),
                                    children: [
                                      TextSpan(text: "\nque a casa é sua ;)")
                                    ]),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButtonLoginWidget(
                                  ontap: () {
                                    if (controller.loading) return;
                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);

                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    controller.toogleButton(true);
                                    _textController.clear();
                                  },
                                  text: "Pessoa Física",
                                  color: controller.isCpf
                                      ? AppColors.laranja
                                      : Colors.grey,
                                ),
                                CustomButtonLoginWidget(
                                  ontap: () {
                                    if (controller.loading) return;
                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);

                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    controller.toogleButton(false);
                                    _textController.clear();
                                  },
                                  text: "Pessoa jurídica",
                                  color: controller.isCpf
                                      ? Colors.grey
                                      : AppColors.laranja,
                                  icon: Icons.airport_shuttle_rounded,
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: controller.isCpf
                                  ? TextFormField(
                                      textInputAction: TextInputAction.done,
                                      enabled: !controller.loading,
                                      controller: _textController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          labelText: 'Digite seu CPF',
                                          errorText: controller.documentValid
                                              ? "CPF inválido"
                                              : null),
                                      onChanged: (value) {
                                        controller.setDocument(value);
                                      },
                                      onFieldSubmitted: (value) {
                                        controller.setDocument(value);
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CpfInputFormatter(),
                                      ],
                                    )
                                  : TextFormField(
                                      textInputAction: TextInputAction.done,
                                      enabled: !controller.loading,
                                      controller: _textController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          labelText: 'Digite seu E-mail',
                                          errorText: controller.emailValid
                                              ? "E-mail inválido"
                                              : null),
                                      onChanged: (value) {
                                        controller.setDocument(value);
                                      },
                                      onFieldSubmitted: (value) {
                                        controller.setDocument(value);
                                      },
                                    ),
                            ),
                            CheckboxListTile(
                              title: Text(
                                controller.isCpf
                                    ? "Lembrar CPF"
                                    : "Lembrar E-mail",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              value: controller.rememberMe,
                              onChanged: (newValue) {
                                if (!controller.loading)
                                  controller.onRememberMeChanged(newValue);
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Container(
                            height: 45,
                            child: TextButton(
                              onPressed: controller.document.isEmpty
                                  ? null
                                  : () {
                                      controller.onNextPage();
                                    },
                              child: controller.loading
                                  ? CircularProgressWidget()
                                  : Text("Próximo"),
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  onSurface: AppColors.preto,
                                  backgroundColor: controller.document.isEmpty
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
