import 'package:flutter/material.dart';

import 'package:verstka/pages/dnote_list.dart';
import 'package:verstka/pages/dnote_view.dart';
import 'package:verstka/pages/dnote_new.dart';
import 'package:verstka/pages/drawer_menu.dart';
import 'package:verstka/pages/gps_location.dart';
import 'package:verstka/pages/message_list.dart';
import 'package:verstka/pages/conv_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: <String,WidgetBuilder> {
        '/': (context) => DiaryNoteList(),
        '/NewNote': (context) => DiaryNoteNew(),
        '/ViewNote': (context) => DiaryNoteView(),
        '/GPSLocation': (context) => GetlocatorWidget(),
        '/MessageList': (context) => MessageList(),
        '/ConvView': (context) => ConvView(),

      },

    );
  }
}
