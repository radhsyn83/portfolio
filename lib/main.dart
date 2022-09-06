import 'package:flutter/material.dart';
import 'package:portfolio/configure_web.dart'
    if (dart.library.html) '../configure_web.dart';
import 'package:portfolio/helpers/menus.dart';
import 'package:portfolio/router/page_parser.dart';
import 'package:portfolio/router/page_delagate.dart';
import 'package:portfolio/utils/theme_data.dart';

void main() {
  configureApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageRouterDelegate delegate;
  late PageInformationParser parser;
  final _section = Menus.list();

  @override
  void initState() {
    super.initState();
    delegate = PageRouterDelegate(sections: _section);
    parser = PageInformationParser(sections: _section);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Portfolio - Fathur Radhy",
      themeMode: ThemeMode.light,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
  }
}
