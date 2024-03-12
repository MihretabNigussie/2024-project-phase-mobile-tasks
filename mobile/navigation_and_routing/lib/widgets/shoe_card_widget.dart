import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mihretab/core/constants/constants.dart';
import 'package:mihretab/core/constants/theme_constants.dart';
import 'package:mihretab/models/shoe_model.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({super.key, required this.shoeModel});
  final ShoeModel shoeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          context.push('/details/${shoeModel.name}');
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
                  child: Image.network(
                    width: double.infinity,
                    height: 160,
                    shoeModel.imageURL,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          shoeModel.name,
                          style: const TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: FontSizeConstants.fontSizeLarge,
                            fontWeight: FontWeightConstants.primaryFont,
                          ),
                        ),
                        Text(
                          '\$${shoeModel.price}',
                          style: const TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: FontSizeConstants.fontVeryNormal,
                            fontWeight: FontWeightConstants.primaryFont,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          shoeModel.category,
                          style: const TextStyle(
                            color: ColorConstants.textColorLight,
                            fontSize: FontSizeConstants.fontSmall,
                            fontWeight: FontWeightConstants.primaryFont,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: ColorConstants.ratingStarColor,
                              size: 20,
                            ),
                            Text(
                              shoeModel.rating.toString(),
                              style: const TextStyle(
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
