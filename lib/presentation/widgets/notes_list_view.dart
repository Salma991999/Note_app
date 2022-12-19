import 'package:flutter/material.dart';
import 'package:note_hive/presentation/widgets/custom_app_bar.dart';
import 'package:note_hive/presentation/widgets/note_item.dart';
import 'package:note_hive/state_mangment/home_provider.dart';
import 'package:provider/provider.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}
class _NotesListViewState extends State<NotesListView> {

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder:(context,homeProvider,child){
       return Padding(
         padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 0.0),
         child: ListView.builder(
          itemBuilder: (context,index){
            return NoteItem(
                homeProvider.searchedTextController.text.isEmpty
                    ? homeProvider.getNotes[index]
                    : homeProvider.getSearchedNotes[index]
            );},
           itemCount:homeProvider.searchedTextController.text.isEmpty
                    ? homeProvider.getNotes.length
                    : homeProvider.getSearchedNotes.length,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
      ),
       );
    });
  }
}
