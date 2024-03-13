import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mihretab/models/shoe_model.dart';
import '../core/constants/constants.dart';
import '../widgets/widgets.dart';

class UpdatePage extends StatefulWidget {
  final ShoeModel shoe;
  const UpdatePage({Key? key, required this.shoe}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _ratingController;
  late TextEditingController _categoryController;
  late TextEditingController _imageURLController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.shoe.name);
    _priceController =
        TextEditingController(text: widget.shoe.price.toString());
    _descriptionController =
        TextEditingController(text: widget.shoe.description);
    _ratingController =
        TextEditingController(text: widget.shoe.rating.toString());
    _categoryController = TextEditingController(text: widget.shoe.category);
    _imageURLController = TextEditingController(text: widget.shoe.imageURL);
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

  void updateProductHandler(ShoeModel shoeModel) {
    setState(() {
      int index = widget.shoe.getIndex(widget.shoe);
      ShoeModel.shoes[index] = shoeModel;
    });

    context.pop();
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
                    'Update Product',
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
                  ShoeModel shoeModel = ShoeModel(
                    name: _nameController.text,
                    price: double.parse(_priceController.text),
                    rating: double.parse(_ratingController.text),
                    description: _descriptionController.text,
                    category: _categoryController.text,
                    imageURL: _imageURLController.text,
                  );
                  updateProductHandler(shoeModel);
                },
                text: 'Update',
                isOkay: true,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              ButtonWidget(
                onTap: () => context.pop(),
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
