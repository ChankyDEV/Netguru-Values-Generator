import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values_generator/blocs/all_sentences/all_sentences_bloc.dart';
import 'package:netguru_values_generator/blocs/favourites/favourite_bloc.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/screens/color_utils.dart';
import 'package:netguru_values_generator/screens/core/error_screen.dart';
import 'package:netguru_values_generator/screens/core/loading_screen.dart';
import 'package:netguru_values_generator/screens/core/scaled_container.dart';
import 'package:netguru_values_generator/screens/core/scaled_icon.dart';
import 'package:netguru_values_generator/screens/core/scaled_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllSentencesScreen extends StatelessWidget {
  const AllSentencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScaledText(
          value: AppLocalizations.of(context)!.allSentencesHeader,
          scale: 1.7,
        ),
        iconTheme: IconThemeData(
          color: ColorUtils.of(context).background,
        ),
      ),
      body: BlocConsumer<AllSentencesBloc, AllSentencesState>(
        listener: (context, state) {},
        builder: (context, state) => state.isLoading
            ? LoadingScreen()
            : state.hasError
                ? _showErrorScreen(
                    context,
                    state.isRetryButtonClicked,
                  )
                : _buildContent(
                    context,
                    state.sentences,
                  ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<Sentence> sentences,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: sentences.length,
        itemBuilder: (context, index) => _buildListItem(
          context,
          sentence: sentences[index],
        ),
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

  Widget _showErrorScreen(
    BuildContext context,
    bool isRetryButtonClicked,
  ) {
    return ErrorScreen(
      information: AppLocalizations.of(context)!.cantShowAllSentences,
      isRetryButtonClicked: isRetryButtonClicked,
      onRetryButtonClick: () => getFavourites(context),
      child: ScaledContainer(
        scale: 0.4,
        color: ColorUtils.of(context).red,
        shape: BoxShape.circle,
        child: ScaledIcon(
          scale: 8,
          icon: Icons.cancel_outlined,
          color: ColorUtils.of(context).background,
        ),
      ),
    );
  }

  void getFavourites(BuildContext context) {
    BlocProvider.of<FavouriteBloc>(context).add(
      FavouriteEvent.reload(),
    );
  }
}
