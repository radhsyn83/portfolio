import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/menus.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:portfolio/helpers/responsive.dart';
import 'package:portfolio/helpers/section.dart';

class PortolioSection extends StatefulWidget {
  final ValueNotifier<Section?> notifier;

  const PortolioSection({Key? key, required this.notifier}) : super(key: key);

  @override
  State<PortolioSection> createState() => _PortolioSectionState();
}

class _PortolioSectionState extends State<PortolioSection> {
  var tabs = Menus.tabs();
  var pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themes = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(left: 100, right: 100, top: 80),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Portfolio",
              style: GoogleFonts.openSans(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tabs
                  .mapIndexed(
                    (i, e) => InkWell(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      onTap: () {
                        tabs.activeAt(i);
                        pageController.animateToPage(i,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut);
                      },
                      onHover: (isHover) => setState(() {
                        e.isHover = isHover;
                      }),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              e.title,
                              style: GoogleFonts.sora(
                                  fontWeight:
                                      e.isActived ? FontWeight.bold : null,
                                  color: e.isHover || e.isActived
                                      ? themes.primaryColorDark
                                      : Colors.grey,
                                  fontSize: 34),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            width: 60,
                            child: Opacity(
                              opacity: e.isHover || e.isActived ? 1 : 0,
                              child: Container(
                                width: 60,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: themes.primaryColorDark,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 50),
            ExpandablePageView(
              controller: pageController,
              onPageChanged: (i) {
                setState(() {
                  tabs.activeAt(i);
                });
              },
              children: [
                _Projects(
                  projects: ProjectItem.mobile(),
                ),
                _Projects(
                  projects: ProjectItem.mobile(),
                )
              ],
            )
          ]),
    );
  }
}

class _Projects extends StatefulWidget {
  final List<ProjectItem> projects;
  const _Projects({Key? key, required this.projects}) : super(key: key);

  @override
  State<_Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<_Projects> {
  List<List<ProjectItem>> splits() {
    List<List<ProjectItem>> chunks = [];
    int chunkSize = ResponsiveWidget.isLargeScreen(context) ? 6 : 4;
    for (var i = 0; i < widget.projects.length; i += chunkSize) {
      chunks.add(widget.projects.sublist(
          i,
          i + chunkSize > widget.projects.length
              ? widget.projects.length
              : i + chunkSize));
    }
    return chunks;
  }

  @override
  Widget build(BuildContext context) {
    var themes = Theme.of(context);
    var items = splits();
    return CarouselSlider.builder(
        itemCount: items.length,
        itemBuilder: (context, index, realIndex) {
          var item = items[index];
          return GridView.count(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            crossAxisCount: ResponsiveWidget.isLargeScreen(context) ? 3 : 2,
            children: item
                .map((c) => InkWell(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      onTap: () {},
                      onHover: (isHover) => setState(() {
                        c.isHover = isHover;
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Stack(
                              children: [
                                Image.asset(c.mockup),
                                Positioned.fill(
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 100),
                                    opacity: c.isHover ? 1 : 0,
                                    child: Container(
                                      color: themes.primaryColorDark
                                          .withOpacity(.5),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              c.title,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.sora(
                                                  shadows: [
                                                    Shadow(
                                                      offset:
                                                          const Offset(4, 5.0),
                                                      blurRadius: 5.0,
                                                      color: themes
                                                          .primaryColorDark,
                                                    ),
                                                  ],
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 24),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
        },
        options: CarouselOptions(
          aspectRatio: ResponsiveWidget.isLargeScreen(context) ? 6 / 4 : 1 / 1,
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
        ));
  }
}
