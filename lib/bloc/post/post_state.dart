import 'package:api_bloc/model/post_model.dart';

abstract class PostState {
  List templist = [];
}

class PostInitial extends PostState {}

class PostFetchDataLoadingState extends PostState {}

class PostFetchDataLoadedSuccessState extends PostState {
  final List<PostModel> data;

  PostFetchDataLoadedSuccessState({required this.data});
}

class PostFetchDataErrorState extends PostState {}

class PostFilterState extends PostState {
  final int searchedElement;

  PostFilterState({required this.searchedElement});
}
