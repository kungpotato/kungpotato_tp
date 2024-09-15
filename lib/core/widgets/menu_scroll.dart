import 'package:flutter/material.dart';
import 'package:kungpotato/core/theme/app_color.dart';
import 'package:kungpotato/core/widgets/kp_image.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

class KpMenuScroll extends StatefulWidget {
  const KpMenuScroll({
    required this.menuList,
    super.key,
    this.isTwoLine = false,
    this.subMenuList,
    this.bgColor,
    this.indicator = true,
    this.index,
    this.onTap,
    this.isSlide = true,
  });

  final List<MenuItem> menuList;

  final List<MenuItem>? subMenuList;
  final bool isTwoLine;
  final Color? bgColor;
  final bool indicator;
  final int? index;
  final void Function(int i, MenuItem)? onTap;
  final bool isSlide;

  @override
  State<KpMenuScroll> createState() => _MenuScrollWidgetState();
}

class _MenuScrollWidgetState extends State<KpMenuScroll> {
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: widget.isTwoLine ? 180 : 80,
      decoration: BoxDecoration(color: widget.bgColor),
      child: !widget.isSlide
          ? Wrap(
              spacing: 2,
              runSpacing: 15,
              children: widget.menuList
                  .asMap()
                  .entries
                  .map(
                    (e) => SizedBox(
                      width: (MediaQuery.of(context).size.width - 50) / 5,
                      child: itemWidget(e.key, e.value),
                    ),
                  )
                  .toList(),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.vertical,
                      spacing: 15,
                      runSpacing: 25,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: widget.subMenuList == null
                          ? widget.menuList
                              .asMap()
                              .entries
                              .map(
                                (e) => itemWidget(e.key, e.value),
                              )
                              .toList()
                          : widget.subMenuList!
                              .asMap()
                              .entries
                              .map(
                                (e) => itemSubWidget(e.value, e.key),
                              )
                              .toList(),
                    ),
                  ),
                ),
                if (widget.indicator) const SizedBox(height: 5),
                if (widget.indicator)
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

  Widget itemWidget(int i, MenuItem item) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!.call(i, item);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: KpColorSeed.instance.background,
                border: Border.all(
                  color: theme.primaryColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: KpImage.network(
                  item.img,
                  width: 40,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Flexible(
            child: Text(
              item.name,
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: Colors.black87, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemSubWidget(MenuItem item, int i) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!.call(i, item);
        }
      },
      child: Container(
        decoration: widget.index == i
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 3,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: KpColorSeed.instance.background,
                  border: Border.all(
                    color: theme.primaryColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: KpImage.network(
                    item.img,
                    width: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Flexible(
              child: Text(
                item.name,
                style:
                    theme.textTheme.bodySmall?.copyWith(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  MenuItem({required this.name, required this.img, this.subMenuList});

  final String name;
  final String img;
  final List<MenuItem>? subMenuList;
}
