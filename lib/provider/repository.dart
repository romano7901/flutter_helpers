import 'package:verstka/model/diary.dart';
import 'package:verstka/model/messenger.dart';

class DiaryRepository {
  Future<List<DiaryNote>> getDiary() async {

    List<DiaryNote>  _diaryNote = [
      DiaryNote(title: 'sdfsdf', desc: 'sdfsdfs', date: DateTime.now(), images: 'https://picsum.photos/600/802'),
      DiaryNote(title: 'sdflfgsdf', desc: 'sdfsdfs', date: DateTime.now(), images: 'https://picsum.photos/620/500'),
      DiaryNote(title: 'sdfgfddfsdf', desc: 'sdfsdfs', date: DateTime.now(), images: 'https://picsum.photos/650/900'),
      DiaryNote(title: 'sdfdfgsdf', desc: 'sdfsdfs', date: DateTime.now(), images: 'https://picsum.photos/650/810'),
      DiaryNote(title: 'sdfdfggdfdfsdf', desc: 'sdfsdfs', date: DateTime.now(), images: 'https://picsum.photos/650/700'),
      DiaryNote(title: 'sdfsdf', desc: 'sdfsdfs', date: DateTime.now(), images: 'https://picsum.photos/610/450'),
      DiaryNote(title: 'sddfgfdfsdf', desc: 'sdfdfgfdgdfgsdfs', date: DateTime.now(), images: 'https://picsum.photos/650/700'),
      DiaryNote(title: 'sdfgdfgdfsdf', desc: 'sdfdfgfdsdfs', date: DateTime.now(), images: 'https://picsum.photos/630/500'),
    ];

    await Future.delayed(const Duration(milliseconds: 1000));
    return _diaryNote;
  }
}

class ChatRepository {
  Future<List<ChatUsers>> getChats() async {
    List<ChatUsers> _chatUsers = [
      ChatUsers('Пися Камушкин', 'Здарроова чел!!', 'https://randomuser.me/api/portraits/men/20.jpg', 'Авчарась'),
      ChatUsers('Сися Морковкина', 'Когда увидимся а?', 'https://randomuser.me/api/portraits/women/21.jpg', 'Надысь'),
      ChatUsers('Воробей Залупка', 'Просьба проверить результат работы за месяц', 'https://randomuser.me/api/portraits/men/22.jpg', 'Сегодни'),
      ChatUsers('Шоколадное Кольцо', 'Я не очень понимаю что поисходит', 'https://randomuser.me/api/portraits/women/23.jpg', 'Йестердей'),
      ChatUsers('Надежда Катышкина', 'Ты охуевшее драное говно! Уничтожу!', 'https://randomuser.me/api/portraits/women/24.jpg', 'Томмороу'),
      ChatUsers('Говняка', 'А ха ха Смешгко в ж', 'https://randomuser.me/api/portraits/men/88.jpg', 'Полдник'),
      ChatUsers('Пися Камушкин', 'Здарроова чел!!', 'https://randomuser.me/api/portraits/men/20.jpg', 'Авчарась'),
      ChatUsers('Сися Морковкина', 'Когда увидимся а?', 'https://randomuser.me/api/portraits/women/10.jpg', 'Надысь'),
      ChatUsers('Воробей Залупка', 'Просьба проверить результат работы за месяц', 'https://randomuser.me/api/portraits/men/22.jpg', 'Сегодни'),
      ChatUsers('Шоколадное Кольцо', 'Я не очень понимаю что поисходит', 'https://randomuser.me/api/portraits/men/33.jpg', 'Йестердей'),
      ChatUsers('Надежда Катышкина', 'Ты охуевшее драное говно! Уничтожу!', 'https://randomuser.me/api/portraits/women/44.jpg', 'Томмороу'),
      ChatUsers('Говняка', 'А ха ха Смешгко в ж', 'https://randomuser.me/api/portraits/men/25.jpg', 'Полдник'),
      ChatUsers('Пися Камушкин', 'Здарроова чел!!', 'https://randomuser.me/api/portraits/men/66.jpg', 'Авчарась'),
      ChatUsers('Сися Морковкина', 'Когда увидимся а?', 'https://randomuser.me/api/portraits/women/71.jpg', 'Надысь'),
      ChatUsers('Воробей Залупка', 'Просьба проверить результат работы за месяц', 'https://randomuser.me/api/portraits/men/55.jpg', 'Сегодни'),
      ChatUsers('Шоколадное Кольцо', 'dgdfgfdg', 'https://randomuser.me/api/portraits/women/63.jpg', 'Йестердей'),
      ChatUsers('Надежда Катышкина', 'Ты охуевшее драное говно! Уничтожу!', 'https://randomuser.me/api/portraits/women/17.jpg', 'Томмороу'),
      ChatUsers('Говняка', 'А ха ха Смешгко в ж', 'https://randomuser.me/api/portraits/men/25.jpg', 'Полдник')
    ];

    await Future.delayed(const Duration(milliseconds: 1000));
    return _chatUsers;
  }
}