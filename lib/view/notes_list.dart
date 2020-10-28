import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api/models/note_for_listing.dart';
import 'package:rest_api/service/note_service.dart';

import 'note_modify.dart';
import 'notedelete.dart';
import 'package:http/http.dart' as http;

class Notelist extends StatefulWidget {
  @override
  _NotelistState createState() => _NotelistState();
}

class _NotelistState extends State<Notelist> {
  Noteservice get service=> GetIt.I<Noteservice>();
  List<NoteForList> notes=[];
  
  getlocation() async{
    var client=http.Client();
    http.Response response= await client.get("http://thirdhand.net/api/AllCountry/User-top-earn");
    try{
      if(response.statusCode==200){
        var jsonMap =json.decode(response.body);

        print(jsonMap);

      }
    }catch(e){
      print(e);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    getlocation();
    notes=service.getNote();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List of Notes"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteModify()));
      },child: Icon(Icons.add),),
      body: SafeArea(
        child: Container(

          child: ListView.separated(itemBuilder: (_,index){
            return Dismissible(key: ValueKey(notes[index].noteId), direction: DismissDirection.startToEnd,onDismissed: (direction) {

            },confirmDismiss: (direction) async{
              final result= await showDialog(context: context, builder:(context)=> NoteDelete());
              return result;
            } ,child: ListTile(
              title: Text(notes[index].noteTitle),
              subtitle: Text(notes[index].createDateTime.toString()),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteModify(noteId: notes[index].noteId,)));
              },

            ),
            );

          }, separatorBuilder: (_, __ )=>Divider(height: 1,color: Colors.red,), itemCount: notes.length),
        ),
      ),
    );
  }
}

