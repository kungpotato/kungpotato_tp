import 'package:flutter/material.dart';

enum ColorSeed {
  primary(Color(0xff0d7c66)),
  secondary(Color(0xff41b3a2)),
  tertiary(Color(0xff6c757d)),
  danger(Color(0xffdc3545)),
  success(Color(0xff28a745)),
  warning(Color(0xffffc107)),
  info(Color(0xff17a2b8)),
  front(Color(0xff2c3333)),
  background(Color(0xffe2e2e2));

  const ColorSeed(this.color);

  final Color color;
}
