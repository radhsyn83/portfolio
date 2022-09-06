import 'package:flutter/material.dart';
import 'package:portfolio/helpers/menus.dart';
import 'package:portfolio/helpers/responsive.dart';
import 'package:portfolio/helpers/section.dart';
import 'package:portfolio/ui/pages/home/screen_large.dart';
import 'package:portfolio/ui/widgets/navbar_desktop.dart';

class HomeView extends StatelessWidget {
  final List<Menus> sections;
  final ValueNotifier<Section?> sectionNotifier;

  const HomeView({
    Key? key,
    required this.sections,
    required this.sectionNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: NavbarDesktop(
          sections: sections,
          sectionNotifier: sectionNotifier,
        ),
      ),
      body: ResponsiveWidget(
        largeScreen: ScreenLarge(
          sections: sections,
          sectionNotifier: sectionNotifier,
        ),
        smallScreen: Container(color: Colors.amber),
      ),
    );
  }
}
