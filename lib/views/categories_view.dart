import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:giggle_grid/common/common_app_bar.dart';

import '../common/custom_text_widgets.dart';
import '../view_model/categories_view_model.dart';

class CategoriesView extends ConsumerWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(categoriesViewModelProvider);
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
              ? Center(child: Text(viewModel.errorMessage))
              : ListView.builder(
                  itemCount: viewModel.categories.length,
                  itemBuilder: (context, index) {
                    final category = viewModel.categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 25.0, right: 25.0),
                      child: MaterialButton(
                        onPressed: () {},
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
