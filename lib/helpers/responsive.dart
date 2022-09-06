import 'package:flutter/material.dart';

const int smallScreenWidth = 852;
const int largeScreenWidth = 1200;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      this.mediumScreen,
      this.smallScreen})
      : super(key: key);

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > largeScreenWidth;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= smallScreenWidth &&
      MediaQuery.of(context).size.width <= largeScreenWidth;

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < smallScreenWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var maxWidth = constraints.maxWidth;
      return maxWidth > largeScreenWidth
          ? largeScreen
          : maxWidth >= smallScreenWidth && maxWidth <= largeScreenWidth
              ? mediumScreen ?? largeScreen
              : smallScreen ?? largeScreen;
    });
  }
}
