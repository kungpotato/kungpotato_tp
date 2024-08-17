import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';

class CustomClippedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomClippedAppBar({
    super.key,
    this.height,
    this.actions,
    this.title,
    this.leading,
    this.clipper,
    this.gradient,
  });

  final double? height;
  final List<Widget>? actions;
  final Widget? title;
  final Widget? leading;
  final CustomClipper<Path>? clipper;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: GradientAppBar(
        centerTitle: true,
        leading: leading,
        title: title,
        gradient: gradient,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);
}
