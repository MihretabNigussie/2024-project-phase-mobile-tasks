import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mihretab/models/shoe_model.dart';
import '../core/constants/constants.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ColorConstants.profilePictureColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'July 14, 2023',
                              style: TextStyle(
                                color: ColorConstants.textColorLight,
                                fontSize: FontSizeConstants.fontExtraSmall,
                                fontWeight: FontWeightConstants.primaryFont,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Hello, ',
                                  style: TextStyle(
                                    color: ColorConstants.textColorLight,
                                    fontSize: FontSizeConstants.fontSmall,
                                    fontWeight: FontWeightConstants.primaryFont,
                                  ),
                                ),
                                Text(
                                  'Yohannes',
                                  style: TextStyle(
                                    color: ColorConstants.darkTextColor,
                                    fontSize: FontSizeConstants.fontSmall,
                                    fontWeight:
                                        FontWeightConstants.primaryFontBold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstants.borderColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: <Widget>[
                          const Positioned(
                            top: 7,
                            left: 7,
                            child: Icon(
                              Icons.notifications_none_outlined,
                              color: ColorConstants.textColorLight,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 12,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: ColorConstants.primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Available Products',
                  style: TextStyle(
                    color: ColorConstants.textColor,
                    fontSize: FontSizeConstants.fontSizeExtraLarge,
                    fontWeight: FontWeightConstants.primaryFontBold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: ShoeModel.shoes.isNotEmpty
                        ? ListView.builder(
                            itemCount: ShoeModel.shoes.length,
                            itemBuilder: (context, index) {
                              final ShoeModel shoe = ShoeModel.shoes[index];
                              return ShoeCard(shoeModel: shoe);
                            },
                          )
                        : const Center(
                            child: Text(
                              'No Product is Found!',
                              style: TextStyle(
                                color: ColorConstants.textColor,
                                fontSize: FontSizeConstants.fontSizeExtraLarge,
                                fontWeight: FontWeightConstants.primaryFontBold,
                              ),
                            ),
                          )),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            context.push('/addorupdatepage');
          },
          child: Icon(
            Icons.add_rounded,
            color: ColorConstants.backgroundColor,
            size: 36,
          ),
          backgroundColor: ColorConstants.primaryColor,
        ));
  }
}
