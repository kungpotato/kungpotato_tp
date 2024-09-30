import 'package:flutter/material.dart';
import 'package:kungpotato/core/design/molecules/course_card.dart';
import 'package:kungpotato/kungpotato.dart';

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
        const Center(
          child: Text('test'),
        ),
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
            child: KpProductList(
              children: List.generate(
                6,
                (index) => KpCourseCard(
                  title: 'ผักชี',
                  imageUrl:
                      'https://s359.kapook.com//pagebuilder/c66d622b-7652-4c23-8272-1d1083fa3ef0.jpg',
                  like: 2,
                  learning: 20,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KpCourseDetailPage(
                          product: KpCourse(
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

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        KpVideoPlayer(
          videoUrl:
              'https://jsoncompare.org/LearningContainer/SampleFiles/Video/MP4/Sample-MP4-Video-File-Download.mp4',
          thumbnail:
              'https://f.ptcdn.info/881/079/000/rqdl9y1v43NdNp69jXcX-o.jpg',
        ),
      ],
    );
  }
}
