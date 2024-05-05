import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts_bloc.dart';
import '../bloc/posts_event.dart';
import '../bloc/posts_state.dart';

class PostsPage extends StatefulWidget {
  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    print("object");
    postsBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts Page"),
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listener: (context, state) {
        },
        listenWhen: (previous,current)=>current is PostsState,
        buildWhen: (previous,current)=>current is !PostsActionState,
        builder: (context, state) {
        switch(state.runtimeType){
          case PostsFetchingLoadingState:
            return Scaffold(
              body: Container(
                color: Colors.white,
                child:const Center(child: CircularProgressIndicator()),
              ),
            );
          case PostFetchingSuccessfulState:
            print("coming");
            final successState = state as PostFetchingSuccessfulState;
            return Scaffold(
              body: Container(
                color: Colors.white,
                child:ListView.builder(
                  itemCount: successState.posts.length,
                    itemBuilder:(context,index){
                      return Container(
                        height: 240,
                        width: 300,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("working"),
                            Text('${successState.posts[index].title}'),
                            Text('${successState.posts[index].body}'),
                            Text('${successState.posts[index].id}'),
                            Text('${successState.posts[index].userId}')
                          ],
                        ),
                      );
                    }
                ),
              ),
            );

          default:
            return Container();
        }
        },
      ),
    );
  }
}

