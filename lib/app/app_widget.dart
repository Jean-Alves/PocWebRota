import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebRota',
      theme: ThemeData(primarySwatch: AppColors.laranja),
    ).modular();
  }
}
