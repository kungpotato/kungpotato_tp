import 'package:flutter/material.dart';

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
    return KPGap(width: KPGapSize.smallW.width);
  }

  factory KPGap.mediumW() {
    return KPGap(width: KPGapSize.mediumW.width);
  }

  factory KPGap.largeW() {
    return KPGap(width: KPGapSize.largeW.width);
  }

  factory KPGap.extraLargeXlW() {
    return KPGap(width: KPGapSize.extraLargeXlW.width);
  }

  factory KPGap.smallH() {
    return KPGap(height: KPGapSize.smallH.height);
  }

  factory KPGap.mediumH() {
    return KPGap(height: KPGapSize.mediumH.height);
  }

  factory KPGap.largeH() {
    return KPGap(height: KPGapSize.largeH.height);
  }

  factory KPGap.extraLargeXlH() {
    return KPGap(height: KPGapSize.extraLargeXlH.height);
  }
}
