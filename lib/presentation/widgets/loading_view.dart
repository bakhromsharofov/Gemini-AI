import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  final Color? backgroundColor;
  final bool showIndicator;

  const LoadingView({
    this.backgroundColor,
    Key? key,
    this.showIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.yellowAccent,
      body: showIndicator ? Center(
        child: Container(
          height: 100,
          child: Lottie.asset('assets/animations/gemini_buffering.json'),
        ),
      ) : SizedBox.shrink(),
    );
  }
}
