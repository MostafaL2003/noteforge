import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteforge/cubit/notes_cubit.dart';
import 'package:noteforge/cubit/notes_state.dart';
import 'package:noteforge/screens/add_note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noteforge"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state.notes.isEmpty) {
            return Center(
              child: Text("No notes yet..!", style: TextStyle(fontSize: 32)),
            );
          }
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                trailing: IconButton(
                  onPressed: () {
                    context.read<NotesCubit>().deleteNote(note);
                  },
                  icon: Icon(Icons.remove, color: Colors.red),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("+"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNoteScreen()),
          );
          ;
        },
      ),
    );
  }
}
