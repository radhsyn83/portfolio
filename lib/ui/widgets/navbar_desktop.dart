import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/menus.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:portfolio/helpers/section.dart';

class NavbarDesktop extends StatefulWidget {
  final List<Menus> sections;
  final ValueNotifier<Section?> sectionNotifier;

  const NavbarDesktop(
      {Key? key, required this.sectionNotifier, required this.sections})
      : super(key: key);

  @override
  State<NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<NavbarDesktop> {
  late List<Menus> menus;
  @override
  void initState() {
    menus = widget.sections;
    super.initState();
  }

  int get sectionIndex {
    int index = widget.sections.indexWhere((element) {
      final currentSection = widget.sectionNotifier.value?.sectionTitle;
      return element.page.name == currentSection;
    });
    return index > -1 ? index : 0;
  }

  bool get isLightToolbar {
    return widget.sectionNotifier.value?.isLightToolbar ?? false;
  }

  @override
  Widget build(BuildContext context) {
    var themes = Theme.of(context);

    return ValueListenableBuilder(
      valueListenable: widget.sectionNotifier,
      builder: (context, value, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.symmetric(
              horizontal: 100, vertical: isLightToolbar ? 10 : 50),
          decoration: BoxDecoration(
              color: isLightToolbar ? Colors.white : Colors.transparent,
              boxShadow: isLightToolbar
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ]
                  : null),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 50,
              ),
              const SizedBox(width: 50),
              Row(
                children: menus.mapIndexed((i, e) {
                  e.isActived = i == sectionIndex;
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: InkWell(
                      onTap: () {
                        widget.sectionNotifier.value = Section(
                          sectionTitle: e.page.name,
                          isLightToolbar: e.page.name != menus.first.page.name,
                          source: SectionSource.fromButtonClick,
                        );
                      },
                      onHover: (isHover) => setState(() {
                        e.isHover = isHover;
                      }),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              e.title,
                              style: GoogleFonts.sora(
                                  fontWeight:
                                      e.isActived ? FontWeight.bold : null,
                                  color: e.isHover || e.isActived
                                      ? themes.primaryColor
                                      : Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Opacity(
                                  opacity: e.isHover || e.isActived ? 1 : 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Container(
                                      height: 6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: themes.primaryColor,
                                      ),
                                    ),
                                  )))
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
