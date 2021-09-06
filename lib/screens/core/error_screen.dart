import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:netguru_values_generator/screens/core/scaled_text.dart';

import '../utils.dart';

class ErrorScreen extends StatelessWidget {
  final String information;
  final Widget child;
  final bool isRetryButtonClicked;
  final VoidCallback onRetryButtonClick;
  final bool showButton;

  const ErrorScreen({
    Key? key,
    required this.information,
    required this.child,
    required this.isRetryButtonClicked,
    required this.onRetryButtonClick,
    this.showButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: child,
          ),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    width: width * 0.8,
                    child: ScaledText(
                      value: information,
                      scale: 3,
                      align: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  showButton
                      ? Utils.buildButton(
                          context,
                          isButtonClicked: isRetryButtonClicked,
                          onTap: onRetryButtonClick,
                          title: AppLocalizations.of(context)!.retryButtonLabel,
                        )
                      : const SizedBox(),
                ],
              )),
        ],
      ),
    );
  }
}
