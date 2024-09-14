import 'package:flutter/material.dart';
import 'package:kungpotato/core/theme/app_color.dart';
import 'package:kungpotato/core/widgets/kp_image.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

class KpSuggestScroll extends StatefulWidget {
  const KpSuggestScroll(
      {required this.options, super.key, this.isTwoLine = false});

  final bool isTwoLine;
  final List<SuggestItem> options;

  @override
  State<KpSuggestScroll> createState() => _SuggestShopScrollState();
}

class _SuggestShopScrollState extends State<KpSuggestScroll> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: widget.isTwoLine ? 160 : 80,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 15,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: widget.options.map(cardItem).toList(),
              ),
            ),
          ),
          const SizedBox(height: 5),
          ScrollIndicator(
            scrollController: scrollController,
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
            ),
            indicatorDecoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardItem(SuggestItem item) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 35),
        child: SizedBox(
          width: 150,
          child: Row(
            children: [
              Flexible(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: KpColorSeed.instance.background,
                    border: Border.all(
                      color: Colors.orange,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: KpImage.network(
                      item.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.black87),
                    ),
                    Text(
                      item.subtitle,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.black45),
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
  });

  final String title;
  final String subtitle;
  final String imageUrl;
}
