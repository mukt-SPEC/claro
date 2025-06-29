import 'package:claro/main.dart';
import 'package:claro/model/todo_model.dart';
import 'package:claro/tasklist.dart';
import 'package:claro/widgets/taskcontainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  final Box<Tasks> todoBox = Hive.box<Tasks>('tasks');

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Tasks? tasks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        title: Text(
          'CLARO',
          style: GoogleFonts.afacad(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<Tasks>>(
        valueListenable: Hive.box<Tasks>('tasks').listenable(),
        builder: (context, box, _) {
          return Padding(
            padding: EdgeInsets.all(16),
            child:
                box.get('tasks') == null
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Taskcontainer(tasks),
                        const SizedBox(height: 16),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Nothing here yet!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.afacad(
                                  fontSize: 18,
                                  color: const Color(0xffb9b9b9),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Ready to clear your mind and conquer the day?\n Tap the + button to add your first task.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.afacad(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: const Color(0xffb9b9b9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                    : Column(
                      children: [
                        Text(
                          'Today\'s task',
                          style: GoogleFonts.afacad(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_rounded),
                            Text('date'),
                          ],
                        ),

                        Expanded(
                          child: ListView.builder(
                            itemCount: box.values.length,
                            itemBuilder: (context, index) {
                              Tasks? currentTask = box.getAt(index);
                              return Tasklist(currentTask!);
                            },
                          ),
                        ),
                      ],
                    ),
          );
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff121212),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
