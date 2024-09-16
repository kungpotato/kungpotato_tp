import 'package:flutter/material.dart';

class KpProductList extends StatefulWidget {
  const KpProductList({required this.children, super.key});

  final List<Widget> children;

  @override
  State<KpProductList> createState() => _KpProductListState();
}

class _KpProductListState extends State<KpProductList> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      primary: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        childAspectRatio: 6 / 9,
        mainAxisSpacing: 14,
      ),
      children: widget.children,
    );
  }
}
