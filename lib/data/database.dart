import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_hive/models/note_model.dart';

class DataBase {
  static late final _myBox;

 static init() async {
    _myBox = await Hive.openBox('myBox');
  }

  static addToList(Note note) async {
    await _myBox.put(note.id, json.encode(note.toJson()));
  }

  static removeFromList(Note note) async {
    await _myBox.delete(note.id);
  }

  static  updateNoteInList(Note note) async {
     await _myBox.put(note.id, json.encode(note.toJson()));
  }

  static List<Note> getAllNotes() {
    List<Note> list = <Note>[];
    for (var element in _myBox.values) {
      list.add(Note.fromJson(json.decode(element.toString())));
    }
    return list;
  }
}
