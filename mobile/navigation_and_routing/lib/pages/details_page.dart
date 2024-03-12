import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mihretab/models/shoe_model.dart';
import '../core/constants/constants.dart';
import '../widgets/widgets.dart';

class DetailsPage extends StatefulWidget {
  final ShoeModel shoe;

  const DetailsPage({super.key, required this.shoe});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  void deleteShoe() {
    setState(() {
      widget.shoe.deleteShoe(widget.shoe.getIndex(widget.shoe));
    });
    print('Shoe deleted');
    context.pop();
  }

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
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Image.network(
                      widget.shoe.imageURL,
                      fit: BoxFit.cover,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.shoe.name,
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
                              widget.shoe.rating.toString(),
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
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.shoe.category,
                          style: const TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: FontSizeConstants.fontSizeExtraLarge,
                            fontWeight: FontWeightConstants.primaryFontBold,
                          ),
                        ),
                        Text(
                          '\$${widget.shoe.price}',
                          style: const TextStyle(
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
                      width: double.infinity,
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
                    Text(
                      widget.shoe.description,
                      style: const TextStyle(
                        color: ColorConstants.textColorLight,
                        fontSize: FontSizeConstants.fontVeryNormal,
                        fontWeight: FontWeightConstants.primaryFont,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          onTap: () {
                            deleteShoe();
                          },
                          text: 'DELETE',
                          isOkay: false,
                          width: 152,
                        ),
                        ButtonWidget(
                          onTap: () => {},
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
