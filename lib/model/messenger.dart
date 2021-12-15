class ChatUsers {
  final String name;
  String messageText;
  String imageURL;
  String time;

  ChatUsers(this.name, this.messageText, this.imageURL, this.time);
}

class ConversationList {
  String text;
  String userName;
  bool isMy;

  ConversationList(this.userName, this.text, this.isMy);
}
