import 'dart:async';

import 'package:bloc/bloc.dart';
import '../repos/posts_repo.dart';
import 'posts_event.dart';
import 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }
  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());
    await Future.delayed(Duration(seconds: 3));
      final posts=await PostRepo.fetchPosts();
      emit(PostFetchingSuccessfulState(posts: posts));
      print(posts[1]);
    }
  }

