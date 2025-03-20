import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              height: 43.h, // ใช้ .h ให้ปรับตามขนาดจอ
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: theme.primaryColor, // สีของเส้นขอบ
                    width: 3.w, // ปรับขนาดเส้นขอบ
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
                  decoration: InputDecoration(
                    enabled: false,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 8.w,
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
      isScrollControlled: true,
      // ให้รองรับการแสดงเต็มจอใน iPad
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r), // ปรับขนาดขอบมุม
        ),
      ),
      clipBehavior: Clip.hardEdge,
      builder: (BuildContext context) {
        return Container(
          height: 400.h, // ปรับขนาด Modal ตามหน้าจอ
          padding: EdgeInsets.all(20.w),
          child: ScrollDatePicker(
            selectedDate: DateTime.now(),
            locale: locale ?? const Locale('th'),
            onDateTimeChanged: (DateTime value) {
              formControl?.value = value;
            },
            viewType: viewType,
            maximumDate: maximumDate,
            minimumDate:
                minimumDate ?? DateTime.now().subtract(const Duration(days: 1)),
          ),
        );
      },
    );
  }
}
