import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:kungpotato/core/theme/app_color.dart';

class KPButton extends GFButton {
  const KPButton({
    required super.onPressed,
    super.key,
    super.color,
    super.text,
    super.icon,
    super.child,
    this.fullWidth,
  }) : super(
          blockButton: fullWidth,
          shape: GFButtonShape.pills,
          type: GFButtonType.solid,
        );

  factory KPButton.primary({
    Widget? child,
    void Function()? onPressed,
    String? text,
    Widget? icon,
    bool? fullWidth,
  }) {
    return KPButton(
      color: KpColorSeed.instance.primary,
      onPressed: onPressed,
      text: text,
      icon: icon,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPButton.secondary({
    Widget? child,
    void Function()? onPressed,
    String? text,
    Widget? icon,
    bool? fullWidth,
  }) {
    return KPButton(
      color: KpColorSeed.instance.secondary,
      onPressed: onPressed,
      text: text,
      icon: icon,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPButton.tertiary({
    Widget? child,
    void Function()? onPressed,
    String? text,
    Widget? icon,
    bool? fullWidth,
  }) {
    return KPButton(
      color: KpColorSeed.instance.tertiary,
      onPressed: onPressed,
      text: text,
      icon: icon,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPButton.danger({
    Widget? child,
    void Function()? onPressed,
    String? text,
    Widget? icon,
    bool? fullWidth,
  }) {
    return KPButton(
      color: KpColorSeed.instance.danger,
      onPressed: onPressed,
      text: text,
      icon: icon,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPButton.success({
    Widget? child,
    void Function()? onPressed,
    String? text,
    Widget? icon,
    bool? fullWidth,
  }) {
    return KPButton(
      color: KpColorSeed.instance.success,
      onPressed: onPressed,
      text: text,
      icon: icon,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPButton.warning({
    Widget? child,
    void Function()? onPressed,
    String? text,
    Widget? icon,
    bool? fullWidth,
  }) {
    return KPButton(
      color: KpColorSeed.instance.warning,
      onPressed: onPressed,
      text: text,
      icon: icon,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPButton.info({
    Widget? child,
    void Function()? onPressed,
    String? text,
    Widget? icon,
    bool? fullWidth,
  }) {
    return KPButton(
      color: KpColorSeed.instance.info,
      onPressed: onPressed,
      text: text,
      icon: icon,
      fullWidth: fullWidth,
      child: child,
    );
  }

  final bool? fullWidth;
}
