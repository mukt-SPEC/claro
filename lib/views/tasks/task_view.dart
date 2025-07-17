import 'package:claro/extensions/spacer.dart';
import 'package:claro/utils/constants.dart';
import 'package:claro/views/tasks/components/custom_text_field.dart';
import 'package:claro/views/tasks/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:intl/intl.dart';

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
  var title;
  var subtitle;
  DateTime? date;
  DateTime? time;

  String showTime(DateTime? time) {
    if (widget.task?.creationTime == null) {
      if (time == null) {
        return DateFormat('hh mm a').format(DateTime.now()).toString();
      } else {
        return DateFormat('hh mm a').format(time).toString();
      }
    } else {
      return DateFormat(
        'hh mm a',
      ).format(widget.task!.creationTime!).toString();
    }
  }

  String showDate(DateTime? date) {
    if (widget.task?.creationDate == null) {
      if (date == null) {
        return DateFormat.yMMMEd().format(DateTime.now()).toString();
      } else {
        return DateFormat.yMMMEd().format(date).toString();
      }
    } else {
      return DateFormat.yMMMEd().format(widget.task!.creationDate!).toString();
    }
  }

  DateTime showDateAsDateTime(DateTime? date) {
    if (widget.task?.creationDate == null) {
      if (date == null) {
        return DateTime.now();
      } else {
        return date;
      }
    } else {
      return widget.task!.creationDate!;
    }
  }

  dynamic isTaskAlreadyExisting() {
    if (widget.titleTextcontroller?.text != null &&
        widget.descriptionTextcontroller?.text != null) {
      try {
        widget.titleTextcontroller?.text = title;
        widget.descriptionTextcontroller?.text = subtitle;

        widget.task?.save();
      } catch (e) {
        updateTaskWarning(context);
      }
    } else {
      if (title != null && subtitle != null) {
        var task = Tasks.copyWith(
          title: title,
          description: subtitle,
          creationDate: date,
          creationTime: time,
        );
      } else {
        emptyWarning(context);
      }
    }
  }

  bool doesTaskExist() {
    if (widget.titleTextcontroller?.text == null &&
        widget.descriptionTextcontroller?.text == null) {
      return true;
    } else {
      return false;
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
                          doesTaskExist()
                              ? 'What\'s Next on Your Radar'
                              : 'Update task',

                          style: GoogleFonts.afacad(
                            fontSize: 20,
                            color: AppColor.accent,
                          ),
                        ),
                        24.h,

                        CustomTextField(
                          textController: widget.titleTextcontroller,
                          inputLabel: 'Task title',
                          hintText: 'enter',
                          onChanged: (String title) {
                            title = title;
                          },
                          onFieldSubmitted: (String title) {
                            title = title;
                          },
                        ),

                        16.h,
                        CustomTextField(
                          textController: widget.descriptionTextcontroller,
                          inputLabel: 'Description',
                          titleicon: Icons.bookmark_rounded,
                          maxLines: 6,
                          hintText: 'Write your task description',
                          onChanged: (String subtitle) {
                            subtitle = subtitle;
                          },
                          onFieldSubmitted: (String subtitle) {
                            subtitle = subtitle;
                          },
                        ),
                        16.h,

                        Column(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                DatePicker.showDatePicker(
                                  context,
                                  maxDateTime: DateTime(2030, 4, 5),
                                  minDateTime: DateTime.now(),
                                  initialDateTime: showDateAsDateTime(date),
                                  onConfirm: (dateTime, _) {
                                    setState(() {
                                      if (widget.task?.creationDate == null) {
                                        date = dateTime;
                                      } else {
                                        widget.task?.creationDate = dateTime;
                                      }
                                    });
                                  },
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
                                      Text('Date', style: GoogleFonts.afacad()),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        width: 150,
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
                                              showDate(date),
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
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (_) {
                                    return SizedBox(
                                      height: 260,
                                      child: TimePickerWidget(
                                        initDateTime: showDateAsDateTime(time),
                                        onChange: (_, _) {},
                                        dateFormat: 'HH : mm',
                                        onConfirm: (dateTime, _) {
                                          setState(() {
                                            if (widget.task?.creationTime ==
                                                null) {
                                              time = dateTime;
                                            } else {
                                              widget.task?.creationTime =
                                                  dateTime;
                                            }
                                          });
                                        },
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
                                      Text('Time', style: GoogleFonts.afacad()),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        width: 150,
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
                                              Icons.access_time_filled_rounded,
                                              color: AppColor.primary,
                                            ),
                                            Text(
                                              showTime(time),
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
                        isTaskAlreadyExisting()
                            ? Container()
                            : Expanded(
                              child: AppButton(
                                onPressed: () {},
                                backgroundColor: Colors.red.shade100,
                                buttonText: 'Delete task',
                                textColor: Colors.red,
                              ),
                            ),

                        Expanded(
                          child: AppButton(
                            onPressed: isTaskAlreadyExisting,
                            backgroundColor: AppColor.primary,
                            buttonText: 'Create Task',
                            textColor: AppColor.secondary,
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
