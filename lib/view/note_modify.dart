import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  bool get isEditing => noteId!=null;
  final String noteId;
  NoteModify({this.noteId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(isEditing?"Edit Note":"Create Note"),),
      body: Padding(padding: EdgeInsets.all(12),child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Note Title",
              labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )
            ),
          ),
          SizedBox(height: 15,),
          TextField(
            decoration: InputDecoration(
                hintText: "Note Content",
                labelText: "Content",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              )
            ),
          ),
          SizedBox(height: 10,),
          RaisedButton(onPressed: (){
            Navigator.of(context).pop();
          },
          child: Text("Submit"),
            color: Colors.green,
          )
        ],
      ),),
    );
  }
}
