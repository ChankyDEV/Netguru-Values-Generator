import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values_generator/blocs/favourites/favourite_bloc.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/screens/color_utils.dart';
import 'package:netguru_values_generator/screens/core/scaled_text.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScaledText(
          value: 'Favourites',
          scale: 1.7,
        ),
        iconTheme: IconThemeData(
          color: ColorUtils.of(context).background,
        ),
      ),
      body: BlocConsumer<FavouriteBloc, FavouriteState>(
        listener: (context, state) {},
        builder: (context, state) => state.isLoading
            ? CircularProgressIndicator()
            : _buildContent(
                context,
                state.favourites,
              ),
      ),
    );
  }
}

Widget _buildContent(
  BuildContext context,
  List<Sentence> sentences,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: sentences.isNotEmpty
        ? ListView.builder(
            itemCount: sentences.length,
            itemBuilder: (context, index) => _buildListItem(
              context,
              sentence: sentences[index],
            ),
          )
        : _buildNoDataScreen(),
  );
}

Widget _buildNoDataScreen() {
  return Center(
    child: ScaledText(
      value: 'You dont have favourites',
      scale: 2.5,
    ),
  );
}

Widget _buildListItem(BuildContext context, {required Sentence sentence}) {
  return Card(
    color: ColorUtils.of(context).accent,
    child: ListTile(
      title: ScaledText(
        value: sentence.value,
        scale: 1.5,
      ),
    ),
  );
}
