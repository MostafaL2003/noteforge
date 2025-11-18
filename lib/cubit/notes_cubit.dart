import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteforge/cubit/notes_state.dart';
import 'package:noteforge/models/note.dart';
import 'package:noteforge/services/database_service.dart';

class NotesCubit extends Cubit<NotesState> {
  final DatabaseService _db = DatabaseService();

  NotesCubit() : super(const NotesState()) {
    init();
  }

  Future<void> init() async {
    await _db.init();
    loadNotes();
  }

  void loadNotes() {
    final notesList = _db.getNotes();
    emit(NotesState(notes: notesList));
  }

  Future<void> addNote(String title, String content) async {
    final newNote = Note(
      id: DateTime.now().toString(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );

    await _db.addNote(newNote);
    loadNotes();
  }

  Future<void> deleteNote(Note note) async {
    await _db.deleteNote(note);
    loadNotes();
  }
}
