import 'package:flutter/material.dart';
import 'package:mihretab/core/routing/route_config.dart';
import 'package:mihretab/models/shoe_model.dart';

import '../core/constants/constants.dart';
import '../widgets/widgets.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _ratingController;
  late TextEditingController _categoryController;
  late TextEditingController _imageURLController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _descriptionController = TextEditingController();
    _ratingController = TextEditingController();
    _categoryController = TextEditingController();
    _imageURLController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _ratingController.dispose();
    _categoryController.dispose();
    _imageURLController.dispose();
    super.dispose();
  }

  void addToDatabaseHandler(ShoeModel shoeModel) {
    setState(() {
      shoeModel.addShoe(shoeModel);
    });

    router.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
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
              const SizedBox(height: 5),
              const Text(
                'Image URL',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: FontSizeConstants.fontVeryNormal,
                  fontWeight: FontWeightConstants.primaryFont,
                ),
              ),
              const SizedBox(height: 5),
              InputFieldWidget(
                height: 50,
                controller: _imageURLController,
              ),
              const SizedBox(height: 5),
              const Text(
                'Name',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: FontSizeConstants.fontVeryNormal,
                  fontWeight: FontWeightConstants.primaryFont,
                ),
              ),
              const SizedBox(height: 5),
              InputFieldWidget(
                height: 50,
                controller: _nameController,
              ),
              const SizedBox(height: 5),
              const Text(
                'Category',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: FontSizeConstants.fontVeryNormal,
                  fontWeight: FontWeightConstants.primaryFont,
                ),
              ),
              const SizedBox(height: 5),
              InputFieldWidget(
                height: 50,
                controller: _categoryController,
              ),
              const SizedBox(height: 5),
              const Text(
                'Price',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: FontSizeConstants.fontVeryNormal,
                  fontWeight: FontWeightConstants.primaryFont,
                ),
              ),
              const SizedBox(height: 5),
              InputFieldWidget(
                height: 50,
                controller: _priceController,
              ),
              const SizedBox(height: 5),
              const Text(
                'Rating',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: FontSizeConstants.fontVeryNormal,
                  fontWeight: FontWeightConstants.primaryFont,
                ),
              ),
              const SizedBox(height: 5),
              InputFieldWidget(
                height: 50,
                controller: _ratingController,
              ),
              const SizedBox(height: 5),
              const Text(
                'Description',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: FontSizeConstants.fontVeryNormal,
                  fontWeight: FontWeightConstants.primaryFont,
                ),
              ),
              const SizedBox(height: 5),
              InputFieldWidget(
                height: 140,
                controller: _descriptionController,
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                onTap: () {
                  final shoeModel = ShoeModel(
                    name: _nameController.text,
                    price: double.parse(_priceController.text),
                    rating: double.parse(_ratingController.text),
                    description: _descriptionController.text,
                    category: _categoryController.text,
                    imageURL: _imageURLController.text,
                  );
                  addToDatabaseHandler(shoeModel);
                },
                text: 'ADD',
                isOkay: true,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              ButtonWidget(
                onTap: () => router.pop(context),
                text: 'CANCEL',
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
