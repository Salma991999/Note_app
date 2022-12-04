import 'package:flutter/material.dart';
import 'package:note_hive/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return const NoteItem();
    },
    physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(5.0),
    );
  }
}
