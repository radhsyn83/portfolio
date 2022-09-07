import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/menus.dart';
import 'package:portfolio/helpers/responsive.dart';
import 'package:portfolio/helpers/section.dart';

class ServicesSection extends StatelessWidget {
  final ValueNotifier<Section?> notifier;

  const ServicesSection({Key? key, required this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var themes = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 80),
      width: screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: themes.primaryColorDark,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Services",
            style: GoogleFonts.openSans(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            "Skill-Set",
            style: GoogleFonts.carme(
                fontSize: 34,
                fontWeight: FontWeight.w900,
                color: Colors.yellow[600]),
          ),
          const SizedBox(height: 10),
          Container(
            width: 60,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.yellow[600],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var e = SkillItem.list()[index];
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF292C3D),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ]),
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Column(children: [
                  Image.asset(
                    e.icon,
                    height: 50,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    e.title,
                    style: GoogleFonts.carme(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    e.desc,
                    style: GoogleFonts.carme(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ]),
              );
            },
            itemCount: SkillItem.list().length,
          ),
          const SizedBox(height: 50),
          Text(
            "Other Skill",
            style: GoogleFonts.carme(
                fontSize: 34,
                fontWeight: FontWeight.w900,
                color: Colors.yellow[600]),
          ),
          const SizedBox(height: 10),
          Container(
            width: 60,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.yellow[600],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var e = SkillItemOther.list()[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    e.title,
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  GridView.count(
                    padding: const EdgeInsets.only(top: 10),
                    childAspectRatio: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: e.items
                        .map((c) => Row(
                              children: [
                                Image.asset(
                                  "assets/icons/check.png",
                                  height: 14,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  c,
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
            itemCount: SkillItemOther.list().length,
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: SkillItemOther.list()
          //       .map(
          //         (e) => Expanded(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               Text(
          //                 e.title,
          //                 style: GoogleFonts.openSans(
          //                     fontSize: 16,
          //                     fontWeight: FontWeight.bold,
          //                     color: Colors.white),
          //               ),
          //               GridView.count(
          //                 padding: const EdgeInsets.only(top: 10),
          //                 childAspectRatio: 5,
          //                 shrinkWrap: true,
          //                 crossAxisCount: 2,
          //                 children: e.items
          //                     .map((c) => Row(
          //                           children: [
          //                             Image.asset(
          //                               "assets/icons/check.png",
          //                               height: 14,
          //                             ),
          //                             const SizedBox(width: 10),
          //                             Text(
          //                               c,
          //                               style: GoogleFonts.openSans(
          //                                   fontSize: 14,
          //                                   fontWeight: FontWeight.normal,
          //                                   color: Colors.grey),
          //                             ),
          //                           ],
          //                         ))
          //                     .toList(),
          //               )
          //             ],
          //           ),
          //         ),
          //       )
          //       .toList(),
          // )
        ],
      ),
    );
  }
}
