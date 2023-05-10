import 'message.dart';

mixin WithMessages<S> {
  List<Message> get messages;

  Message? get lastMessage {
    if(messages.isEmpty) {
      return null;
    }
    return messages.last;
  }

  S updatedMessages(List<Message> messages);

  S pushMessage(Message message) => updatedMessages([...messages, message]);

  S popMessage(Message message) {
    messages.remove(message);
    return updatedMessages(messages);
  }
}
