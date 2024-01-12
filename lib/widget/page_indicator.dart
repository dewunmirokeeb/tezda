import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tezda_assessment/constant/colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required this.controller,
    this.activeDotColor,
    this.pageCount,
    this.dotColor,
    this.dotHeight,
    this.dotRadius,
    this.dotWidth,
  }) : super(key: key);

  final PageController controller;
  final Color? dotColor;
  final Color? activeDotColor;
  final int? pageCount;
  final double? dotWidth;
  final double? dotHeight;
  final double? dotRadius;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      axisDirection: Axis.horizontal,
      count: pageCount ?? 3,
      effect: ExpandingDotsEffect(
        dotWidth: dotWidth ?? 16,
        dotHeight: dotHeight ?? 16,
        radius: dotRadius ?? 16,
        activeDotColor: activeDotColor ?? AppColors.primaryColor,
        dotColor: dotColor ?? const Color(0xFFE4E4E4),
        spacing: 10,
        paintStyle: PaintingStyle.fill,
      ),
    );
  }
}
