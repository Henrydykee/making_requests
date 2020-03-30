import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:making_requests/services/note_services.dart';
import 'package:making_requests/views/note_list.dart';

void setupLocator(){
  GetIt.instance.registerLazySingleton(()=> NotesService());
  GetIt.instance<NotesService>();
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http requests',
      debugShowCheckedModeBanner: false,
            home: NoteList(),
    );
  }
}
