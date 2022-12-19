import 'package:flutter/material.dart';
import '../../data/database.dart';
import 'custom_app_bar.dart';
import 'do_it_animated_text.dart';
import 'notes_list_view.dart';

class HomeBody extends StatefulWidget {
 //late DataBase db;

 HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  void initState(){
     DataBase.getAllNotes();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children:  const [
          SizedBox(height: 15),
          CustomAppBar(),
          DoItAnimatedText(),
          SizedBox(height: 15.0),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
