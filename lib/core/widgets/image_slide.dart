import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

class KPImageSlide extends StatelessWidget {
  const KPImageSlide({super.key});

  List<Widget> listBanners() => List.generate(
        3,
        (index) => Image.asset(
          'assets/images/banner.png',
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BannerCarousel(
      customizedBanners: listBanners(),
      height: 200,
      margin: EdgeInsets.zero,
      activeColor: theme.primaryColor,
      disableColor: Colors.grey,
      spaceBetween: 20,
      customizedIndicators: const IndicatorModel.animation(
        width: 10,
        height: 5,
        spaceBetween: 2,
        widthAnimation: 20,
      ),
      indicatorBottom: false,
    );
  }
}
