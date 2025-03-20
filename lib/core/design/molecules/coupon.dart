import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kungpotato/core/design/atoms/atoms.dart';
import 'package:kungpotato/core/widgets/kp_image.dart';

class KpCoupon extends StatelessWidget {
  const KpCoupon({
    super.key,
    this.title,
    this.subTitle,
    this.price,
    this.icon,
    this.onTap,
  });

  final String? title;
  final String? subTitle;
  final String? price;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r), // ใช้ .r ให้รองรับจอใหญ่
        ),
        child: SizedBox(
          height: 80.h, // ปรับขนาดให้ responsive
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(KPGapSize.mediumW.width.w),
                // ปรับขนาด padding
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        // ขอบมนรองรับ iPad
                        child: KpImage.asset(
                          'assets/images/discount.jpg',
                          fit: BoxFit.cover,
                          width: 75.w, // ปรับขนาดตามหน้าจอ
                          height: 75.h,
                        ),
                      ),
                    ),
                    KPGap(width: KPGapSize.mediumW.width.w),
                    // ใช้ .w ให้ responsive
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: KPText(
                              title ?? 'จ่ายน้อยลง คุ้มค่ามากขึ้น',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.black,
                                fontSize:
                                    16.sp, // ใช้ .sp เพื่อให้ปรับอัตโนมัติ
                              ),
                            ),
                          ),
                          Flexible(
                            child: KPText(
                              subTitle ??
                                  'ระบบจะมอบส่วนลดให้อัตโนมัติ รับส่วนลดได้เลย!!!',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          Flexible(
                            child: KPText(
                              price ?? '200฿',
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  color: Colors.green.shade100,
                  width: 25.w, // ปรับขนาดให้พอดีกับทุกอุปกรณ์
                  height: 20.h,
                  child: Icon(
                    icon ?? Icons.airplanemode_active_outlined,
                    color: Colors.green,
                    size: 16.sp, // ปรับขนาด icon อัตโนมัติ
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
