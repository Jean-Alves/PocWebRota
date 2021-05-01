import 'package:flutter/material.dart';
import 'package:pocwebrota/app/core/app_colors.dart';

class CustomButtonLoginWidget extends StatelessWidget {
  final VoidCallback ontap;
  final Color color;
  final String text;
  final IconData icon;
  const CustomButtonLoginWidget({
    Key? key,
    required this.ontap,
    required this.text,
    this.icon = Icons.person_outline,
    this.color = AppColors.preto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ontap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 2.0),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Container(
          width: largura * 0.45,
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
              ),
              Text(
                text,
                style: TextStyle(
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
