import 'package:claro/main.dart';
import 'package:claro/model/todo_model.dart';
import 'package:claro/tasklist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder<Box<Tasks>>(
        valueListenable: Hive.box<Tasks>('tasks').listenable(),
        builder: (context, box, _) {
          return Padding(
            padding: EdgeInsets.all(16),
            child:
                box.get('tasks') == null
                    ? Column(
                      children: [
                        const SizedBox(height: 56),
                        Text(
                          'CLARO',
                          style: GoogleFonts.afacad(
                            fontSize: 28,
                            color: Color(0xff121212),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Nothing here yet!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.afacad(
                                  fontSize: 16,
                                  color: const Color(0xffb9b9b9),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Ready to clear your mind and conquer the day?\n Tap the + button to add your first task.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.afacad(
                                  fontSize: 12,
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
                                //Tasks currentTask = box.getAt(index)!;
                                return Tasklist();
                            },
                          ),
                        ),
                      ],
                    ),
          );
        },
      ),

      floatingActionButton: Center(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff121212),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
