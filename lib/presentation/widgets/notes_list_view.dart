import 'package:flutter/material.dart';
import 'package:note_hive/presentation/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 0.0),
      child: ListView.builder(itemBuilder: (context,index){
        return const NoteItem();
      },
        padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
