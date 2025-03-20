import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KpProductList extends StatefulWidget {
  const KpProductList({required this.children, super.key});

  final List<Widget> children;

  @override
  State<KpProductList> createState() => _KpProductListState();
}

class _KpProductListState extends State<KpProductList> {
  @override
  Widget build(BuildContext context) {
    // คำนวณจำนวนคอลัมน์ตามขนาดจอ
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;
    if (MediaQuery.of(context).size.width > 900) {
      crossAxisCount = 4;
    }

    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 14.w, // ใช้ .w ให้ระยะห่าง responsive
        mainAxisSpacing: 14.h, // ใช้ .h ให้ระยะห่าง responsive
        childAspectRatio: (6 / 9).r, // ใช้ .r ให้สัดส่วน responsive
      ),
      children: widget.children,
    );
  }
}
