// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final Color? backgroundColor, textColor;
  final String? buttonText;
  final VoidCallback onPressed;
  const AppButton({
    super.key,
    this.backgroundColor,
    this.buttonText,
    required this.onPressed,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),

      child: Text(
        buttonText!,
        style: GoogleFonts.afacad(
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
