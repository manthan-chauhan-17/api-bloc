import 'package:api_bloc/bloc/post/post_bloc.dart';
import 'package:api_bloc/bloc/post/post_event.dart';
import 'package:api_bloc/bloc/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts Page"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        bloc: postBloc,
        builder: (context, state) {
          if (state is PostFetchDataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostFetchDataLoadedSuccessState) {
            final successState = state as PostFetchDataLoadedSuccessState;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      hintText: "Search",
                    ),
                    onChanged: (value) {
                      postBloc.add(PostFilterEvent(searched: value));
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: successState.data.length,
                    itemBuilder: (context, index) {
                      final item = successState.data[index];

                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(item.id.toString()),
                        ),
                        title: Text(item.title.toString()),
                        subtitle: Text(item.body.toString()),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is PostFetchDataErrorState) {
            return const Center(
              child: Text("Something Went Wrong"),
            );
          } else if (state is PostFilterState) {
            final filterState = state as PostFilterState;
            print("Searched Element ${filterState.searchedElement}");
            return Center(
              child: Text("data"),
            );
          } else {
            return const Center(
              child: Text("No State Emitted"),
            );
          }
        },
      ),
    );
  }
}
