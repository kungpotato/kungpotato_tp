import 'package:flutter/material.dart';
import 'package:kungpotato/core/theme/app_color.dart';

class KPText extends Text {
  const KPText(
    this.txt, {
    super.key,
    super.style = const TextStyle(fontSize: 14),
    super.overflow = TextOverflow.ellipsis,
    super.maxLines = 2,
  }) : super(txt ?? '');

  factory KPText.text(String text) {
    return KPText(
      text,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  factory KPText.label1(String text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
    );
  }

  factory KPText.label2(String text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
    );
  }

  factory KPText.label3(String text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
    );
  }

  factory KPText.head1(String? text) {
    return KPText(
      text,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  factory KPText.head2(String? text) {
    return KPText(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  factory KPText.head3(String? text) {
    return KPText(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  factory KPText.head4(String? text) {
    return KPText(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  factory KPText.subtitle(String? text) {
    return KPText(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }

  factory KPText.caption(String? text) {
    return KPText(
      text,
      style: const TextStyle(fontSize: 10),
    );
  }

  factory KPText.error1(String? text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 12, color: KpColorSeed.instance.danger),
    );
  }

  factory KPText.error2(String? text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 10, color: KpColorSeed.instance.danger),
    );
  }

  final String? txt;
}
