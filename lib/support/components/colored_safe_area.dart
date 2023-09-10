import 'package:flutter/material.dart';

class ColoredSafeArea extends StatelessWidget {
  final Color color;
  final Widget child;

  const ColoredSafeArea({
    required this.color,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: child,
      ),
    );
  }
}
