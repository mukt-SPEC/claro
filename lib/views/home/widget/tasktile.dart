import 'package:claro/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../utils/app_color.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key, required this.task, required this.onTap});
  final VoidCallback onTap;

  final Tasks task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color:
              widget.task.isCompleted! ? AppColor.primary : AppColor.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        duration: const Duration(milliseconds: 450),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          horizontalTitleGap: 16,
          leading: GestureDetector(
            onTap: (){},
            child: AnimatedContainer(
              padding: EdgeInsets.all(4),
              duration: const Duration(milliseconds: 350),
              decoration: BoxDecoration(
                color: AppColor.secondary,
                border:
                    widget.task.isCompleted!
                        ? Border.all(style: BorderStyle.none)
                        : Border.all(color: AppColor.accent),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.check,
                size: 16,
                color:
                    widget.task.isCompleted!
                        ? AppColor.primary
                        : AppColor.secondary,
              ),
            ),
          ),
          title: Text(
            widget.task.title ?? '',
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
                widget.task.description ?? '',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: AppColor.accent,
                      ),
                      SizedBox(width: 4),
                      Text(
                        DateFormat.yMMMEd().format(widget.task.creationDate!),
                        style: GoogleFonts.afacad(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: AppColor.accent,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 16,
                        color: AppColor.accent,
                      ),
                      Text(
                        DateFormat(
                          'hh :mm a',
                        ).format(widget.task.creationTime!),
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
            ],
          ),
        ),
      ),
    );
  }
}
