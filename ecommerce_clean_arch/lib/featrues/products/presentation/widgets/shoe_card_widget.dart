import 'package:ecommerce_clean_arch/core/constants/constants.dart';

import 'package:ecommerce_clean_arch/featrues/products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class PrdoductCard extends StatelessWidget {
  final ProductEntity productModel;
  const PrdoductCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          // router.push('/details/${shoeModel.name}');
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
                    productModel.image,
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
                          productModel.title,
                          style: const TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: FontSizeConstants.fontSizeLarge,
                            fontWeight: FontWeightConstants.primaryFont,
                          ),
                        ),
                        Text(
                          '\$${productModel.price}',
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
                          productModel.category,
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
                              'rating',
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
