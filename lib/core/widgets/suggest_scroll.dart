import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kungpotato/core/theme/app_color.dart';
import 'package:kungpotato/core/widgets/kp_image.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

class KpSuggestScroll extends StatefulWidget {
  const KpSuggestScroll({
    required this.options,
    super.key,
    this.isTwoLine = false,
  });

  final bool isTwoLine;
  final List<SuggestItem> options;

  @override
  State<KpSuggestScroll> createState() => _SuggestShopScrollState();
}

class _SuggestShopScrollState extends State<KpSuggestScroll> {
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: widget.isTwoLine ? 160.h : 80.h, // ใช้ .h ให้ responsive
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 15.h, // ใช้ .h ให้ responsive
                crossAxisAlignment: WrapCrossAlignment.center,
                children: widget.options.map(cardItem).toList(),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          ScrollIndicator(
            scrollController: scrollController,
            width: 50.w,
            height: 5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.shade300,
            ),
            indicatorDecoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardItem(SuggestItem item) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: item.onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 35.w), // ใช้ .w ให้ responsive
        child: SizedBox(
          width: 150.w, // ใช้ .w ให้ responsive
          child: Row(
            children: [
              Flexible(
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: KpColorSeed.instance.background,
                    border: Border.all(
                      color: Colors.orange,
                    ),
                    borderRadius:
                        BorderRadius.circular(10.r), // ใช้ .r ให้ responsive
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: KpImage.network(
                      item.imageUrl,
                      width: 50.w,
                      height: 50.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.black87,
                        fontSize: 12.sp, // ใช้ .sp ให้ responsive
                      ),
                    ),
                    Text(
                      item.subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.black45,
                        fontSize: 10.sp, // ใช้ .sp ให้ responsive
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuggestItem {
  SuggestItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
  final void Function()? onTap;
}
