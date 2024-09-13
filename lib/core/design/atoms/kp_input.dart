import 'package:flutter/material.dart';
import 'package:kungpotato/core/design/atoms/atoms.dart';

class KpInputField extends StatelessWidget {
  const KpInputField({
    required this.label,
    this.controller,
    super.key,
  });

  final String label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KPText.label(label),
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: theme.primaryColor, // Customize the border color
                width: 3, // Customize the border width
              ),
            ),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none, // Removes default border
              contentPadding: EdgeInsets.symmetric(
                vertical: 10, // Vertical padding (top and bottom)
                horizontal: 8, // Horizontal padding (left and right)
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
