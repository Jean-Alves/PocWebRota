import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocwebrota/app/core/app_colors.dart';
import 'package:pocwebrota/app/core/app_images.dart';
import 'package:pocwebrota/app/shared/widgets/CircularProgressIndicator/circular_progress_widget.dart';

import 'login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(AppImages.fundo),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.logo),
              Observer(builder: (_) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Container(
                    height: 45,
                    child: TextButton(
                      onPressed: () {
                        controller.loading = true;

                        Modular.to.navigate("/login/document");
                        controller.loading = false;
                      },
                      child: controller.loading
                          ? CircularProgressWidget()
                          : Text("Entrar"),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: AppColors.laranja,
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30.0,
                            ),
                          )),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
