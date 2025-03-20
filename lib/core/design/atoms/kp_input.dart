import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        KPText.label1(label), // ขนาดตัวหนังสือจะถูกปรับด้วย .sp ใน KPText
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 43.h, // ปรับความสูงให้ responsive
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: theme.primaryColor, // กำหนดสีเส้นขอบ
                    width: 3.w, // ปรับความหนาของเส้นขอบ
                  ),
                ),
              ),
            ),
            Expanded(
              child: ReactiveTextField(
                formControl: formControl,
                validationMessages: validationMessages,
                decoration: InputDecoration(
                  border: InputBorder.none, // เอาเส้นขอบออก
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h, // ปรับระยะห่างแนวตั้ง
                    horizontal: 8.w, // ปรับระยะห่างแนวนอน
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
