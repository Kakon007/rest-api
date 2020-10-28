import 'package:rest_api/models/note_for_listing.dart';

class Noteservice{
  List<NoteForList> getNote(){
    return[

      new NoteForList(
          noteId: "1",
          noteTitle: "Hello",
          createDateTime: DateTime.now(),
          lastDateTime: DateTime.now()
      ),
      new NoteForList(
          noteId: "2",
          noteTitle: "How Are",
          createDateTime: DateTime.now(),
          lastDateTime: DateTime.now()
      ),
      new NoteForList(
          noteId: "3",
          noteTitle: "You?",
          createDateTime: DateTime.now(),
          lastDateTime: DateTime.now()
      ),
    ];
  }
}