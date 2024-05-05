import '../models/chat_message_model.dart';

abstract class ChatState {}

class ChatInitialState extends ChatState {}
class ChatSuccessState extends ChatState{
  final List<ChatMessageModel> message;
  ChatSuccessState({required this.message});
}