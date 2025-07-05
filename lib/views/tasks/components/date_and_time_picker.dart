import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_color.dart';

class DateAndTimePicker extends StatelessWidget {
  
  const DateAndTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //width: double.infinity,
        padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
        //height: 48,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Time', style: GoogleFonts.afacad()),
              Container(
                padding: EdgeInsets.all(4),
                width: 80,
                //height: 40,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  spacing: 4,
                  children: [
                    Icon(
                      Icons.access_time_filled_rounded,
                      color: AppColor.secondary,
                    ),
                    Text(
                      'Set time',
                      style: GoogleFonts.afacad(color: AppColor.secondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
