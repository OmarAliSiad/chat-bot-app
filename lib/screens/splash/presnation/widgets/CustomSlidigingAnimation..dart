import 'dart:ffi';

import 'package:ai_app/core/utils/images.dart';
import 'package:ai_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class CustomSlidingAnimation extends StatelessWidget {
  final Animation<double> slidingAnimtaion;
  final bool isImage;
  const CustomSlidingAnimation({
    super.key,
    required this.slidingAnimtaion,
    required this.isImage,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimtaion,
      builder: (context, child) {
        return FadeTransition(
          opacity: slidingAnimtaion,
          child: (isImage)
              ? Image.asset(
                  filterQuality: FilterQuality.high,
                  width: 200,
                  height: 200,
                  Images.splashImage,
                )
              : const Center(
                  child: Text(
                    'Welcome To Ai ChatBot',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
