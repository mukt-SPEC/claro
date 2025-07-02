import 'package:claro/extensions/spacer.dart';
import 'package:claro/main.dart';
import 'package:claro/model/todo_model.dart';
import 'package:claro/utils/app_color.dart';

import 'package:claro/views/home/components/taskcontainer.dart';
import 'package:flutter/cupertino.dart';
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
                  child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedContainer(
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: AppColor.secondary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        duration: const Duration(milliseconds: 450),
                        child: GestureDetector(
                          onTap: () {},
                          child: ListTile(
                            leading: AnimatedContainer(
                              padding: EdgeInsets.all(4),
                              duration: const Duration(milliseconds: 350),
                              decoration: BoxDecoration(
                                color: AppColor.primary,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                            title: Text('Task name'),
                            subtitle: Text('task description'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColor.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
