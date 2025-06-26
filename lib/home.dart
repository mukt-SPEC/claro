import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Column(
        children: [
          const SizedBox(height: 56),
          Text(
            'CLARO',
            style: GoogleFonts.afacad(fontSize: 28, color: Color(0xff121212)),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
