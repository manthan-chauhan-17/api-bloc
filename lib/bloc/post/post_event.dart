abstract class PostEvent {}

class PostInitialFetchEvent extends PostEvent {}

class PostFilterEvent extends PostEvent {
  final String searched;

  PostFilterEvent({required this.searched});
}
