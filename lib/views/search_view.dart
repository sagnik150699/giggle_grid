import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:giggle_grid/common/logger.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/custom_text_widgets.dart';
import '../view_model/search_view_model.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchViewModel = ref.watch(searchViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                style:
                    GoogleFonts.orbitron(fontSize: 20.0, color: Colors.white),
                onChanged: (value) {
                  logger.d(value);
                  searchViewModel.searchJokes(value);
                },
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.tealAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: "Search Jokes",
                  hintStyle:
                      GoogleFonts.orbitron(fontSize: 15.0, color: Colors.white),
                  icon:
                      const Icon(Icons.search, color: Colors.white, size: 25.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: searchViewModel.isLoading
          ? const Center(
              child: SpinKitWaveSpinner(
                color: Colors.black,
                waveColor: Colors.black,
                size: 200.0,
              ),
            )
          : searchViewModel.errorMessage.isNotEmpty
              ? OrbitronFont(
                  text: searchViewModel.errorMessage,
                  fontSize: 40.0,
                  fontColor: Colors.black,
                )
              : ListView.builder(
                  itemCount: searchViewModel.searchResults.length,
                  itemBuilder: (context, index) {
                    final joke = searchViewModel.searchResults[index];
                    final isLiked = searchViewModel.isJokeLiked(joke.id);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ListTile(
                        title: OrbitronFont(text: joke.value,fontSize: 17.0,
                        fontColor: Colors.black,),
                        trailing: IconButton(
                          icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                            size: 35.0,),
                          onPressed: () =>
                              searchViewModel.toggleJokeLikeStatus(joke),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
