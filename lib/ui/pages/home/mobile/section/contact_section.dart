import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/responsive.dart';
import 'package:portfolio/helpers/section.dart';
import 'package:portfolio/ui/widgets/custom_elevation.dart';
import 'package:portfolio/ui/widgets/search_field.dart';

class ContactSection extends StatelessWidget {
  final ValueNotifier<Section?> notifier;

  const ContactSection({Key? key, required this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var themes = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 80),
          width: screenSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: themes.primaryColorDark,
          ),
          padding: ResponsiveWidget.isLargeScreen(context)
              ? const EdgeInsets.symmetric(horizontal: 80, vertical: 50)
              : const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            children: [
              Text(
                "Contact",
                style: GoogleFonts.openSans(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                "Stay Connected",
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
              const SizedBox(height: 50),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Have a project to collaborate with?",
                        style: GoogleFonts.carme(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white)),
                    TextSpan(
                        text:
                            "\n\nDo not hesitate to contact me through the form here or by direct email on ",
                        style: GoogleFonts.carme(
                            height: 2, fontSize: 14, color: Colors.grey)),
                    TextSpan(
                        text: "radhsyn83@gmail.com ",
                        style: GoogleFonts.carme(
                            height: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.yellow)),
                    TextSpan(
                        text: "regardless of the subject. Or using form below",
                        style: GoogleFonts.carme(
                            height: 2, fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SearchField(
                title: "Your Name",
                hint: "Tell me your name",
              ),
              const SearchField(
                title: "Where can i reach you?",
                hint: "Input your email here",
              ),
              const SearchField(
                title: "What’s your message?",
                hint: "Tell me what you need",
                textArea: true,
              ),
              CustomElevation(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.yellow[600]),
                  onPressed: () {},
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Text(
                        'Send Message',
                        style: GoogleFonts.sora(
                            color: themes.primaryColorDark,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All righ reserved for Fathur Radhy",
                style: GoogleFonts.sora(color: themes.primaryColorDark),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Follow me on",
                    style: GoogleFonts.sora(color: themes.primaryColorDark),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    "assets/icons/instagram.png",
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    "assets/icons/linkedin.png",
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    "assets/icons/github.png",
                    height: 24,
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        )
      ],
    );
  }
}
