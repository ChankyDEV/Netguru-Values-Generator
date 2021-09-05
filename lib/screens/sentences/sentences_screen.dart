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
                      child: IconButton(
                        onPressed: () {},
                        icon: ScaledIcon(
                          icon: Icons.format_quote_rounded,
                          scale: 3.5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () =>
                            _showDialog(context, onChange: (value) {
                          BlocProvider.of<SentenceBloc>(context).add(
                            SentenceEvent.newSentenceValueChanged(value),
                          );
                        }, onAdd: () {
                          BlocProvider.of<SentenceBloc>(context).add(
                            SentenceEvent.createNewSentence(),
                          );
                          Navigator.of(context).pop();
                        }),
                        icon: ScaledIcon(
                          icon: Icons.add,
                          scale: 3.5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: ScaledIcon(
                          icon: Icons.favorite,
                          scale: 2.9,
                        ),
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

  Widget _showDialog(
    BuildContext context, {
    required Function(String) onChange,
    required VoidCallback onAdd,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: _buildDialog(
          context,
          onChange,
          onAdd,
        ),
      ),
    );
    return const SizedBox();
  }

  Widget _buildDialog(
    BuildContext context,
    Function(String) onChange,
    VoidCallback onAdd,
  ) {
    return Center(
      child: ScaledContainer(
        color: Theme.of(context).scaffoldBackgroundColor,
        scale: 0.75,
        borderRadius: BorderRadius.circular(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: const SizedBox()),
            Expanded(
              child: ScaledText(
                scale: 2,
                value: 'Add new sentence',
                align: TextAlign.center,
              ),
            ),
            Expanded(child: const SizedBox()),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(
                  onChange: onChange,
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: onAdd,
                child: ScaledText(
                  scale: 2,
                  value: 'Add',
                  align: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
            Expanded(child: const SizedBox()),
          ],
        ),
        border: Border.all(
          color: Theme.of(context).accentColor,
          width: 2,
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Function(String) onChange;

  const CustomTextField({Key? key, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      maxLines: null,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).accentColor,
        hintText: 'Write some sentence',
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Theme.of(context).primaryColor.withOpacity(0.4),
            ),
      ),
    );
  }
}
