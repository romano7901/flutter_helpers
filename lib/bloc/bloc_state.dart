
import 'package:verstka/model/diary.dart';
import 'package:verstka/model/messenger.dart';

abstract class DiaryState {}

abstract class MessageState {}

class DiaryLoading extends DiaryState {}

class DiaryLoaded extends DiaryState {
  final List<DiaryNote> diaryNotes;

  DiaryLoaded(this.diaryNotes);

}

class DiaryLoadFail extends DiaryState {
  final Error error;

  DiaryLoadFail(this.error);
}

class ChatLoading extends MessageState {}

class ChatLoaded extends MessageState {
  final List<ChatUsers> chatList;

  ChatLoaded(this.chatList);
}

class ChatError extends MessageState {
  final Error error;

  ChatError(this.error);
}

