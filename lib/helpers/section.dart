import 'package:equatable/equatable.dart';

class Section extends Equatable {
  final String sectionTitle;
  final SectionSource source;
  final bool isLightToolbar;

  const Section(
      {required this.sectionTitle,
      required this.source,
      this.isLightToolbar = false});

  @override
  List<Object?> get props => [sectionTitle, source, isLightToolbar];
}

enum SectionSource { fromScroll, fromButtonClick, fromBrowserAddressBar }
