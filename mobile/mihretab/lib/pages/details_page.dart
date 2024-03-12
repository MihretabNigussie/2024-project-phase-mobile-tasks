import 'package:flutter/material.dart';

import '../core/constants/constants.dart';
import '../widgets/widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/leatherShoe.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    left: 10,
                    child: BackButtonWidget(),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Men\'s Shoe',
                          style: TextStyle(
                            color: ColorConstants.textColorLight,
                            fontSize: FontSizeConstants.fontSmall,
                            fontWeight: FontWeightConstants.primaryFont,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorConstants.ratingStarColor,
                              size: 20,
                            ),
                            Text(
                              ' (4.0)',
                              style: TextStyle(
                                color: ColorConstants.ratingNumberColor,
                                fontSize: FontSizeConstants.fontExtraSmall,
                                fontWeight:
                                    FontWeightConstants.primaryFontLight,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Derby Leather',
                          style: TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: FontSizeConstants.fontSizeExtraLarge,
                            fontWeight: FontWeightConstants.primaryFontBold,
                          ),
                        ),
                        Text(
                          '\$120',
                          style: TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: FontSizeConstants.fontVeryNormal,
                            fontWeight: FontWeightConstants.primaryFont,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      textAlign: TextAlign.left,
                      'Size: ',
                      style: TextStyle(
                        color: ColorConstants.textColor,
                        fontSize: FontSizeConstants.fontSizeLarge,
                        fontWeight: FontWeightConstants.primaryFont,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      width: double.infinity, // Set the desired height
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return NumberCard(
                            color: index == 2
                                ? ColorConstants.primaryColor
                                : ColorConstants.backgroundColor,
                            number: (39 + index).toString(),
                            textColor: index == 2
                                ? ColorConstants.backgroundColor
                                : ColorConstants.darkTextColor,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                      style: TextStyle(
                        color: ColorConstants.textColorLight,
                        fontSize: FontSizeConstants.fontVeryNormal,
                        fontWeight: FontWeightConstants.primaryFont,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          text: 'DELETE',
                          isOkay: false,
                          width: 152,
                        ),
                        ButtonWidget(
                          text: 'UPDATE',
                          isOkay: true,
                          width: 152,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
