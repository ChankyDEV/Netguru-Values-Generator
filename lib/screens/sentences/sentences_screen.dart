import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:netguru_values_generator/blocs/sentence/sentence_bloc.dart';
import 'package:netguru_values_generator/screens/color_utils.dart';
import 'package:netguru_values_generator/screens/core/error_screen.dart';
import 'package:netguru_values_generator/screens/core/loading_screen.dart';
import 'package:netguru_values_generator/screens/core/scaled_container.dart';
import 'package:netguru_values_generator/screens/core/scaled_icon.dart';
import 'package:netguru_values_generator/screens/core/scaled_text.dart';
import 'package:netguru_values_generator/screens/utils.dart';
import 'package:netguru_values_generator/services/routing/routing_service.dart';

class SentencesScreen extends StatelessWidget {
  const SentencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SentenceBloc, SentenceState>(
        listenWhen: (previous, current) =>
            previous.showSnackBar != current.showSnackBar,
        listener: (context, state) {
          if (state.showSnackBar) {
            ScaffoldMessenger.of(context).showSnackBar(
              Utils.snackBar(
                context,
                errorMessage: state.errorMessage,
              ),
            );
            BlocProvider.of<SentenceBloc>(context).add(SentenceEvent.reset());
          }
        },
        builder: (BuildContext context, state) {
          return state.isLoading
              ? LoadingScreen()
              : state.hasError
                  ? _showErrorScreen(
                      context,
                      state.isRetryButtonClicked,
                    )
                  : Scaffold(
                      appBar: AppBar(
                        title: ScaledText(
                          value: AppLocalizations.of(context)!
                              .generatorScreenHeader,
                          scale: 2.2,
                        ),
                        centerTitle: true,
                        actions: [
                          IconButton(
                            onPressed: () =>
                                BlocProvider.of<SentenceBloc>(context).add(
                              SentenceEvent.addToFavourite(
                                  state.actualSentence),
                            ),
                            icon: ScaledIcon(
                              scale: 2,
                              icon: Icons.favorite,
                              color: state.actualSentence.isFavourite
                                  ? ColorUtils.of(context).red
                                  : ColorUtils.of(context).background,
                            ),
                          )
                        ],
                      ),
                      body: hasLoadedSentences(state)
                          ? Stack(
                              children: [
                                _buildContent(
                                  context,
                                  state.actualSentence.value,
                                ),
                                _buildActions(context, state),
                              ],
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    );
        },
      ),
    );
  }

  bool hasLoadedSentences(SentenceState state) => state.sentences.length != 0;

  Widget _buildContent(BuildContext context, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 2, child: const SizedBox()),
        ScaledContainer(
          scale: 0.25,
          color: ColorUtils.of(context).accent,
          shape: BoxShape.circle,
          child: ScaledIcon(
            scale: 3,
            icon: Icons.format_quote_rounded,
            color: ColorUtils.of(context).text,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 0.0,
              ),
              child: _buildAnimatedText(
                context,
                value,
              ),
            ),
          ),
        ),
        Expanded(flex: 2, child: const SizedBox()),
      ],
    );
  }

  Widget _buildActions(BuildContext context, SentenceState state) {
    final size = Utils.getSize(context);
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? const SizedBox()
        : Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Container(
              height: size * 0.17,
              alignment: Alignment.center,
              child: ScaledContainer(
                scale: 0.85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Utils.iconButtonWithBottomLabel(
                        context,
                        icon: Icons.format_quote_rounded,
                        iconScale: 2.9,
                        label: AppLocalizations.of(context)!.allSentencesHeader,
                        labelScale: 1.4,
                        onTap: () => Navigator.of(context).pushNamed(
                          Screens.allSentences,
                          arguments: state.sentences,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Utils.iconButtonWithBottomLabel(
                        context,
                        icon: Icons.add,
                        iconScale: 2.9,
                        label: AppLocalizations.of(context)!.addBottomTabLabel,
                        labelScale: 1.4,
                        onTap: () => Utils.showTextFieldDialog(
                          context,
                          header:
                              AppLocalizations.of(context)!.allSentencesHeader,
                          hint: AppLocalizations.of(context)!.hintValue,
                          onChange: (value) {
                            BlocProvider.of<SentenceBloc>(context).add(
                              SentenceEvent.newSentenceValueChanged(value),
                            );
                          },
                          onAdd: () {
                            BlocProvider.of<SentenceBloc>(context).add(
                              SentenceEvent.createNewSentence(),
                            );
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Utils.iconButtonWithBottomLabel(
                        context,
                        icon: Icons.favorite,
                        iconScale: 2.8,
                        label: AppLocalizations.of(context)!
                            .favouriteBottomTabLabel,
                        labelScale: 1.4,
                        onTap: () =>
                            Navigator.of(context).pushNamed(Screens.favourites),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                color: ColorUtils.of(context).text,
                borderRadius: BorderRadius.circular(36),
              ),
            ),
          );
  }

  Widget _buildAnimatedText(
    BuildContext context,
    String value,
  ) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        final _opacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation);
        final _offset = Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(animation);
        return SlideTransition(
          position: _offset,
          child: FadeTransition(
            opacity: _opacity,
            child: child,
          ),
        );
      },
      child: ScaledText(
        key: ValueKey(value),
        value: value,
        scale: 2.2,
        align: TextAlign.center,
      ),
    );
  }

  Widget _showErrorScreen(BuildContext context, bool isRetryButtonClicked) {
    return ErrorScreen(
      information:
          AppLocalizations.of(context)!.cantGetGeneratedSentencesErrorMessage,
      isRetryButtonClicked: isRetryButtonClicked,
      onRetryButtonClick: () => getAll(context),
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

  void getAll(BuildContext context) {
    BlocProvider.of<SentenceBloc>(context).add(
      SentenceEvent.reload(),
    );
  }
}
