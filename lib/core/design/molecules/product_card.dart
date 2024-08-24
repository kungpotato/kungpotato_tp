import 'package:flutter/material.dart';
import 'package:kungpotato/core/design/atoms/atoms.dart';

enum KpProductCardType { modern, modern2 }

class KpProductCard extends StatefulWidget {
  const KpProductCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    this.onTap,
    this.onFavoriteTap,
    this.rating,
    this.type,
    this.oldPrice,
    this.isFavorite = false,
    super.key,
  });

  final String imageUrl;
  final String title;
  final double price;
  final double? rating;
  final KpProductCardType? type;
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
                        child: Image.network(
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
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Product Title
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Product Price and Old Price
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '\$${widget.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                if (widget.oldPrice != null &&
                                    widget.oldPrice! > widget.price)
                                  Text(
                                    '\$${widget.oldPrice!.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red[700],
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 12,
                                      color: Colors.yellow[700],
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.rating.toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                KPText(
                                  'ขายแล้ว 20 ชิ้น',
                                  style: TextStyle(
                                    fontSize: 10,
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
              ],
            ),
            // Discount Badge

            if (widget.oldPrice != null && widget.oldPrice! > widget.price)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(20)),
                  ),
                  child: KPText(
                    '-${((1 - widget.price / widget.oldPrice!) * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(
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
