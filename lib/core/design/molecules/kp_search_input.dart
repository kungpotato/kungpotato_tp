import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(15),
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
            contentPadding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            hintStyle: theme.textTheme.labelMedium
                ?.copyWith(color: theme.primaryColor),
            fillColor: Colors.transparent,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
