import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values_generator/blocs/sentence/sentence_bloc.dart';
import 'package:netguru_values_generator/screens/consts/colors.dart';
import 'package:netguru_values_generator/screens/core/scaled_container.dart';
import 'package:netguru_values_generator/screens/core/scaled_icon.dart';
import 'package:netguru_values_generator/screens/core/scaled_text.dart';
import 'package:netguru_values_generator/screens/utils.dart';

class SentencesScreen extends StatelessWidget {
  const SentencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SentenceBloc, SentenceState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: ScaledText(
              value: 'Generator',
              scale: 2.2,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => BlocProvider.of<SentenceBloc>(context).add(
                  SentenceEvent.addToFavourite(state.actualSentence),
                ),
                icon: ScaledIcon(
                  scale: 2,
                  icon: Icons.favorite,
                  color: state.actualSentence.isFavourite
                      ? DarkColor.red
                      : Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
          body: state.sentences.length != 0
              ? Stack(
                  children: [
                    _buildContent(
                      context,
                      state.actualSentence.value,
                    ),
                    _buildActions(context),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, String value) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 2, child: const SizedBox()),
        ScaledContainer(
          scale: 0.25,
          child: ScaledIcon(
            icon: Icons.done,
            color: Theme.of(context).primaryColor,
            scale: 4,
          ),
          color: Theme.of(context).accentColor,
          shape: BoxShape.circle,
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

  Widget _buildActions(BuildContext context) {
    final size = Utils.getSize(context);
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? const SizedBox()
        : Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: Container(
              height: size * 0.15,
              alignment: Alignment.center,
              child: ScaledContainer(
                scale: 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.format_quote_rounded,
                        size: 32,
                      ),
                    ),
                    Expanded(
                      child: Icon(
                        Icons.add,
                        size: 32,
                      ),
                    ),
                    Expanded(
                      child: Icon(
                        Icons.favorite,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                color: Theme.of(context).primaryColor,
                shape: BoxShape.rectangle,
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
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          final _opacity = Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation);
          return FadeTransition(
            opacity: _opacity,
            child: child,
          );
        },
        child: ScaledText(
          value: value,
          scale: 2.2,
          align: TextAlign.center,
        ));
  }
}
