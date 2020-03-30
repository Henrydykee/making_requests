import 'dart:convert';

import 'package:making_requests/models/api_response.dart';
import 'package:making_requests/models/note.dart';
import 'package:making_requests/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {'apikey': '08d7bc67-a735-5f7e-1654-d9813c7e3daf'};
  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = NoteForListing(
            noteID: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            lastestEditDateTime: item['latestEditTime'] != null
                ? DateTime.parse(item['latestEditTime'])
                : null,
          );
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An error ocuured');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error ocuured'));
  }

  Future<APIResponse<List<Note>>> getNote(String noteID) {
    return http.get(API +'/notes/'+ noteID,headers: headers).then((data ){
      if (data.statusCode == 200 ){
        final jsonData = json.decode(data.body);
        final note = Note(
            noteID: jsonData['noteID'],
          noteTitle: jsonData['noteTitle'],
            noteContent: jsonData ['noteContent'],
          createDateTime: DateTime.parse(jsonData['createDateTime']),
          lastestEditDateTime: jsonData['latestEditDateTime'] != null ? DateTime
              .parse(jsonData['latestEditTime']) : null,
        );
        return APIResponse <Note>(data: note);
      }
      return APIResponse<List<Note>>(error: true , errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<List<Note>>(error: true , errorMessage: 'An error occured' ));
  }
}
