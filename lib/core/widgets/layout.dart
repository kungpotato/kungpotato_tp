import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kungpotato/core/design/molecules/kp_appbar.dart';
import 'package:kungpotato/core/theme/app_color.dart';
import 'package:kungpotato/core/widgets/kp_tab.dart';

class KpLayout extends StatefulWidget {
  const KpLayout({
    required this.tabs,
    required this.views,
    this.appbar,
    this.onChanged,
    super.key,
  });

  final List<KpTab> tabs;
  final List<Widget> views;
  final KPAppbar? appbar;
  final void Function(int index)? onChanged;

  @override
  State<KpLayout> createState() => _KpLayoutState();
}

class _KpLayoutState extends State<KpLayout>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.tabs.length, vsync: this);
    tabController.addListener(onChange);
  }

  @override
  void dispose() {
    tabController.removeListener(onChange);
    tabController.dispose();
    super.dispose();
  }

  void onChange() {
    if (widget.onChanged != null) {
      widget.onChanged!.call(tabController.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appbar,
      body: GFTabBarView(
        controller: tabController,
        children: widget.views.take(widget.tabs.length).toList(),
      ),
      bottomNavigationBar: GFTabBar(
        tabBarColor: KpColorSeed.instance.background,
        labelColor: KpColorSeed.instance.primary,
        unselectedLabelColor: Colors.grey,
        length: widget.tabs.length,
        controller: tabController,
        tabs: widget.tabs,
      ),
    );
  }
}
