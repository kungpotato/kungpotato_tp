import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      bottomNavigationBar: Container(
        height: 56.h, // Responsive tab bar height
        color: KpColorSeed.instance.background,
        child: GFTabBar(
          tabBarColor: KpColorSeed.instance.background,
          labelColor: KpColorSeed.instance.primary,
          unselectedLabelColor: Colors.grey,
          length: widget.tabs.length,
          controller: tabController,
          indicatorWeight: 3.h,
          // Set indicator thickness
          labelStyle: TextStyle(
            fontSize: 14.sp, // Responsive text size
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12.sp, // Responsive unselected text size
          ),
          tabs: widget.tabs,
        ),
      ),
    );
  }
}
