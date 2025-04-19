import 'package:ai_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

void showScaffoldMessanger(
    BuildContext context, String message, Color backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'ok',
        onPressed: () {},
        textColor: Colors.white,
      ),
      content: Text(
        message,
        style: AppStyles.styleMedium16(),
      ),
    ),
  );
}
