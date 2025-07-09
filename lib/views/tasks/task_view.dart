import 'package:claro/extensions/spacer.dart';
import 'package:claro/views/tasks/components/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';

import '../../model/todo_model.dart';
import '../../utils/app_color.dart';

class TaskView extends StatefulWidget {
  final TextEditingController? descriptionTextcontroller;
  final TextEditingController? titleTextcontroller;
  final Tasks? task;
  const TaskView({
    super.key,
    required this.descriptionTextcontroller,
    required this.titleTextcontroller,
    required this.task,
  });

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  bool doesTaskExist() {
    if (widget.titleTextcontroller?.text == null &&
        widget.descriptionTextcontroller?.text == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
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
            doesTaskExist() ? 'Add New task' : 'Update task',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Text(
                          'What\'s Next on Your Radar',
                          style: GoogleFonts.afacad(
                            fontSize: 20,
                            color: AppColor.accent,
                          ),
                        ),
                        24.h,

                        CustomTextField(
                          textController: widget.titleTextcontroller!,
                          inputLabel: 'Task title',
                          hintText: 'enter',
                          onChanged: (_) {},
                          onFieldSubmitted: (value) {},
                        ),

                        16.h,
                        CustomTextField(
                          textController: widget.descriptionTextcontroller!,
                          inputLabel: 'Description',
                          titleicon: Icons.bookmark_rounded,
                          maxLines: 6,
                          hintText: 'Write your task description',
                          onChanged: (_) {},
                          onFieldSubmitted: (value) {},
                        ),
                        16.h,

                        Row(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  DatePicker.showDatePicker(
                                    context,
                                    maxDateTime: DateTime(2030, 4, 5),
                                    minDateTime: DateTime.now(),
                                    initialDateTime: DateTime.now(),
                                    onConfirm: (dateTime, selectedIndex) {},
                                    onChange: (dateTime, selectedIndex) {},
                                  );
                                },
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Date',
                                          style: GoogleFonts.afacad(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          width: 80,
                                          //height: 40,
                                          decoration: BoxDecoration(
                                            color: AppColor.secondary,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Row(
                                            spacing: 4,
                                            children: [
                                              Icon(
                                                Icons.calendar_month_rounded,
                                                color: AppColor.primary,
                                              ),
                                              Text(
                                                'Set date',
                                                style: GoogleFonts.afacad(
                                                  color: AppColor.primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (_) {
                                      return SizedBox(
                                        height: 260,
                                        child: TimePickerWidget(
                                          initDateTime: DateTime.now(),
                                          onChange: (_, _) {},
                                          dateFormat: 'HH : mm',
                                          onConfirm: (_, _) {},
                                        ),
                                      );
                                    },
                                  );
                                },
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Time',
                                          style: GoogleFonts.afacad(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          width: 80,
                                          //height: 40,
                                          decoration: BoxDecoration(
                                            color: AppColor.secondary,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Row(
                                            spacing: 4,
                                            children: [
                                              Icon(
                                                Icons
                                                    .access_time_filled_rounded,
                                                color: AppColor.primary,
                                              ),
                                              Text(
                                                'Set time',
                                                style: GoogleFonts.afacad(
                                                  color: AppColor.primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Column(
                  children: [
                    SizedBox(height: 8),
                    Row(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade100,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),

                            child: Text(
                              'Delete task',
                              style: GoogleFonts.afacad(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),

                            child: Text(
                              'Create task',
                              style: GoogleFonts.afacad(
                                fontSize: 16,
                                color: AppColor.secondary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
