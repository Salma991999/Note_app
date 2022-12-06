import 'package:flutter/material.dart';
import 'package:note_hive/constant/colors.dart';
import 'package:note_hive/presentation/screens/home.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       brightness: Brightness.dark,
       // backgroundColor: MyColors.myGrey,
        fontFamily: 'Poppins'
      ),
      home: const NotesView(),
    );
  }
}

