import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          height: 80,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/images/discount.jpg',
                          fit: BoxFit.cover,
                          width: 75,
                          height: 75,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              title ?? 'จ่ายน้อยลง คุ้มค่ามากขึ้น',
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(color: Colors.black),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              subTitle ??
                                  'ระบบจะมอบส่วนลดให้อัตโนมัติ รับส่วนลดได้เลย!!!',
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              price ?? '200฿',
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.bold,
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
                  width: 25,
                  height: 20,
                  child: Icon(
                    icon ?? Icons.airplanemode_active_outlined,
                    color: Colors.green,
                    size: 16,
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
