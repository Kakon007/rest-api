import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete"),
      content: Text("Are you Sure want to delete the Note?"),
      actions: [
        FlatButton(onPressed: (){Navigator.of(context).pop(true);}, child: Text("Yes")),
        FlatButton(onPressed: (){Navigator.of(context).pop(false);}, child: Text("No")),
      ],
    );
  }
}
