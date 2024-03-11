import 'package:flutter/material.dart';

import '../core/constants/constants.dart';
import '../widgets/widgets.dart';

class AddOrUpdatePage extends StatelessWidget {
  const AddOrUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackButtonWidget(),
                  SizedBox(width: 90),
                  Text(
                    'Add Product',
                    style: TextStyle(
                      color: ColorConstants.textColor,
                      fontSize: FontSizeConstants.fontSizeNormal,
                      fontWeight: FontWeightConstants.primaryFont,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Stack(
                children: [
                  InputFieldWidget(height: 190),
                  Positioned(
                    bottom: 55,
                    right: 130,
                    child: Column(
                      children: [
                        Icon(
                          Icons.image_outlined,
                          color: ColorConstants.textColor,
                          size: 40,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'upload image',
                          style: TextStyle(
                            color: ColorConstants.textColor,
                            fontSize: FontSizeConstants.fontVeryNormal,
                            fontWeight: FontWeightConstants.primaryFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'name',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: FontSizeConstants.fontVeryNormal,
                  fontWeight: FontWeightConstants.primaryFont,
                ),
              ),
              SizedBox(height: 5),
              InputFieldWidget(height: 50),
              SizedBox(height: 5),
              Text(
                'category',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: FontSizeConstants.fontVeryNormal,
                  fontWeight: FontWeightConstants.primaryFont,
                ),
              ),
              SizedBox(height: 5),
              InputFieldWidget(height: 50),
              SizedBox(height: 5),
              Text(
                'price',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: FontSizeConstants.fontVeryNormal,
                  fontWeight: FontWeightConstants.primaryFont,
                ),
              ),
              SizedBox(height: 5),
              InputFieldWidget(height: 50),
              SizedBox(height: 5),
              Text(
                'description',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: FontSizeConstants.fontVeryNormal,
                  fontWeight: FontWeightConstants.primaryFont,
                ),
              ),
              SizedBox(height: 5),
              InputFieldWidget(height: 140),
              SizedBox(height: 20),
              ButtonWidget(
                text: 'ADD',
                isOkay: true,
                width: double.infinity,
              ),
              SizedBox(height: 10),
              ButtonWidget(
                text: 'DELETE',
                isOkay: false,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
