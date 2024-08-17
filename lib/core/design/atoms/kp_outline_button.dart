import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kungpotato/core/theme/app_color.dart';

class KPOutlineButton extends GFButton {
  const KPOutlineButton({
    required super.onPressed,
    super.key,
    super.color,
    super.text,
    super.child,
    this.fullWidth,
  }) : super(
          blockButton: fullWidth,
          shape: GFButtonShape.pills,
          type: GFButtonType.outline,
          size: GFSize.SMALL,
        );

  factory KPOutlineButton.primary({
    Widget? child,
    void Function()? onPressed,
    String? text,
    bool? fullWidth,
  }) {
    return KPOutlineButton(
      color: ColorSeed.primary.color,
      onPressed: onPressed,
      text: text,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPOutlineButton.secondary({
    Widget? child,
    void Function()? onPressed,
    String? text,
    bool? fullWidth,
  }) {
    return KPOutlineButton(
      color: ColorSeed.secondary.color,
      onPressed: onPressed,
      text: text,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPOutlineButton.tertiary({
    Widget? child,
    void Function()? onPressed,
    String? text,
    bool? fullWidth,
  }) {
    return KPOutlineButton(
      color: ColorSeed.tertiary.color,
      onPressed: onPressed,
      text: text,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPOutlineButton.danger({
    Widget? child,
    void Function()? onPressed,
    String? text,
    bool? fullWidth,
  }) {
    return KPOutlineButton(
      color: ColorSeed.danger.color,
      onPressed: onPressed,
      text: text,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPOutlineButton.success({
    Widget? child,
    void Function()? onPressed,
    String? text,
    bool? fullWidth,
  }) {
    return KPOutlineButton(
      color: ColorSeed.success.color,
      onPressed: onPressed,
      text: text,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPOutlineButton.warning({
    Widget? child,
    void Function()? onPressed,
    String? text,
    bool? fullWidth,
  }) {
    return KPOutlineButton(
      color: ColorSeed.warning.color,
      onPressed: onPressed,
      text: text,
      fullWidth: fullWidth,
      child: child,
    );
  }

  factory KPOutlineButton.info({
    Widget? child,
    void Function()? onPressed,
    String? text,
    bool? fullWidth,
  }) {
    return KPOutlineButton(
      color: ColorSeed.info.color,
      onPressed: onPressed,
      text: text,
      fullWidth: fullWidth,
      child: child,
    );
  }

  final bool? fullWidth;
}
