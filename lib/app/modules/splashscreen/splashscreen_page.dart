import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pocwebrota/app/core/app_images.dart';

import 'splashcreen_store.dart';

class SplashscreenPage extends StatefulWidget {
  final String title;
  const SplashscreenPage({Key? key, this.title = 'SplashscreenPage'})
      : super(key: key);
  @override
  SplashscreenPageState createState() => SplashscreenPageState();
}

class SplashscreenPageState
    extends ModularState<SplashscreenPage, SplashcreenStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Center(
              child: Image.asset(AppImages.logo),
            ),
          ],
        ),
      ),
    );
  }
}
