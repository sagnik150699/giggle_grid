import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giggle_grid/common/common_app_bar.dart';
import '../common/custom_text_widgets.dart';
import '../view_model/favourites_view_model.dart';

class FavouritesView extends ConsumerWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(favoritesViewModelProvider);

    return Scaffold(
      appBar: commonAppBar("Favourites"),
      body: viewModel.likedJokes.isEmpty
          ? const Center(
              child: OrbitronFont(
              text: "No joke available",
              fontSize: 40.0,
              fontColor: Colors.black,
            ))
          : ListView.builder(
              itemCount: viewModel.likedJokes.length,
              itemBuilder: (context, index) {
                final joke = viewModel.likedJokes[index];
                return Padding(
                  padding:   const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListTile(
                    title: OrbitronFont(text: joke['joke'] ?? '', fontSize: 17.0,
                    fontColor: Colors.black),
                    trailing: IconButton(
                      icon: Icon(
                        viewModel.isJokeLiked(joke['id'] ?? '')
                            ? Icons.favorite
                            : Icons.favorite_border,
                      size: 35.0,
                      ),
                      onPressed: () {
                        if (viewModel.isJokeLiked(joke['id'] ?? '')) {
                          viewModel.unlikeJoke(joke['id'] ?? '');
                        }
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
