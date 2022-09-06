import 'package:portfolio/helpers/menus.dart';

class PageConfiguration {
  final String? section;
  final bool unknown;

  PageConfiguration.home({String? section})
      : unknown = false,
        section = section ?? Menus.list().first.title;

  PageConfiguration.unknown()
      : unknown = true,
        section = null;

  bool get isUnknown => unknown == true;

  bool get isHomePage => unknown == false;
}
