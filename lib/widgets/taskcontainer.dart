import 'package:claro/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Taskcontainer extends StatefulWidget {
  final Tasks? tasks;
  final VoidCallback? onTap;
  const Taskcontainer(this.tasks, this.onTap, {super.key});

  @override
  State<Taskcontainer> createState() => _TaskcontainerState();
}

class _TaskcontainerState extends State<Taskcontainer> {
  void onChanged(bool? value) {
    setState(() {
      widget.tasks!.isCompleted = value!;
      // widget.tasks!.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: widget.onTap,
                child: Checkbox(value: widget.tasks!.isCompleted, onChanged: onChanged)),
              Text(
                // widget.tasks!.title,
                'Tutle',
                style: GoogleFonts.afacad(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff121212),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            //widget.tasks!.description,
            'Description',
            style: GoogleFonts.afacad(
              fontSize: 14,
              color: const Color(0xffb9b9b9),
            ),
          ),
        ],
      ),
    );
  }
}
