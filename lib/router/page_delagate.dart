import 'package:flutter/material.dart';
import 'package:portfolio/helpers/menus.dart' as menus;
import 'package:portfolio/helpers/section.dart';
import 'package:portfolio/router/page_configuration.dart';
import 'package:portfolio/ui/pages/home/home.dart';

class PageRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final List<menus.Menus> sections;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late Page _homePage;

  String get defaultSection => sections.first.page.name;

  PageRouterDelegate({required this.sections}) {
    _homePage = MaterialPage(
      key: const ValueKey<String>("HomeView"),
      child: HomeView(
        sections: sections,
        sectionNotifier: _sectionNotifier,
      ),
    );

    Listenable.merge([
      _unknownStateNotifier,
      _sectionNotifier,
    ]).addListener(() {
      notifyListeners();
    });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  PageConfiguration get currentConfiguration {
    if (_unknownStateNotifier.value == true) {
      return PageConfiguration.unknown();
    } else {
      return PageConfiguration.home(
        section: _sectionNotifier.value?.sectionTitle,
      );
    }
  }

  // App state fields
  final ValueNotifier<Section?> _sectionNotifier = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    // final section = _sectionNotifier.value;
    return Navigator(
      key: navigatorKey,
      pages: _unknownStateNotifier.value == true
          ? [
              const MaterialPage(
                key: ValueKey<String>("Unknown"),
                child: Center(child: Text("Unknown")),
              )
            ]
          : [
              _homePage,
            ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    if (configuration.unknown) {
      _unknownStateNotifier.value = true;
      _sectionNotifier.value = null;
    } else if (configuration.isHomePage) {
      _unknownStateNotifier.value = false;
      _sectionNotifier.value = Section(
        sectionTitle: configuration.section ?? defaultSection,
        isLightToolbar: configuration.section != defaultSection,
        source: SectionSource.fromBrowserAddressBar,
      );
    }
  }
}
