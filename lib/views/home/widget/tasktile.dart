import 'package:claro/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../utils/app_color.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key, required this.task});

  final Tasks task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  TextEditingController titleTextcontroller = TextEditingController();
  TextEditingController descriptionTextcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleTextcontroller.text = widget.task.title!;
    descriptionTextcontroller.text = widget.task.description!;
  }

  @override
  void dispose() {
    titleTextcontroller.dispose();
    descriptionTextcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color:
              widget.task.isCompleted! ? AppColor.secondary : AppColor.primary,
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
                color:
                    widget.task.isCompleted!
                        ? AppColor.primary
                        : AppColor.secondary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.check, size: 16, color: Colors.white),
            ),
          ),
          title: Text(
            titleTextcontroller.text,
            style: GoogleFonts.afacad(
              color:
                  widget.task.isCompleted!
                      ? AppColor.secondary
                      : AppColor.primary,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                descriptionTextcontroller.text,
                style: GoogleFonts.afacad(
                  color:
                      widget.task.isCompleted!
                          ? AppColor.secondary
                          : AppColor.accent,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: AppColor.accent),
                  SizedBox(width: 4),
                  Text(
                    DateFormat.yMMMEd().format(widget.task.creationDate!),
                    style: GoogleFonts.afacad(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: AppColor.accent,
                    ),
                  ),
                  Text(
                    DateFormat('hh :mm a').format(widget.task.creationTime!),
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
      ),
    );
  }
}
