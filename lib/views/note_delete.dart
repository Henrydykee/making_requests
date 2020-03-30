import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(Icons.warning),
      content: Text('Are you Sure you want to delete this note?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Yes'),
          onPressed: (){
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: (){
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
