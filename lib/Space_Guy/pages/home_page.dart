import 'package:dealdox_integrated/Space_Guy/bloc/chat_bloc.dart';
import 'package:dealdox_integrated/Space_Guy/bloc/chat_state.dart';
import 'package:dealdox_integrated/Space_Guy/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ChatBloc chatBloc = ChatBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).message;
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/space.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Space Guy",
                            style: GoogleFonts.chonburi(
                                fontSize: 26, fontWeight: FontWeight.w900),
                          ),
                          Icon(
                            Icons.image_search,
                            size: 26,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.amber.withOpacity(0.1),
                                ),
                                child: Text(messages[index].parts.first["text"]),);
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          CircleAvatar(
                            radius: 33,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              radius: 30,
                              child: GestureDetector(
                                onTap: (){messages.add(ChatMessageModel(role: "model", parts: [{
                                  "text": "**Official Resources:**\n\n* [Dart website](https://dart.dev/)\n* [Dart documentation](https://api.dart.dev/)\n* [Dart tutorial](https://dart.dev/tutorials)\n\n**Online Courses and Tutorials:**\n\n* [Coursera: Dart Programming Specialization](https://www.coursera.org/specializations/dart-programming)\n* [Udemy: The Complete Dart Developer Course](https://www.udemy.com/course/the-complete-dart-developer-course/)\n* [freeCodeCamp: Dart Tutorial](https://www.freecodecamp.org/news/learn-dart/)\n* [Codecademy: Learn Dart](https://www.codecademy.com/learn/learn-dart)\n\n**Blogs and Articles:**\n\n* [Dartlang blog](https://blog.dart.dev/)\n* [Medium: Dartlang](https://medium.com/dartlang/)\n* [Flutter blog](https://flutter.dev/blog/)\n* [The Boring Flutter Development Show](https://boringflutterdevelopment.com/)\n\n**Community Forums and Groups:**\n\n* [Dart forum](https://discourse.dartlang.org/)\n* [Flutter Community](https://flutter.dev/community/)\n* [Dart subreddit](https://www.reddit.com/r/dartlang/)\n\n**Other Resources:**\n\n* [DartPad](https://dartpad.dev/): Online Dart editor and compiler\n* [Dart Analyzer](https://dart.dev/tools/analyzer): Static analysis tool for Dart code\n* [Flutter](https://flutter.dev/): Mobile app development framework built on Dart\n\nI recommend starting with the official Dart website and documentation, as they provide comprehensive and up-to-date information. Once you have a basic understanding, you can explore online courses, tutorials, and community resources to deepen your knowledge and build practical skills."
                                }]));
                                  chatBloc.add(ChatGenerateNewTextMessageEvent(inputMessage: textEditingController.text));
                                  print(messages.length);
                                  },
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              break;
            default:
              return Container();
          }
        },
      ),
    );
  }
}
