import 'package:claro/data/hive_data_store.dart';
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
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addTask() {
    final TextEditingController titleTextController = TextEditingController();
    final TextEditingController descriptionTextcontroller =
        TextEditingController();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => TaskView(
              descriptionTextcontroller: descriptionTextcontroller,
              titleTextcontroller: titleTextController,
              task: null,
            ),
      ),
    );
    // .then((_) {
    //   titleTextController.dispose();
    //   descriptionTextcontroller.dispose();
    // });
  }

  void _edittask(Tasks task) {
    final TextEditingController titleTextController = TextEditingController(
      text: task.title,
    );
    final TextEditingController descriptionTextcontroller =
        TextEditingController(text: task.description);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => TaskView(
              descriptionTextcontroller: descriptionTextcontroller,
              titleTextcontroller: titleTextController,
              task: task,
            ),
      ),
    );
    // .then((_) {
    //   titleTextController.dispose();
    //   descriptionTextcontroller.dispose();
    // });
  }

  void deleteTask(Tasks? task) async {
    if (task != null) {
      final hiveDataSTore = Provider.of<HiveDataStore>(context, listen: false);
      try {
        await hiveDataSTore.deleteTask(task);
        
      } catch (e) {
        //i dunno throw a not delet error??
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final hiveDataStore = Provider.of<HiveDataStore>(context, listen: false);
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
      body: ValueListenableBuilder<Box<Tasks>>(
        valueListenable: hiveDataStore.tasksListenable(),
        builder: (context, value, child) {
          var tasks = value.values.toList();
          tasks.sort((a, b) => a.creationTime!.compareTo(b.creationTime!));
          return SizedBox(
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
                          tasks.isEmpty
                              ? Emptystate()
                              : ListView.builder(
                                itemCount: tasks.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  var task = tasks[index];
                                  return Dismissible(
                                    direction: DismissDirection.horizontal,
                                    onDismissed: (_) {
                                      deleteTask(task);
                                    },
                                    background: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            color: Color.fromARGB(
                                              255,
                                              253,
                                              67,
                                              54,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    key: Key(index.toString()),
                                    child: TaskWidget(
                                      task: task,
                                      onTap: () => _edittask(task),
                                    ),
                                  );
                                },
                              ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: FloatingActionButton(
          onPressed: () {
            _addTask();
          },
          backgroundColor: AppColor.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
