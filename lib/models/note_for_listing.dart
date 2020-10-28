import 'package:flutter/cupertino.dart';

class NoteForList{
  String noteId;
  String noteTitle;
  DateTime createDateTime;
  DateTime lastDateTime;

  NoteForList({
   @required this.noteId,
   @required this.noteTitle,
   @required this.createDateTime,
   @required this.lastDateTime,
});
}