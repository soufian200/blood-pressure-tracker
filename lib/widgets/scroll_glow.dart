import 'package:bptracker/utils/colors.dart';
import 'package:flutter/material.dart';

class ScrollGlow extends StatelessWidget {
  const ScrollGlow({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: AppColors.primary,
          child: child,
        ));
  }
}
