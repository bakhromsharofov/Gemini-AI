import 'package:gemini/data/models/message_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  static var box = Hive.box('my_nosql');

  /// Save object without key
  static saveMessage(MessageModel message) async {
    box.add(message);
  }

  /// load history
  static List<MessageModel> getHistoryMessages() {
    List<MessageModel> messages = [];
    for (int i = 0; i < box.length; i++) {
      var message = box.getAt(i);
      messages.add(message);
    }
    return messages;
  }
}
