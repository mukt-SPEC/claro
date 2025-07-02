import 'package:claro/utils/app_color.dart';
import 'package:claro/utils/app_copy.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Emptystate extends StatelessWidget {
  const Emptystate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Center(
          child: Text(
            AppCopies.noTasksHeader,
            style: GoogleFonts.afacad(fontSize: 18, color: AppColor.accent),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Text(
            AppCopies.noTasksMessage,
            textAlign: TextAlign.center,
            style: GoogleFonts.afacad(
              fontSize: 14,
              height: 1.5,
              color: AppColor.accent,
            ),
          ),
        ),
      ],
    );
  }
}
