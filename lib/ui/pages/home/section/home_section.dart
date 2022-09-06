import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/responsive.dart';
import 'package:portfolio/helpers/section.dart';
import 'package:portfolio/ui/widgets/custom_elevation.dart';

class HomeSection extends StatelessWidget {
  final ValueNotifier<Section?> notifier;
  const HomeSection({Key? key, required this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var themes = Theme.of(context);
    var isLarge = ResponsiveWidget.isLargeScreen(context);

    return Container(
      color: Theme.of(context).backgroundColor,
      height: screenSize.height,
      width: screenSize.width,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/masking_home.png",
              height: screenSize.height,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello there,",
                  style: GoogleFonts.openSans(
                      color: Colors.grey, fontSize: isLarge ? 20 : 14),
                ),
                Text(
                  "I'm Fathur.",
                  style: GoogleFonts.sora(
                      fontWeight: FontWeight.w800, fontSize: isLarge ? 80 : 60),
                ),
                Text(
                  "Professional Mobile Developer based in \nIndonesia and love to play games",
                  style: GoogleFonts.openSans(
                      color: Colors.grey, fontSize: isLarge ? 20 : 14),
                ),
                const SizedBox(height: 20),
                CustomElevation(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.yellow[600]),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
