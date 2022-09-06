import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  final String title;
  final String hint;
  final bool? textArea;

  const SearchField(
      {Key? key, required this.title, required this.hint, this.textArea})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("$title *",
            style: GoogleFonts.carme(fontSize: 14, color: Colors.grey)),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                )
              ]),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: textArea != null ? 20 : 4,
            bottom: textArea != null ? 10 : 0,
          ),
          child: TextField(
            textInputAction: TextInputAction.done,
            style: const TextStyle(fontSize: 14),
            minLines: textArea != null ? 5 : null,
            maxLines: textArea != null ? 5 : null,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                bottom: (kToolbarHeight - 45) / 2,
              ),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
