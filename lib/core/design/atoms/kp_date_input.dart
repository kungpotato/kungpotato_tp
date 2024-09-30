import 'package:flutter/material.dart';
import 'package:kungpotato/kungpotato.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class KpDateInputField extends StatelessWidget {
  const KpDateInputField({
    required this.label,
    this.formControl,
    this.validationMessages,
    this.locale,
    this.viewType,
    this.maximumDate,
    this.minimumDate,
    super.key,
  });

  final String label;
  final Locale? locale;
  final FormControl<dynamic>? formControl;
  final Map<String, String Function(Object)>? validationMessages;
  final List<DatePickerViewType>? viewType;
  final DateTime? maximumDate;
  final DateTime? minimumDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KPText.label1(label),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 43,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: theme.primaryColor, // Customize the border color
                    width: 3, // Customize the border width
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  handleShowBottomSheet(context);
                },
                child: ReactiveTextField(
                  formControl: formControl,
                  validationMessages: validationMessages,
                  decoration: const InputDecoration(
                    enabled: false,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void handleShowBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      builder: (BuildContext context) {
        return ScrollDatePicker(
          selectedDate: DateTime.now(),
          locale: locale ?? const Locale('th'),
          onDateTimeChanged: (DateTime value) {
            formControl?.value = value;
          },
          viewType: viewType,
          maximumDate: maximumDate,
          minimumDate:
              minimumDate ?? DateTime.now().subtract(const Duration(days: 1)),
        );
      },
    );
  }
}
