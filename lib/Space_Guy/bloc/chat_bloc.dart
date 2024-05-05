import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dealdox_integrated/Space_Guy/repos/chat_repo.dart';
import 'package:get/get.dart';
import '../models/chat_message_model.dart';
import 'chat_state.dart';
import 'package:flutter/material.dart';
part 'chat_event.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<ChatMessageModel> message = [];
  ChatBloc()
      : super(
          ChatSuccessState(
            message: [
              ChatMessageModel(
                role: "model",
                parts: [
                  {
                    "text": "**Official Resources:**\n\n* [Dart website](https://dart.dev/)\n* "
                        "[Dart documentation](https://api.dart.dev/)\n* [Dart tutorial](https://dart.d"
                        "ev/tutorials)\n\n**Online Courses and Tutorials:**\n\n* [Coursera: Dart Pro"
                        "gramming Specialization](https://www.coursera.org/specializations/dart-progr"
                        "amming)\n* [Udemy: The Complete Dart Developer Course](https://www.udemy.com/cour"
                        "se/the-complete-dart-developer-course/)\n* [freeCodeCamp: Dart Tutorial](https://w"
                        "w.freecodecamp.org/news/learn-dart/)\n* [Codecademy: Learn Dart](https://www.codeca"
                        "demy.com/learn/learn-dart)\n\n**Blogs and Articles:**\n\n* [Dartlang blog](https://"
                        "blog.dart.dev/)\n* [Medium: Dartlang](https://medium.com/dartlang/)\n* [Flutter blog"
                        "](https://flutter.dev/blog/)\n* [The Boring Flutter Development Show](https://boringf"
                        "utterdevelopment.com/)\n\n**Community Forums and Groups:**\n\n* [Dart forum](https://"
                        "discourse.dartlang.org/)\n* [Flutter Community](https://flutter.dev/community/)\n* [Dar"
                        "t subreddit](https://www.reddit.com/r/dartlang/)\n\n**Other Resources:**\n\n* [DartPad]"
                        "(https://dartpad.dev/): Online Dart editor and compiler\n* [Dart Analyzer](https://dart.dev/"
                        "tools/analyzer): Static analysis tool for Dart code\n* [Flutter](https://flutter.dev/): Mob"
                        "ile app development framework built on Dart\n\nI recommend starting with the official Dart web"
                        "site and documentation, as they provide comprehensive and up-to-date information. Once you h"
                        "ave a basic understanding, you can explore online courses, tutorials, and community resources"
                        " to deepen your knowledge and build practical skills."
                  }
                ],
              ),
            ],
          ),
        ) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }

  FutureOr<void> chatGenerateNewTextMessageEvent(
      ChatGenerateNewTextMessageEvent event, Emitter<ChatState> emit) async {
    message.add(ChatMessageModel(role: "user", parts: [
      ChatPartModel(text: event.inputMessage),
    ]));
    print("object");
    emit(ChatSuccessState(message: message));
    // await ChatRepo.chatTextGenerationRepo(message);
  }
}
