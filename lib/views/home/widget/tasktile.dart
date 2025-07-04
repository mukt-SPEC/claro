import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColor.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      duration: const Duration(milliseconds: 450),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        horizontalTitleGap: 16,
        leading: GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            padding: EdgeInsets.all(4),
            duration: const Duration(milliseconds: 350),
            decoration: BoxDecoration(
              color: AppColor.primary,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.check, size: 16, color: Colors.white),
          ),
        ),
        title: Text('Task name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'task description',
              style: GoogleFonts.afacad(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xffb9b9b9),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: AppColor.accent),
                SizedBox(width: 4),
                Text(
                  'Due date',
                  style: GoogleFonts.afacad(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColor.accent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
