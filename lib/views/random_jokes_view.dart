import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:giggle_grid/common/common_app_bar.dart';
import 'package:giggle_grid/view_model/random_jokes_by_category_view_model.dart';
import '../common/custom_text_widgets.dart';

class RandomJokesView extends ConsumerWidget {
  final String category;

  const RandomJokesView(this.category, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(randomJokesByCategoryViewModelProvider.notifier).init(category);
    final viewModel = ref.watch(randomJokesByCategoryViewModelProvider);

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
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(viewModel.randomJoke!.value),
                    )
                  : const OrbitronFont(
                      text: "No joke available",
                      fontSize: 40.0,
                      fontColor: Colors.black,
                    ),
    );
  }
}
