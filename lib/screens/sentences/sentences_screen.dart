import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_values_generator/blocs/sentence/sentence_bloc.dart';
import 'package:netguru_values_generator/main.dart';
import 'package:netguru_values_generator/screens/color_utils.dart';
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
                onPressed: () =>
                    BlocProvider.of<SentenceBloc>(context).add(
                      SentenceEvent.addToFavourite(state.actualSentence),
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

  bool hasLoadedSentences(SentenceState state) => state.sentences.length != 0;

  Widget _buildContent(BuildContext context, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 2, child: const SizedBox()),
        ScaledContainer(
          scale: 0.25,
          child: ScaledIcon(
            icon: Icons.done,
            color: ColorUtils.of(context).text,
            scale: 4,
          ),
          color: ColorUtils.of(context).accent,
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
    return MediaQuery
        .of(context)
        .orientation == Orientation.landscape
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
                child: IconButton(
                  onPressed: () {},
                  icon: ScaledIcon(
                    icon: Icons.format_quote_rounded,
                    scale: 2.7,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () =>
                      Utils.showTextFieldDialog(
                        context,
                        header: 'Add new sentence',
                        hint: 'Sentence value',
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
                  icon: ScaledIcon(
                    icon: Icons.add,
                    scale: 2.7,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: ScaledIcon(
                    icon: Icons.favorite,
                    scale: 2.3,
                  ),
                ),
              ),
            ],
          ),
          color: ColorUtils.of(context).text,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(36),
        ),
      ),
    );
  }

  Widget _buildAnimatedText(BuildContext context,
      String value,) {
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

