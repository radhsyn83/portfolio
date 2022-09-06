import 'package:flutter/material.dart';
import 'package:portfolio/helpers/menus.dart' as menus;
import 'package:portfolio/helpers/section.dart';
import 'package:portfolio/ui/pages/home/section/about_section.dart';
import 'package:portfolio/ui/pages/home/section/contact_section.dart';
import 'package:portfolio/ui/pages/home/section/home_section.dart';
import 'package:portfolio/ui/pages/home/section/portfolio_section.dart';
import 'package:portfolio/ui/pages/home/section/services_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScreenLarge extends StatefulWidget {
  final List<menus.Menus> sections;
  final ValueNotifier<Section?> sectionNotifier;

  const ScreenLarge({
    Key? key,
    required this.sections,
    required this.sectionNotifier,
  }) : super(key: key);

  @override
  State<ScreenLarge> createState() => _ScreenLargeState();
}

class _ScreenLargeState extends State<ScreenLarge> {
  /// Controller to scroll or jump to a particular item.
  final ItemScrollController _itemScrollController = ItemScrollController();

  /// Listener that reports the position of items when the list is scrolled.
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  int get trailingIndex {
    /// Determine the first visible item by finding the item with the
    /// smallest trailing edge that is greater than 0.  i.e. the first
    /// item whose trailing edge in visible in the viewport.
    final firstVisibleSectionIndex = _itemPositionsListener.itemPositions.value
        .where((ItemPosition position) => position.itemTrailingEdge > 0)
        .reduce((ItemPosition min, ItemPosition position) =>
            position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
        .index;
    return firstVisibleSectionIndex;
  }

  int get sectionIndex {
    int index = widget.sections.indexWhere((element) {
      final currentSection = widget.sectionNotifier.value?.sectionTitle;
      return element.page.name == currentSection;
    });
    return index > -1 ? index : 0;
  }

  bool get _lightToolbar {
    final offset = _itemPositionsListener.itemPositions.value.first;
    if (offset.index < 1) {
      return offset.itemTrailingEdge < 0.9;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToIndex();
      widget.sectionNotifier.addListener(() {
        final fromScroll =
            widget.sectionNotifier.value?.source == SectionSource.fromScroll;
        if (_itemScrollController.isAttached && !fromScroll) {
          _scrollToIndex();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is UserScrollNotification) {
          widget.sectionNotifier.value = Section(
              sectionTitle: widget.sections[trailingIndex].page.name,
              isLightToolbar: _lightToolbar,
              source: SectionSource.fromScroll);
        }
        return true;
      },
      child: _scrollablePositionedList(),
    );
  }

  ScrollablePositionedList _scrollablePositionedList() {
    return ScrollablePositionedList.builder(
      itemScrollController: _itemScrollController,
      itemPositionsListener: _itemPositionsListener,
      itemCount: widget.sections.length,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final section = widget.sections[index];
        Widget content = Container();
        switch (section.page) {
          case menus.Page.home:
            content = HomeSection(notifier: widget.sectionNotifier);
            break;
          case menus.Page.about:
            content = AboutSection(notifier: widget.sectionNotifier);
            break;
          case menus.Page.services:
            content = ServicesSection(notifier: widget.sectionNotifier);
            break;
          case menus.Page.portfolio:
            content = PortolioSection(notifier: widget.sectionNotifier);
            break;
          case menus.Page.contact:
            content = ContactSection(notifier: widget.sectionNotifier);
            break;
          default:
        }
        return content;
      },
    );
  }

  void _scrollToIndex() {
    _itemScrollController.scrollTo(
      index: sectionIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
    );
  }
}
