import 'package:bloc/bloc.dart';
import 'package:verstka/bloc/bloc_event.dart';
import 'package:verstka/bloc/bloc_state.dart';
import 'package:verstka/model/diary.dart';
import 'package:verstka/model/messenger.dart';
import 'package:verstka/provider/repository.dart';

class DiaryBloc extends Bloc<AppEvent, DiaryState> {
  DiaryBloc() : super(DiaryLoading()) {
    on<LoadDiary>((event, emit) async {
      List<DiaryNote> mylist = await DiaryRepository().getDiary();
      emit(DiaryLoaded(mylist));
    });
    on<RefreshDiary>((event, emit) async {
      emit(DiaryLoading());
      List<DiaryNote> mylist = await DiaryRepository().getDiary();
      emit(DiaryLoaded(mylist));
    });
  }
}

class ChatUsersBloc extends Bloc<AppEvent, MessageState> {
  ChatUsersBloc() : super(ChatLoading()) {
    on<LoadChat>((event, emit) async {
      List<ChatUsers> myChats = await ChatRepository().getChats();
      emit(ChatLoaded(myChats));
    });
  }
}
