import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:giggle_grid/common/common_app_bar.dart';
import 'package:go_router/go_router.dart';

import '../common/custom_text_widgets.dart';
import '../view_model/categories_random_joke_view_model.dart';

class CategoriesView extends ConsumerWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(categoriesRandomJokeViewModelProvider);
    return Scaffold(
      appBar: commonAppBar("Categories"),
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
              : ListView.builder(
                  itemCount: viewModel.categories.length,
                  itemBuilder: (BuildContext context, index) {
                    final category = viewModel.categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 25.0, right: 25.0),
                      child: MaterialButton(
                        onPressed: () {
                          viewModel.selectedCategoryUpdate(category.name);
                          viewModel.fetchRandomJoke();
                          context.go('/joke/${category.name}');
                        },
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        height: 70.0,
                        color: Colors.black87,
                        child: OrbitronFont(
                          text: category.name,
                          fontSize: 25.0,
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
