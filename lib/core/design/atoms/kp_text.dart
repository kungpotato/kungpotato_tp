import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      style: TextStyle(
        fontSize: 16.sp, // ใช้ .sp เพื่อปรับขนาดตัวหนังสืออัตโนมัติ
      ),
    );
  }

  factory KPText.label1(String text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade700),
    );
  }

  factory KPText.label2(String text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
    );
  }

  factory KPText.label3(String text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700),
    );
  }

  factory KPText.label4(String text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 10.sp, color: Colors.grey.shade700),
    );
  }

  factory KPText.head1(String? text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
    );
  }

  factory KPText.head2(String? text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
    );
  }

  factory KPText.head3(String? text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
    );
  }

  factory KPText.head4(String? text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
    );
  }

  factory KPText.subtitle(String? text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
    );
  }

  factory KPText.caption(String? text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 10.sp),
    );
  }

  factory KPText.error1(String? text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 12.sp, color: KpColorSeed.instance.danger),
    );
  }

  factory KPText.error2(String? text) {
    return KPText(
      text,
      style: TextStyle(fontSize: 10.sp, color: KpColorSeed.instance.danger),
    );
  }

  final String? txt;
}
