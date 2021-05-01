import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocwebrota/app/core/app_colors.dart';
import 'package:pocwebrota/app/core/app_images.dart';

class WarningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 40,
                  ),
                  onPressed: () {
                    Modular.to.pop(context);
                  },
                ),
              ),
              Image.asset(
                AppImages.logo,
                width: 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Percebemos que",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.roxo,
                    ),
                  ),
                  Text(
                    "você ainda não",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.roxo,
                    ),
                  ),
                  Text(
                    "possui um plano",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.roxo,
                    ),
                  ),
                  Text(
                    "na WebRota",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.roxo,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Crie uma conta para utilizar",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.roxo,
                    ),
                  ),
                  Text(
                    "nossos benefícios",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.roxo,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
