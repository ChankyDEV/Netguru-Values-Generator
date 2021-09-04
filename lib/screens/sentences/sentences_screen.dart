import 'package:flutter/material.dart';

class SentencesScreen extends StatelessWidget {
  const SentencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Generator',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Almost before we knew it',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
