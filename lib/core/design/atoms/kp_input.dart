import 'package:flutter/material.dart';
import 'package:kungpotato/kungpotato.dart';

class KpInputField extends StatelessWidget {
  const KpInputField({
    required this.label,
    this.formControl,
    this.validationMessages,
    super.key,
  });

  final String label;
  final FormControl<dynamic>? formControl;
  final Map<String, String Function(Object)>? validationMessages;

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
          child: ReactiveTextField(
            formControl: formControl,
            validationMessages: validationMessages,
            decoration: const InputDecoration(
              border: InputBorder.none,
              // Removes default border
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
