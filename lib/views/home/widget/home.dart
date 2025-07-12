import 'package:claro/extensions/spacer.dart';
import 'package:claro/main.dart';
import 'package:claro/model/todo_model.dart';
import 'package:claro/utils/app_color.dart';
import 'package:claro/views/home/components/emptystate.dart';

import 'package:claro/views/home/components/taskcontainer.dart';
import 'package:claro/views/home/widget/tasktile.dart';
import 'package:claro/views/tasks/task_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  //final Box<Tasks> todoBox = Hive.box<Tasks>('tasks');

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> tasks = ['1'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'CLARO',
          style: GoogleFonts.afacad(fontSize: 24, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: SizedBox(
            width: double.infinity,
            height: 680,
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Todays Tasks',
                  style: GoogleFonts.afacad(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Expanded(
                  child:
                      tasks.isNotEmpty
                          ? ListView.builder(
                            itemCount: tasks.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Dismissible(
                                direction: DismissDirection.horizontal,
                                onDismissed: (_) {},
                                background: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      'This task will be deleted',
                                      style: GoogleFonts.afacad(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 253, 67, 54),
                                      ),
                                    ),
                                  ],
                                ),
                                key: Key(index.toString()),
                                child: TaskWidget(
                                  task: Tasks(
                                    id: '1',
                                    title: 'home task',
                                    description: 'taskkk',
                                    creationDate: DateTime.now(),
                                    creationTime: DateTime.now(),
                                    isCompleted: false,
                                  ),
                                ),
                              );
                            },
                          )
                          : Emptystate(),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder:
                    (_) => const TaskView(
                      descriptionTextcontroller: null,
                      titleTextcontroller: null,
                      task: null,
                    ),
              ),
            );
          },
          backgroundColor: AppColor.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
