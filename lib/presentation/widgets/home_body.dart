import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'do_it_animated_text.dart';
import 'note_item.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: const [
          SizedBox(height: 50),
          CustomAppBar(),
          DoItAnimatedText(),
          SizedBox(height: 20.0),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
