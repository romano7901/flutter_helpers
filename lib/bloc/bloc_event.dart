abstract class AppEvent {}

class LoadDiary extends AppEvent {}

class RefreshDiary extends AppEvent {}

class LoadChat extends AppEvent {}

class LoadConversation extends AppEvent {
  final int convId;
  LoadConversation(this.convId);
}


