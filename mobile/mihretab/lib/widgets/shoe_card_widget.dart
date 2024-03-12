import 'package:flutter/material.dart';
import 'package:mihretab/core/constants/constants.dart';
import 'package:mihretab/core/constants/theme_constants.dart';
import 'package:mihretab/core/routing/route_config.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          router.push('/details');
        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstants.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: ColorConstants.borderColor,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          width: 150,
          height: 240,
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Image.asset(
                    width: double.infinity,
                    height: 160,
                    'assets/leatherShoe.jpg',
                    fit: BoxFit.cover,
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Derby Leather Shoes',
                          style: TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: FontSizeConstants.fontSizeLarge,
                            fontWeight: FontWeightConstants.primaryFont,
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
                    SizedBox(height: 5),
                    Row(
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
