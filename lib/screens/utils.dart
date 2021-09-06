import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netguru_values_generator/screens/color_utils.dart';
import 'package:netguru_values_generator/screens/core/scaled_container.dart';
import 'package:netguru_values_generator/screens/core/scaled_icon.dart';
import 'package:netguru_values_generator/screens/core/scaled_text.dart';

class Utils {
  static double getSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? width
        : height;
  }

  static void showTextFieldDialog(
    BuildContext context, {
    required Function(String) onTextChange,
    required VoidCallback onAdd,
    required String hint,
    required String header,
    required String buttonLabel,
  }) =>
      showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: _buildDialogContent(
            context,
            header,
            hint,
            buttonLabel,
            onTextChange,
            onAdd,
          ),
        ),
      );

  static Widget _buildDialogContent(
    BuildContext context,
    String header,
    String hint,
    String buttonLabel,
    Function(String) onTextChange,
    VoidCallback onAdd,
  ) {
    return Center(
      child: Stack(
        children: [
          ScaledContainer(
            color: ColorUtils.of(context).background,
            scale: 0.75,
            borderRadius: BorderRadius.circular(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: const SizedBox()),
                Expanded(
                  child: ScaledText(
                    scale: 1.7,
                    value: header,
                    align: TextAlign.center,
                  ),
                ),
                Expanded(child: const SizedBox()),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: customTextField(
                      context,
                      onChange: onTextChange,
                      hint: hint,
                    ),
                  ),
                ),
                Expanded(
                    child: buildButton(
                  context,
                  title: buttonLabel,
                  isButtonClicked: false,
                  onTap: onAdd,
                )),
                Expanded(child: const SizedBox()),
              ],
            ),
            border: Border.all(
              color: ColorUtils.of(context).accent,
              width: 2,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: ScaledContainer(
                scale: 0.08,
                color: ColorUtils.of(context).text,
                shape: BoxShape.circle,
                child: ScaledIcon(
                  scale: 1.6,
                  icon: Icons.close,
                  color: ColorUtils.of(context).background,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget customTextField(
    BuildContext context, {
    required Function(String) onChange,
    required String hint,
  }) {
    return TextField(
      onChanged: onChange,
      maxLines: null,
      cursorColor: ColorUtils.of(context).text,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorUtils.of(context).text,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorUtils.of(context).text,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: ColorUtils.of(context).accent,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: ColorUtils.of(context).text.withOpacity(0.4),
            ),
      ),
    );
  }

  static Widget iconButtonWithBottomLabel(
    BuildContext context, {
    required IconData icon,
    required double iconScale,
    required String label,
    required double labelScale,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaledIcon(
            icon: icon,
            scale: iconScale,
          ),
          const SizedBox(
            height: 5,
          ),
          ScaledText(
            value: label,
            scale: labelScale,
            style: TextStyle(color: ColorUtils.of(context).background),
          ),
        ],
      ),
    );
  }

  static Widget buildButton(
    BuildContext context, {
    required String title,
    required bool isButtonClicked,
    required VoidCallback onTap,
  }) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: isButtonClicked ? () {} : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        alignment: Alignment.center,
        width: width * 0.4,
        height: height * 0.065,
        child: Text(
          title,
          style: TextStyle(
            color: ColorUtils.of(context).text,
          ),
        ),
        decoration: BoxDecoration(
          color: isButtonClicked
              ? ColorUtils.of(context).background
              : ColorUtils.of(context).accent,
          border: Border.all(
            color: ColorUtils.of(context).accent,
            width: isButtonClicked ? 2.0 : 0.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }

  static SnackBar snackBar(
    BuildContext context, {
    required String errorMessage,
    double widthPercentage = 0.8,
    double heightPercentage = 0.08,
    Duration duration = const Duration(milliseconds: 3500),
  }) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SnackBar(
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.fixed,
      content: Container(
        alignment: Alignment.center,
        width: width * widthPercentage,
        height: height * heightPercentage,
        child: ScaledText(
          value: errorMessage,
          align: TextAlign.center,
          scale: 1.7,
        ),
        decoration: BoxDecoration(
          color: ColorUtils.of(context).red,
          border: Border.all(color: ColorUtils.of(context).text, width: 1.0),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      elevation: 0.0,
      duration: duration,
    );
  }
}
