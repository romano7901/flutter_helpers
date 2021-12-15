import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verstka/bloc/bloc.dart';
import 'package:verstka/bloc/bloc_event.dart';
import 'package:verstka/bloc/bloc_state.dart';
import 'package:verstka/model/diary.dart';

import 'drawer_menu.dart';

class DiaryNoteList extends StatefulWidget {
  @override
  _DiaryNoteListState createState() => _DiaryNoteListState();
}

class _DiaryNoteListState extends State<DiaryNoteList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) => DiaryBloc()..add(LoadDiary()),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Список записей'),
          ),
          body: DiaryListView(),
          drawer: Drawer(
              child: DrawerMenu() // Populate the Drawer in the next step.
              ),
          floatingActionButton: FloatingActionButton(
            onPressed: _addNewNote,
            backgroundColor: Colors.grey,
            child: const Icon(Icons.add_a_photo),
          ),
        ),
      ),
    );
  }

  void _addNewNote() {
    Navigator.pushNamed(context, '/NewNote');
  }
}

class OneNoteView extends StatelessWidget {
  final DiaryNote diaryNote;

  OneNoteView({required this.diaryNote});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.fromLTRB(5, 15, 5, 15),
      child: GestureDetector(
        onTap: () => _showNoteDetails(123, context),
        child: Stack(
          children: [
            Image.network(diaryNote.images ?? '',
                width: double.infinity, fit: BoxFit.cover),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              bottom: 4,
              right: 10,

              child: Container(
                // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                width: 80,
                color: Colors.black54,
                padding: EdgeInsets.all(10),
                child: Text(
                  diaryNote.title ?? '',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              bottom: 4,
              left: 10,

              child: Container(
                // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                width: 80,
                color: Colors.black54,
                padding: EdgeInsets.all(10),
                child: Text(
                  diaryNote.desc ?? '',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showNoteDetails(int noteId, BuildContext context) {
    Navigator.pushNamed(context, '/ViewNote');
  }
}

class DiaryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<DiaryBloc>().state;
    if (state is DiaryLoaded) {
      return RefreshIndicator(
        onRefresh: () {
          return _refreshDiary(context);
        },
        child: ListView.builder(
          itemCount: state.diaryNotes.length,
          itemBuilder: (context, index) =>
              OneNoteView(diaryNote: state.diaryNotes[index]),
        ),
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  Future<void> _refreshDiary(BuildContext context) async {
    BlocProvider.of<DiaryBloc>(context)..add(RefreshDiary());
  }
}
