import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kungpotato/core/design/atoms/kp_button.dart';
import 'package:kungpotato/core/design/atoms/kp_gap.dart';
import 'package:kungpotato/core/design/atoms/kp_outline_button.dart';
import 'package:kungpotato/core/design/atoms/kp_text.dart';
import 'package:kungpotato/core/design/molecules/kp_appbar.dart';
import 'package:kungpotato/core/design/molecules/product_card.dart';
import 'package:kungpotato/core/design/molecules/product_list.dart';
import 'package:kungpotato/core/widgets/kp_tab.dart';
import 'package:kungpotato/core/widgets/layout.dart';

class Template extends StatelessWidget {
  const Template({super.key});

  void incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return KpLayout(
      appbar: KPAppbar.gradientRound(
        title: KPText.head3('Template'),
      ),
      views: [
        _TabOne(),
        Center(
          child: KPText.head3('2'),
        ),
        Center(
          child: KPText.head3('3'),
        ),
      ],
      tabs: const [
        KpTab(
          text: 'Home',
          icon: Icons.home_outlined,
        ),
        KpTab(
          text: 'Favotire',
          icon: Icons.favorite_border_outlined,
        ),
        KpTab(
          text: 'Setting',
          icon: Icons.settings_outlined,
        ),
      ],
    );
  }
}

class _TabOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void incrementCounter() {}
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
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
            KPGap.largeH(),
            KPText.subtitle('Input'),
            KPGap.largeH(),
            KpProductList(
              children: List.generate(
                6,
                (index) => const KpProductCard(
                  title: 'ผักชี',
                  imageUrl:
                      'https://s359.kapook.com//pagebuilder/c66d622b-7652-4c23-8272-1d1083fa3ef0.jpg',
                  price: 30,
                  rating: 2,
                  oldPrice: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
