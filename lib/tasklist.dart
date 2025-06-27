import 'package:claro/model/todo_model.dart';
import 'package:flutter/material.dart';

class Tasklist extends StatefulWidget {
  const Tasklist (this.tasks,{super.key});
  final Tasks tasks; 
  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}