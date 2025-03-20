import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kungpotato/core/design/molecules/kp_appbar.dart';
import 'package:kungpotato/core/widgets/image_slide.dart';

class KpProduct {
  KpProduct({
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.rating,
    required this.reviewsCount,
  });

  final String name;
  final String description;
  final double price;
  final List<Widget> images;
  final double rating;
  final int reviewsCount;
}

class KpProductDetailPage extends StatefulWidget {
  const KpProductDetailPage({
    required this.product,
    this.isFavorite = false,
    this.onFavoriteTap,
    super.key,
  });

  final KpProduct product;
  final bool isFavorite;
  final void Function()? onFavoriteTap;

  @override
  State<KpProductDetailPage> createState() => _KpProductDetailPageState();
}

class _KpProductDetailPageState extends State<KpProductDetailPage> {
  bool favorite = false;

  @override
  void initState() {
    setState(() {
      favorite = widget.isFavorite;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KPAppbar.gradientRound(
        title: Text(
          widget.product.name,
          style: TextStyle(fontSize: 18.sp), // ใช้ .sp ให้ responsive
        ),
        actions: [
          IconButton(
            icon: Icon(
              favorite ? Icons.favorite : Icons.favorite_border,
              size: 25.w, // ใช้ .w ให้ responsive
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                favorite = !favorite;
              });
              widget.onFavoriteTap?.call();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KPImageSlide(images: widget.product.images),
            Padding(
              padding: EdgeInsets.all(16.w), // ใช้ .w ให้ responsive
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 24.sp, // ใช้ .sp ให้ responsive
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h), // ใช้ .h ให้ responsive
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20.sp, // ใช้ .sp ให้ responsive
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      fontSize: 16.sp, // ใช้ .sp ให้ responsive
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 20.w),
                      SizedBox(width: 4.w),
                      Text(
                        widget.product.rating.toString(),
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '(${widget.product.reviewsCount} reviews)',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () {
                      // Handle add to cart
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50.h),
                      // ใช้ .h ให้ responsive
                      textStyle: TextStyle(fontSize: 18.sp),
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
