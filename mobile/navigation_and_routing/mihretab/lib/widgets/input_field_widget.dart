import 'package:flutter/material.dart';
import 'package:mihretab/core/constants/theme_constants.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget(
      {super.key, required this.height, required this.controller});
  final num height;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height.toDouble(),
      decoration: BoxDecoration(
        color: ColorConstants.inputFieldColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
