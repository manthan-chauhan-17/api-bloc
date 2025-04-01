import 'dart:async';

import 'package:api_bloc/bloc/post/post_event.dart';
import 'package:api_bloc/bloc/post/post_state.dart';
import 'package:api_bloc/model/post_model.dart';
import 'package:api_bloc/retrofit/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> tempList = [];
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetch);

    on<PostFilterEvent>(postFilter);
  }

  FutureOr<void> postInitialFetch(
      PostInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchDataLoadingState());
    await restClient.getPosts().then((value) {
      print(value);
      emit(PostFetchDataLoadedSuccessState(data: value));
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  FutureOr<void> postFilter(PostFilterEvent event, Emitter<PostState> emit) {
    // tempList = tempList
    //     .where((element) => element.id.contains(event.searched))
    //     .toList();
    // emit(PostFilterState(searchedElement: element));
  }
}
