import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:netguru_values_generator/screens/color_utils.dart';
import 'package:netguru_values_generator/screens/core/scaled_text.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: ColorUtils.of(context).background,
              color: ColorUtils.of(context).accent,
            ),
            const SizedBox(
              height: 40,
            ),
            ScaledText(
              value: AppLocalizations.of(context)!.loadingLabel,
              scale: 3,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
