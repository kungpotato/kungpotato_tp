import 'package:flutter/material.dart';
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
    super.key,
  });

  final String imageUrl;
  final String title;
  final String? teacher;
  final double? like;
  final double? learning;

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
    setState(() {
      favorite = widget.isFavorite;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.translucent,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
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
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: KpImage.network(
                          widget.imageUrl,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.5),
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
                      splashColor: Colors.blue.withOpacity(0.2),
                      onTap: widget.onTap,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
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
                                                size: 12,
                                                color: Colors.blue.shade700,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                widget.like!.toSuffixString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (widget.learning != null)
                                          KPText(
                                            '${widget.learning!.toSuffixString()} คนกำลังเรียน ',
                                            style: TextStyle(
                                              fontSize: 10,
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

            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red.shade700,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(20)),
                ),
                child: const KPText(
                  'ใหม่',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
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
            ),
          ],
        ),
      ),
    );
  }
}
