import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_hive/data/database.dart';
import '../models/note_model.dart';

class HomeProvider extends ChangeNotifier {
  List<Note> _notes = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  late String? getNoteColor ;
  bool isColorChoose = false;
  final searchedTextController = TextEditingController();
  late List<Note> _searchedForNotes;
  bool undo = false ;

  HomeProvider(){
    getData();
  }

  List<Note> get getNotes{
    // _notes = DataBase.getAllNotes();
    return _notes;
  }
  getData(){
    _notes = DataBase.getAllNotes();
   notifyListeners();
  }
   //String id = DateTime.now().microsecondsSinceEpoch.toString();

  createNewNote(){
      DataBase.addToList(Note(id:DateTime.now().toString(),
       //id,
       // DateTime.now().microsecond.toString(),
       // Random.secure().nextInt(1000).toString(),
        title:titleController.text,
        content: contentController.text,
        onCreateDate:formatDate(DateTime.now(), [yyyy, '-', m, '-',d]).toString(),
        noteColor: isColorChoose ? getNoteColor :'0xffFFCC80',
      ));
      titleController.clear();
      contentController.clear();
      getData();
      notifyListeners();
    }

  updateNote(Note note) {
      DataBase.updateNoteInList(note);
      titleController.clear();
      contentController.clear();
      getData();
      notifyListeners();
    }

    deleteFromUi(Note note) async{
      _notes.removeWhere((element) => element.id==note.id);
     await Future.delayed(const Duration(milliseconds: 1400),() {
     if(undo==false){ deleteNote(note);
     }else{
       getData();
     }
      });
     undo = false;
     notifyListeners();
    }

  deleteNote(Note note) {
    _notes.removeWhere((element) => element.id==note.id);
      DataBase.removeFromList(note);
      getData();
      notifyListeners();
     }
  // take char and return the note ho start with
  void addSearchedForItemsToSearchedList (String searchedNoteChar) {
    _searchedForNotes = _notes.where((note) =>
        note.title!.toLowerCase().startsWith(searchedNoteChar)).toList();
         notifyListeners();
  }
  List<Note> get getSearchedNotes{
    return _searchedForNotes;
  }
  void clearSearch(){
    searchedTextController.clear();
  }
}