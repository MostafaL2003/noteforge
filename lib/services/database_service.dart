import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteforge/models/note.dart';

class DatabaseService {
  late Box<Note> _notesbox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteAdapter());
    _notesbox = await Hive.openBox<Note>('notes');
  }

  List<Note> getNotes() {
    return _notesbox.values.toList();
  }

  Future<void> addNote(Note note) async {
    await _notesbox.add(note);
  }
}
