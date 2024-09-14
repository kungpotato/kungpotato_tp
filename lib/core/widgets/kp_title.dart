import 'package:flutter/material.dart';

class KpTitle extends StatefulWidget {
  const KpTitle({
    required this.title,
    this.onTap,
    this.hasBg = false,
    super.key,
  });

  final String title;
  final bool? hasBg;
  final void Function()? onTap;

  @override
  State<KpTitle> createState() => _KpTitleState();
}

class _KpTitleState extends State<KpTitle> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 60,
      decoration: (widget.hasBg ?? false)
          ? BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.3),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (widget.onTap != null)
              InkWell(
                onTap: widget.onTap,
                child: Text(
                  'ดูทั้งหมด >',
                  style: theme.textTheme.labelMedium,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
