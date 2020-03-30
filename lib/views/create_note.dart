import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  bool get isEditing => noteID != null;
  final String noteID;
  NoteModify({this.noteID});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          isEditing ?  'Create Note' : 'Modify Notes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.black,
        child: Icon(Icons.check),
        onPressed: () {

        }
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Note Title'
              ),
            ),
            SizedBox(height: 8,),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Note Content'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
