import 'package:flutter/material.dart';
import '../core/constants/constants.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final bool isOkay;
  final double width;
  const ButtonWidget(
      {super.key, this.text, this.isOkay = true, this.width = double.infinity});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
            color: isOkay
                ? ColorConstants.primaryColor
                : ColorConstants.backgroundColor,
            border: Border.all(
              color: isOkay
                  ? ColorConstants.primaryColor
                  : ColorConstants.secondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "$text",
            style: TextStyle(
                color: isOkay
                    ? ColorConstants.backgroundColor
                    : ColorConstants.secondaryColor,
                fontSize: FontSizeConstants.fontVeryNormal,
                fontWeight: FontWeightConstants.primaryFontBold),
          ),
        ),
      ),
    );
  }
}
