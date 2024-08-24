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
        );

  factory KPOutlineButton.primary({
    Widget? child,
    void Function()? onPressed,
    String? text,
    bool? fullWidth,
  }) {
    return KPOutlineButton(
      color: KpColorSeed.instance.primary,
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
      color: KpColorSeed.instance.secondary,
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
      color: KpColorSeed.instance.tertiary,
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
      color: KpColorSeed.instance.danger,
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
      color: KpColorSeed.instance.success,
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
      color: KpColorSeed.instance.warning,
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
      color: KpColorSeed.instance.info,
      onPressed: onPressed,
      text: text,
      fullWidth: fullWidth,
      child: child,
    );
  }

  final bool? fullWidth;
}
