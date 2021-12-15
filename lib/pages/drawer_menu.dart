import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Text('Меню'),
          ),
          ListTile(
            title: const Text('Профиль'),
            onTap: () {
              // Update the state of the app.
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Список заметок'),
            onTap: () {
              // Update the state of the app.
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Текущие задачи'),
            onTap: () {
              // Update the state of the app.
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Сообщения (3)',
                style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              // Update the state of the app.
              Navigator.pushNamed(context, '/MessageList');
            },
          ),
          ListTile(
            title: const Text('Локация'),
            onTap: () {
              // Update the state of the app.
              Navigator.pushNamed(context, '/GPSLocation');
            },
          ),
          ListTile(
            title: const Text('Просмотр записи'),
            onTap: () {
              // Update the state of the app.
              Navigator.pushNamed(context, '/ViewNote');
            },
          ),
        ]);
  } // end build
}
