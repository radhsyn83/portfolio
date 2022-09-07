import 'package:flutter/material.dart';
import 'package:portfolio/helpers/menus.dart';
import 'package:portfolio/helpers/responsive.dart';
import 'package:portfolio/helpers/section.dart';
import 'package:portfolio/ui/pages/home/desktop/screen_large.dart';
import 'package:portfolio/ui/pages/home/mobile/small_screen.dart';
import 'package:portfolio/ui/widgets/drawer.dart';
import 'package:portfolio/ui/widgets/navbar_desktop.dart';
import 'package:portfolio/ui/widgets/navbar_mobile.dart';

class HomeView extends StatelessWidget {
  final List<Menus> sections;
  final ValueNotifier<Section?> sectionNotifier;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeView({
    Key? key,
    required this.sections,
    required this.sectionNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: ResponsiveWidget.isSmallScreen(context)
            ? NavbarMobile(
                scaffoldKey: _scaffoldKey,
              )
            : NavbarDesktop(
                sections: sections,
                sectionNotifier: sectionNotifier,
              ),
      ),
      drawer: const Drawer(child: DrawerMenu()),
      body: ResponsiveWidget(
        largeScreen: ScreenLarge(
          sections: sections,
          sectionNotifier: sectionNotifier,
        ),
        smallScreen: ScreenSmall(
          sections: sections,
          sectionNotifier: sectionNotifier,
        ),
      ),
    );
  }
}
