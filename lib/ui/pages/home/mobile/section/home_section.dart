import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/menus.dart' as menus;
import 'package:portfolio/helpers/section.dart';
import 'package:portfolio/ui/widgets/custom_elevation.dart';

class HomeSection extends StatelessWidget {
  final ValueNotifier<Section?> notifier;
  const HomeSection({Key? key, required this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var themes = Theme.of(context);

    return Container(
        color: const Color(0xFF292C3D),
        height: screenSize.height,
        width: screenSize.width,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: -100,
              child: Image.asset(
                "assets/images/masking_home.png",
                height: screenSize.height * .8,
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenSize.height * .15),
                    Text(
                      "Hello there,",
                      style: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      "I'm Fathur.",
                      style: GoogleFonts.sora(
                          fontWeight: FontWeight.w800,
                          fontSize: 40,
                          color: Colors.yellow[500]),
                    ),
                    Text(
                      "Professional Mobile Developer based in \nIndonesia and love to play games",
                      style: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    // CustomElevation(
                    //   child: ElevatedButton(
                    //     style:
                    //         ElevatedButton.styleFrom(primary: Colors.yellow[600]),
                    //     onPressed: () {},
                    //     child: Padding(
                    //         padding: const EdgeInsets.symmetric(
                    //             horizontal: 15.0, vertical: 10.0),
                    //         child: Text(
                    //           'Download Resume',
                    //           style: GoogleFonts.sora(
                    //               color: themes.primaryColorDark,
                    //               fontWeight: FontWeight.bold),
                    //         )),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                left: screenSize.width * .2,
                right: screenSize.width * .2,
                child: Column(
                  children: [
                    CustomElevation(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow[600]),
                        onPressed: () {},
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0),
                            child: Text(
                              'Download Resume',
                              style: GoogleFonts.sora(
                                  color: themes.primaryColorDark,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    IconButton(
                        onPressed: () {
                          notifier.value = Section(
                            sectionTitle: menus.Page.about.name,
                            isLightToolbar: true,
                            source: SectionSource.fromButtonClick,
                          );
                        },
                        icon: Image.asset("assets/icons/dropdown.png"))
                  ],
                ))
          ],
        ));
  }
}
