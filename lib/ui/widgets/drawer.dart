import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/menus.dart' as menus;
import 'package:portfolio/helpers/section.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class DrawerMenu extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<menus.Menus> sections;
  final ValueNotifier<Section?> sectionNotifier;

  const DrawerMenu(
      {Key? key,
      required this.sections,
      required this.sectionNotifier,
      required this.scaffoldKey})
      : super(key: key);

  int get sectionIndex {
    int index = sections.indexWhere((element) {
      final currentSection = sectionNotifier.value?.sectionTitle;
      return element.page.name == currentSection;
    });
    return index > -1 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    var themes = Theme.of(context);
    return ValueListenableBuilder(
        valueListenable: sectionNotifier,
        builder: (context, value, child) {
          return Container(
            color: themes.primaryColorDark,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        scaffoldKey.currentState!.closeDrawer();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: sections.mapIndexed((i, e) {
                    e.isActived = i == sectionIndex;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: InkWell(
                        onTap: () {
                          sectionNotifier.value = Section(
                            sectionTitle: e.page.name,
                            isLightToolbar:
                                e.page.name != sections.first.page.name,
                            source: SectionSource.fromButtonClick,
                          );
                          scaffoldKey.currentState!.closeDrawer();
                        },
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e.title,
                                style: GoogleFonts.sora(
                                    fontWeight:
                                        e.isActived ? FontWeight.w900 : null,
                                    color: e.isHover || e.isActived
                                        ? Colors.yellow[500]
                                        : Colors.white,
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
                                            color: Colors.yellow[500]),
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
        });
  }
}
