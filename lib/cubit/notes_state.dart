import 'package:equatable/equatable.dart';
import 'package:noteforge/models/note.dart';

class NotesState extends Equatable{

  final List<Note> notes;
  const NotesState({ this.notes = const [] });
  
  @override List<Object> get props => [notes];


}