import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:giggle_grid/common/common_app_bar.dart';

import '../common/custom_text_widgets.dart';
import '../view_model/categories_random_joke_view_model.dart';

class RandomJokesView extends ConsumerWidget {
  final String category;

  const RandomJokesView(this.category, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(categoriesRandomJokeViewModelProvider);

    return Scaffold(
      appBar: commonAppBar("Random Jokes"),
      body: viewModel.isLoading
          ? const Center(
              child: SpinKitWaveSpinner(
                color: Colors.black,
                waveColor: Colors.black,
                size: 200.0,
              ),
            )
          : viewModel.errorMessage.isNotEmpty
              ? OrbitronFont(
                  text: viewModel.errorMessage,
                  fontSize: 40.0,
                  fontColor: Colors.black,
                )
              : viewModel.randomJoke != null
                  ? ListTile(
                      title: OrbitronFont(
                        text: viewModel.randomJoke!.value,
                        fontSize: 25.0,
                        fontColor: Colors.black,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          viewModel.isJokeLiked()
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 35.0,
                        ),
                        onPressed: () {
                          if (viewModel.isJokeLiked()) {
                            viewModel.unlikeJoke();
                          } else {
                            viewModel.likeJoke();
                          }
                        },
                      ))
                  : const OrbitronFont(
                      text: "No joke available",
                      fontSize: 40.0,
                      fontColor: Colors.black,
                    ),
    );
  }
}
