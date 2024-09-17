import 'package:flutter/material.dart';
import 'package:kungpotato/core/design/molecules/kp_appbar.dart';
import 'package:kungpotato/core/widgets/image_slide.dart';

class KpCourse {
  KpCourse({
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

class KpCourseDetailPage extends StatefulWidget {
  const KpCourseDetailPage({
    required this.product,
    this.isFavorite = false,
    this.onFavoriteTap,
    super.key,
  });

  final KpCourse product;
  final bool isFavorite;
  final void Function()? onFavoriteTap;

  @override
  State<KpCourseDetailPage> createState() => _KpCourseDetailPageState();
}

class _KpCourseDetailPageState extends State<KpCourseDetailPage> {
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
        title: Text(widget.product.name),
        actions: [
          IconButton(
            icon: Icon(
              favorite ? Icons.favorite : Icons.favorite_border,
              size: 25,
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
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 4),
                      Text(
                        widget.product.rating.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${widget.product.reviewsCount} reviews)',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Handle add to cart
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      textStyle: const TextStyle(fontSize: 18),
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
