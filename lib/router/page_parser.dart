import 'package:flutter/material.dart';
import 'package:portfolio/helpers/menus.dart';
import 'package:portfolio/router/page_configuration.dart';

class PageInformationParser extends RouteInformationParser<PageConfiguration> {
  final List<Menus> sections;

  PageInformationParser({required this.sections});

  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return PageConfiguration.home();
    } else if (uri.pathSegments.length == 1) {
      final first = uri.pathSegments[0].toLowerCase();
      if (_isValidSection(first)) {
        return PageConfiguration.home(section: first);
      } else {
        // return PageConfiguration.unknown();
        return PageConfiguration.home(section: sections.first.page.name);
      }
    } else {
      // return PageConfiguration.unknown();
      return PageConfiguration.home(section: sections.first.page.name);
    }
  }

  @override
  RouteInformation? restoreRouteInformation(PageConfiguration configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/unknown');
    } else if (configuration.isHomePage) {
      return RouteInformation(
        location:
            configuration.section == null ? '/' : '/${configuration.section}',
      );
    } else {
      return null;
    }
  }

  bool _isValidSection(String section) {
    final List<String> filterSection = sections.map((e) {
      return e.page.name;
    }).toList();
    return filterSection.contains(section);
  }
}
