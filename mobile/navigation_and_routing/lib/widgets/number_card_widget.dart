import 'package:flutter/material.dart';

import '../core/constants/constants.dart';

class NumberCard extends StatelessWidget {
  final Color color;
  final String number;
  final Color textColor;
  const NumberCard(
      {required this.color, required this.number, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: ColorConstants.borderColor,
                blurRadius: 1,
                offset:  Offset(1, 0),
              ),
            ],
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: textColor,
                fontSize: FontSizeConstants.fontSizeLarge,
                fontWeight: FontWeightConstants.primaryFont,
              ),
            ),
          )),
    );
  }
}
