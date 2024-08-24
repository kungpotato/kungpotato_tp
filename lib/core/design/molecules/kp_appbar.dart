import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kungpotato/core/clipers/clip_bottom.dart';
import 'package:kungpotato/core/theme/app_color.dart';
import 'package:kungpotato/core/widgets/custom_appbar.dart';

class KPAppbar extends CustomClippedAppBar {
  const KPAppbar({
    super.key,
    super.title,
    super.leading,
    super.actions,
    super.gradient,
    super.clipper,
    super.height = 56,
  });

  factory KPAppbar.roundBottom({
    List<Widget>? actions,
    Widget? title,
    Widget? leading,
  }) {
    return KPAppbar(
      title: title,
      leading: leading,
      actions: actions,
      height: Platform.isIOS ? 44 : 56,
      clipper: ClipBottomCorners(),
    );
  }

  factory KPAppbar.gradient({
    List<Widget>? actions,
    Widget? title,
    Widget? leading,
  }) {
    return KPAppbar(
      title: title,
      leading: leading,
      actions: actions,
      gradient: LinearGradient(
        colors: [KpColorSeed.instance.primary, KpColorSeed.instance.secondary],
      ),
      height: Platform.isIOS ? 44 : 56,
    );
  }

  factory KPAppbar.gradientRound({
    List<Widget>? actions,
    Widget? title,
    Widget? leading,
  }) {
    return KPAppbar(
      title: title,
      leading: leading,
      actions: actions,
      clipper: ClipBottomCorners(),
      gradient: LinearGradient(
        colors: [KpColorSeed.instance.primary, KpColorSeed.instance.secondary],
      ),
      height: Platform.isIOS ? 44 : 56,
    );
  }
}
