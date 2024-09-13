import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kungpotato/core/design/atoms/kp_button.dart';
import 'package:kungpotato/core/design/atoms/kp_gap.dart';
import 'package:kungpotato/core/design/atoms/kp_outline_button.dart';
import 'package:kungpotato/core/design/atoms/kp_text.dart';
import 'package:kungpotato/core/design/molecules/coupon.dart';
import 'package:kungpotato/core/design/molecules/kp_appbar.dart';
import 'package:kungpotato/core/design/molecules/product_card.dart';
import 'package:kungpotato/core/design/molecules/product_list.dart';
import 'package:kungpotato/core/design/template/product_detail.dart';
import 'package:kungpotato/core/widgets/image_slide.dart';
import 'package:kungpotato/core/widgets/kp_tab.dart';
import 'package:kungpotato/core/widgets/layout.dart';
import 'package:kungpotato/core/widgets/menu_scroll.dart';

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
        const ScrollShrinkWidget(),
        const SettingPage(),
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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const KPImageSlide(),
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
          Padding(
            padding: EdgeInsets.only(
              right: KPGapSize.extraLargeXlW.width,
              left: KPGapSize.extraLargeXlW.width,
            ),
            child: const KpCoupon(),
          ),
          KPGap.largeH(),
          Padding(
            padding: EdgeInsets.only(
              right: KPGapSize.extraLargeXlW.width,
              left: KPGapSize.extraLargeXlW.width,
            ),
            child: KpMenuScroll(
              isTwoLine: false,
              options: List.generate(
                10,
                (index) => const MenuScrollItem(),
              ),
            ),
          ),
          KPGap.largeH(),
          Padding(
            padding: EdgeInsets.only(
              right: KPGapSize.extraLargeXlW.width,
              left: KPGapSize.extraLargeXlW.width,
            ),
            child: KpProductList(
              children: List.generate(
                6,
                (index) => KpProductCard(
                  title: 'ผักชี',
                  imageUrl:
                      'https://s359.kapook.com//pagebuilder/c66d622b-7652-4c23-8272-1d1083fa3ef0.jpg',
                  price: 30,
                  rating: 2,
                  oldPrice: 50,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KpProductDetailPage(
                          product: KpProduct(
                            name: 'xxxxxx',
                            description: 'yyyyyyy',
                            price: 300,
                            images: List.generate(
                              3,
                              (index) => Image.asset(
                                'assets/images/banner.png',
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                            rating: 3,
                            reviewsCount: 4,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollShrinkWidget extends StatefulWidget {
  const ScrollShrinkWidget({super.key});

  @override
  ScrollShrinkWidgetState createState() => ScrollShrinkWidgetState();
}

class ScrollShrinkWidgetState extends State<ScrollShrinkWidget> {
  final ScrollController _scrollController = ScrollController();
  double _height = 230;
  final double _minHeight = 50;
  final double _maxHeight = 230;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      _height = 300.0 - _scrollController.offset;
      if (_height < _minHeight) {
        _height = _minHeight;
      } else if (_height > _maxHeight) {
        _height = _maxHeight;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: _height,
          color: Colors.blue,
          child: const SizedBox(
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 300,
                    height: 200,
                    child: Card(
                      child: Center(
                        child: Text('test'),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(width: 300, child: TextField()),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: KPGapSize.mediumW.width,
        right: KPGapSize.mediumW.width,
      ),
      child: const SizedBox(),
    );
  }
}
