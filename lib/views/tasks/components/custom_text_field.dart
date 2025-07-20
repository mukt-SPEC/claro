import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textController;
  final String? inputLabel;
  final String? hintText;
  final int? maxLines;
  final ValueChanged<String>? onFieldSubmitted, onChanged;
  final IconData? titleicon;
  const CustomTextField({
    this.titleicon,
    this.maxLines,
    this.onFieldSubmitted,
    this.onChanged,
    this.hintText,
    this.inputLabel,
    super.key,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              inputLabel!,
              style: GoogleFonts.afacad(color: AppColor.primary, fontSize: 16),
            ),
            Icon(titleicon),
          ],
        ),
        SizedBox(height: 8),
        TextFormField(
          
          controller: textController,
          maxLines: maxLines ?? 1,
          style: GoogleFonts.afacad(fontSize: 16),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(24),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Color(0xff121212), width: 1.5),
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
            hintText: hintText!,
            hintStyle: GoogleFonts.afacad(color: AppColor.accent),
          ),
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
