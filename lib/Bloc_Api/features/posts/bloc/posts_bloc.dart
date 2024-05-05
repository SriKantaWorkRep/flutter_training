import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dealdox_integrated/BLOC_grocery_app/features/home/models/home_product_data_model.dart';
import 'package:dealdox_integrated/Bloc_Api/features/posts/mappers/post_data_ui_model.dart';
import 'package:dealdox_integrated/Bloc_Api/features/posts/repos/posts_repo.dart';
import 'package:http/http.dart' as http;
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

