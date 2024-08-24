import 'package:flutter/material.dart';

class KpMenuScroll extends StatelessWidget {
  const KpMenuScroll({required this.options, super.key, this.isTwoLine = true});

  final List<MenuScrollItem> options;

  final bool isTwoLine;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isTwoLine ? 160 : 80,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.vertical,
          spacing: 15,
          runSpacing: 30,
          children: options,
        ),
      ),
    );
  }
}

class MenuScrollItem extends StatelessWidget {
  const MenuScrollItem({super.key, this.onTap, this.title, this.imageUr});

  final void Function()? onTap;
  final String? title;
  final String? imageUr;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageUr != null)
            Flexible(
              flex: 3,
              child: Image.network(
                imageUr!,
                width: 45,
              ),
            ),
          if (imageUr == null)
            Flexible(
              flex: 3,
              child: Image.asset(
                'assets/images/diet.png',
                width: 45,
              ),
            ),
          const SizedBox(height: 6),
          Flexible(
            child: Text(
              title ?? 'ทดสอบ',
              style: theme.textTheme.bodySmall?.copyWith(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
