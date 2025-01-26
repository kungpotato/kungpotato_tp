import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

class KPImageSlide extends StatefulWidget {
  const KPImageSlide({this.images, super.key});

  final List<Widget>? images;

  @override
  State<KPImageSlide> createState() => _KPImageSlideState();
}

class _KPImageSlideState extends State<KPImageSlide> {
  final pageController = PageController();

  List<Widget> listBanners() => List.generate(
        3,
        (index) => Image.asset(
          'assets/images/banner.png',
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _startAutoSlide);
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 7), () {
      if (pageController.hasClients) {
        int nextPage = (pageController.page?.toInt() ?? 0) + 1;
        if (nextPage >= (widget.images?.length ?? listBanners().length)) {
          nextPage = 0;
        }
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        _startAutoSlide();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BannerCarousel(
      customizedBanners: widget.images ?? listBanners(),
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
      pageController: pageController,
      indicatorBottom: false,
    );
  }
}
