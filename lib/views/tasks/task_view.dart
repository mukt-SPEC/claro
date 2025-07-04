import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xffffffff),
          ),
        ),
        elevation: 0,
        backgroundColor: AppColor.primary,
        title: Text(
          'Add New task',
          style: GoogleFonts.afacad(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                'What\'s Next on Your Radar',
                style: GoogleFonts.afacad(fontSize: 16, color: AppColor.accent),
              ),
              Container(
                width: double.infinity,
                child: TextFormField(
                  maxLines: 6,
                  style: GoogleFonts.afacad(fontSize: 16),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
