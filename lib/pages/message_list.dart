import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verstka/bloc/bloc.dart';
import 'package:verstka/bloc/bloc_event.dart';
import 'package:verstka/bloc/bloc_state.dart';
import 'package:verstka/model/messenger.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Сообщения')),
      body: BlocProvider(
        create: (context) => ChatUsersBloc()..add(LoadChat()),
        child: ChatListView(),
      ),
    );
  }
}

class ChatListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ChatUsersBloc>().state;
    if (state is ChatLoaded) {
      return ChatItemView(state.chatList);
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}

class ChatItemView extends StatelessWidget {
  final List<ChatUsers> chatUsers;

  const ChatItemView(this.chatUsers);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chatUsers.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/ConvView');
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(chatUsers[index].imageURL),
                          maxRadius: 30,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  chatUsers[index].name,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  chatUsers[index].messageText,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    chatUsers[index].time,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
