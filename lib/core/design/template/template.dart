import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kungpotato/core/design/atoms/kp_button.dart';
import 'package:kungpotato/core/design/atoms/kp_gap.dart';
import 'package:kungpotato/core/design/atoms/kp_outline_button.dart';
import 'package:kungpotato/core/design/atoms/kp_text.dart';
import 'package:kungpotato/core/design/molecules/kp_appbar.dart';


class Template extends StatelessWidget {
  const Template({super.key});

  @override
  Widget build(BuildContext context) {
    void incrementCounter() {}

    return Scaffold(
      appBar: KPAppbar(
        title: KPText.head3('Template'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            KPText.subtitle('ปุ่ม'),
            Wrap(
              spacing: 8,
              children: [
                KPButton.primary(
                  text: 'Primary',
                  icon: const Icon(FontAwesome.tiktok_brand),
                  onPressed: incrementCounter,
                ),
                KPButton.secondary(
                  text: 'Secondary',
                  icon: const Icon(FontAwesome.tiktok_brand),
                  onPressed: incrementCounter,
                ),
                KPButton.tertiary(
                  text: 'Tertiary',
                  icon: const Icon(FontAwesome.tiktok_brand),
                  onPressed: incrementCounter,
                ),
                KPButton.danger(
                  text: 'Danger',
                  icon: const Icon(FontAwesome.tiktok_brand),
                  onPressed: incrementCounter,
                ),
                KPButton.success(
                  text: 'Success',
                  icon: const Icon(FontAwesome.tiktok_brand),
                  onPressed: incrementCounter,
                ),
                KPButton.warning(
                  text: 'Warning',
                  icon: const Icon(FontAwesome.tiktok_brand),
                  onPressed: incrementCounter,
                ),
                KPButton.info(
                  text: 'Info',
                  icon: const Icon(FontAwesome.tiktok_brand),
                  onPressed: incrementCounter,
                ),
              ],
            ),
            KPGap.largeH(),
            KPText.subtitle('ปุ่ม Outline'),
            Wrap(
              spacing: 8,
              children: [
                KPOutlineButton(
                  text: 'Primary',
                  onPressed: incrementCounter,
                ),
                KPOutlineButton.secondary(
                  text: 'Secondary',
                  onPressed: incrementCounter,
                ),
                KPOutlineButton.tertiary(
                  text: 'Tertiary',
                  onPressed: incrementCounter,
                ),
                KPOutlineButton.danger(
                  text: 'Danger',
                  onPressed: incrementCounter,
                ),
                KPOutlineButton.success(
                  text: 'Success',
                  onPressed: incrementCounter,
                ),
                KPOutlineButton.warning(
                  text: 'Warning',
                  onPressed: incrementCounter,
                ),
                KPOutlineButton.info(
                  text: 'Info',
                  onPressed: incrementCounter,
                ),
              ],
            ),
            KPGap.largeH(),
            KPText.subtitle('ตัวหนังสือ'),
            Wrap(
              spacing: 24,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                KPText.head1('ทดสอบ head1'),
                KPText.head2('ทดสอบ head2'),
                KPText.head3('ทดสอบ head3'),
                KPText.subtitle('ทดสอบ subtitle'),
                KPText.caption('ทดสอบ caption'),
                const KPText('ทดสอบ KPText'),
                KPText.text('ทดสอบ text'),
                KPText.error1('ทดสอบ error1'),
                KPText.error2('ทดสอบ error2'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
