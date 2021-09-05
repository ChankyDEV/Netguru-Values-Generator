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
    required Function(String) onChange,
    required VoidCallback onAdd,
    required String hint,
    required String header,
  }) =>
      showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: _buildDialogContent(
            context,
            header,
            hint,
            onChange,
            onAdd,
          ),
        ),
      );

  static Widget _buildDialogContent(
    BuildContext context,
    String header,
    String hint,
    Function(String) onChange,
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
                      onChange: onChange,
                      hint: hint,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: onAdd,
                    child: ScaledText(
                      scale: 1.7,
                      value: 'Add',
                      align: TextAlign.center,
                      style: TextStyle(color: ColorUtils.of(context).accent),
                    ),
                  ),
                ),
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
}
