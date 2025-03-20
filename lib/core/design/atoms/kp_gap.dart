import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum KPGapSize {
  smallW(4, 0),
  mediumW(8, 0),
  largeW(24, 0),
  extraLargeXlW(32, 0),
  smallH(0, 4),
  mediumH(0, 8),
  largeH(0, 24),
  extraLargeXlH(0, 32);

  const KPGapSize(this.width, this.height);

  final double width, height;
}

class KPGap extends SizedBox {
  const KPGap({super.key, super.height, super.width});

  factory KPGap.smallW() {
    return KPGap(width: KPGapSize.smallW.width.w); // ใช้ .w เพื่อให้ responsive
  }

  factory KPGap.mediumW() {
    return KPGap(width: KPGapSize.mediumW.width.w);
  }

  factory KPGap.largeW() {
    return KPGap(width: KPGapSize.largeW.width.w);
  }

  factory KPGap.extraLargeXlW() {
    return KPGap(width: KPGapSize.extraLargeXlW.width.w);
  }

  factory KPGap.smallH() {
    return KPGap(
      height: KPGapSize.smallH.height.h,
    ); // ใช้ .h เพื่อให้ responsive
  }

  factory KPGap.mediumH() {
    return KPGap(height: KPGapSize.mediumH.height.h);
  }

  factory KPGap.largeH() {
    return KPGap(height: KPGapSize.largeH.height.h);
  }

  factory KPGap.extraLargeXlH() {
    return KPGap(height: KPGapSize.extraLargeXlH.height.h);
  }
}
