import 'package:flutter/material.dart';

class DiaryNoteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Смотрим ноту'),
      ),
      body: Column(
        children: [
          ImgPText(),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'В этот день что-то было интересное или не очень. Но я этот день запомнил хорошо. Не знаю почему, но запомнил. Что-то доброе произошло.',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImgPText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
            'https://picsum.photos/500/402',
            width: double.infinity,
            fit: BoxFit.cover),
        Positioned(
          // The Positioned widget is used to position the text inside the Stack widget
          bottom: 4,
          right: 10,

          child: Container(
            // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
            width: 300,
            color: Colors.black54,
            padding: EdgeInsets.all(10),
            child: Text(
              '10.12.21 Очередная заметка',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
