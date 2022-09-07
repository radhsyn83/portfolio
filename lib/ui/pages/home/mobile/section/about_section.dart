import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/menus.dart';
import 'package:portfolio/helpers/section.dart';

class AboutSection extends StatelessWidget {
  final ValueNotifier<Section?> notifier;

  const AboutSection({Key? key, required this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var themes = Theme.of(context);

    return Stack(
      children: [
        Positioned(
          right: 0,
          top: screenSize.height * .5,
          height: 400,
          child: Image.asset("assets/images/masking_about_2.png"),
        ),
        // Expanded(
        // child: Image.asset(
        //   "assets/images/masking_about.png",
        //   height: 550,
        // ),
        // ),
        Positioned(
          child: Container(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 90),
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Me",
                  style: GoogleFonts.carme(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: themes.primaryColor),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "I’m Fathur Radhy and I am a Professional mobile Developer having 5 Years of Experience based in Indonesia.",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/masking_about.png",
                    height: screenSize.width * .8,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                    "\nI have started my career by becoming a Full Stack Developer using CI and Laravel. In 2017, I recognized that mobile is the beautiful things, I decide to become a mobile Android Developer. \n\nI started working at a company in Bandung as Android Developer using Native (Kotlin) and Cross-Platform (Flutter)",
                    style:
                        GoogleFonts.openSans(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: AboutItem.list()
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  e.icon,
                                  height: 18,
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Text(e.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
