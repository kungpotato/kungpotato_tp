import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kungpotato/core/design/atoms/atoms.dart';
import 'package:kungpotato/core/widgets/kp_image.dart';
import 'package:kungpotato/extensions/num_extension.dart';

class KpCourseCard extends StatefulWidget {
  const KpCourseCard({
    required this.imageUrl,
    required this.title,
    this.onTap,
    this.onFavoriteTap,
    this.like,
    this.learning,
    this.isFavorite = false,
    this.teacher,
    this.isNew = true,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String? teacher;
  final double? like;
  final double? learning;
  final bool? isNew;

  final bool isFavorite;
  final void Function()? onTap;
  final void Function()? onFavoriteTap;

  @override
  State<KpCourseCard> createState() => _KpProductCardState();
}

class _KpProductCardState extends State<KpCourseCard> {
  bool favorite = false;

  @override
  void initState() {
    super.initState();
    favorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.translucent,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r), // ใช้ .r ให้รองรับจอใหญ่
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image with Gradient Overlay
                Flexible(
                  flex: 4,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                        child: KpImage.network(
                          widget.imageUrl,
                          height: 180.h, // ปรับขนาดให้ responsive
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 180.h, // ใช้ .h ให้ responsive
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withValues(alpha: 0.5),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.blue.withValues(alpha: 0.2),
                      onTap: widget.onTap,
                      child: Padding(
                        padding: EdgeInsets.all(12.w), // ใช้ .w ให้ responsive
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Product Title
                            Flexible(
                              child: KPText.subtitle(
                                widget.title,
                              ),
                            ),
                            // Product Price and Old Price
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  KPText.label3(
                                    'ผู้สอน : ${widget.teacher ?? ''}',
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (widget.like != null)
                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesome.thumbs_up,
                                                size: 12.sp,
                                                // ใช้ .sp ให้ responsive
                                                color: Colors.blue.shade700,
                                              ),
                                              SizedBox(width: 4.w),
                                              // ปรับขนาด spacing
                                              Text(
                                                widget.like!.toSuffixString(),
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (widget.learning != null)
                                          KPText(
                                            '${widget.learning!.toSuffixString()} คนกำลังเรียน ',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              // ใช้ .sp ให้ responsive
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Discount Badge
            if (widget.isNew ?? false)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: KPText(
                    'ใหม่',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            // Favorite Icon
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(
                  favorite ? Icons.favorite : Icons.favorite_border,
                  size: 25.sp, // ใช้ .sp ให้ responsive
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    favorite = !favorite;
                  });
                  widget.onFavoriteTap?.call();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
