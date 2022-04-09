import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: LottieBuilder.asset(Images.blockchain),
      ),
    );
  }
}
