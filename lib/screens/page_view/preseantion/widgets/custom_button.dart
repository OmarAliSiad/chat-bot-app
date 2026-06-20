import 'package:ai_app/core/utils/images.dart';
import 'package:ai_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  const CustomButton(
      {super.key, required this.onPressed, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: const Color(0xff3369FF),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textButton,
            style: Styles.textStyle19boldBlack.copyWith(color: Colors.white),
          ),
          const SizedBox(
            width: 5,
          ),
          SvgPicture.asset(
            Images.arrowRight,
          )
        ],
      ),
    );
  }
}
