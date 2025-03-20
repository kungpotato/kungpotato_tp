import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({this.onTap, this.colors, super.key});

  final void Function()? onTap;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r), // ใช้ .r ให้ responsive
          border: Border.all(color: theme.primaryColor),
          gradient: colors != null
              ? LinearGradient(
                  colors: colors!,
                )
              : null,
        ),
        width: double.maxFinite,
        child: TextFormField(
          enabled: false,
          decoration: InputDecoration(
            hintText: 'ค้นหา',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w, // ใช้ .w ให้ padding responsive
              vertical: 10.h, // ใช้ .h ให้ padding responsive
            ),
            hintStyle: theme.textTheme.labelMedium?.copyWith(
              color: theme.primaryColor,
              fontSize: 14.sp, // ใช้ .sp ให้ตัวอักษรปรับอัตโนมัติ
            ),
            fillColor: Colors.transparent,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r), // ใช้ .r
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r), // ใช้ .r
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r), // ใช้ .r
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
