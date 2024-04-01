import 'package:ecommerce_clean_arch/core/constants/constants.dart';
import 'package:ecommerce_clean_arch/featrues/products/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_clean_arch/featrues/products/presentation/widgets/search_field.dart';
import 'package:ecommerce_clean_arch/featrues/products/presentation/widgets/shoe_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                children: [
                  SearchInputField(),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Search Results',
                style: TextStyle(
                  color: ColorConstants.textColor,
                  fontSize: FontSizeConstants.fontSizeLarge,
                  fontWeight: FontWeightConstants.primaryFontBold,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                if (state is ProductInitialState) {
                  return const Center(child: Text('Start Searching'));
                } else if (state is GetProductsEvent) {
                  return const Center(child: Text('Start Searching'));
                } else if (state is SearchProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchProductsSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return PrdoductCard(productModel: product);
                      },
                    ),
                  );
                } else if (state is NoSearchProductFound) {
                  return const Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 0.09,
                        letterSpacing: 0.15,
                      ),
                    ),
                  );
                } else if (state is SearchProductError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text('Error'));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
