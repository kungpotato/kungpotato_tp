import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kungpotato/core/design/atoms/atoms.dart';
import 'package:kungpotato/core/widgets/kp_image.dart';

class KpProductCard extends StatefulWidget {
  const KpProductCard({
    required this.imageUrl,
    required this.title,
    this.price,
    this.onTap,
    this.onFavoriteTap,
    this.rating,
    this.oldPrice,
    this.isFavorite = false,
    super.key,
  });

  final String imageUrl;
  final String title;
  final double? price;
  final double? rating;
  final double? oldPrice;
  final bool isFavorite;
  final void Function()? onTap;
  final void Function()? onFavoriteTap;

  @override
  State<KpProductCard> createState() => _KpProductCardState();
}

class _KpProductCardState extends State<KpProductCard> {
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
          borderRadius: BorderRadius.circular(20.r), // ใช้ .r ให้ responsive
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
                          height: 180.h, // ใช้ .h ให้ responsive
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 180.h,
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
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 14.sp, // ใช้ .sp ให้ responsive
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // Product Price and Old Price
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (widget.price != null)
                                  Row(
                                    children: [
                                      Text(
                                        '\$${widget.price!.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 16.sp, // ใช้ .sp
                                          color: Colors.green[700],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10.w), // ใช้ .w
                                      if (widget.oldPrice != null &&
                                          widget.oldPrice! > widget.price!)
                                        Text(
                                          '\$${widget.oldPrice!.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.red[700],
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                    ],
                                  ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (widget.rating != null)
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 12.sp, // ใช้ .sp
                                            color: Colors.yellow[700],
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            widget.rating.toString(),
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    KPText(
                                      'ขายแล้ว 20 ชิ้น',
                                      style: TextStyle(
                                        fontSize: 10.sp, // ใช้ .sp
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
            if ((widget.price != null) &&
                widget.oldPrice != null &&
                widget.oldPrice! > widget.price!)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  // ใช้ .w และ .h
                  decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                    ), // ใช้ .r
                  ),
                  child: KPText(
                    '-${((1 - widget.price! / widget.oldPrice!) * 100).toStringAsFixed(0)}%',
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
