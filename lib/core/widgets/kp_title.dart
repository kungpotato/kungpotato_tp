import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 60.h, // ใช้ .h ให้ responsive
      decoration: (widget.hasBg ?? false)
          ? BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.5),
            )
          : null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        // ใช้ .w ให้ responsive
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp, // ใช้ .sp ให้ responsive
              ),
            ),
            if (widget.onTap != null)
              InkWell(
                onTap: widget.onTap,
                child: Text(
                  'ดูทั้งหมด >',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontSize: 14.sp, // ใช้ .sp ให้ responsive
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
