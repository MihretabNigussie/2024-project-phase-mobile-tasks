import 'package:ecommerce_clean_arch/featrues/products/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchInputField extends StatefulWidget {
  @override
  _SearchInputFieldState createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: TextField(
        onChanged: (String value) {
          if (value.isNotEmpty) {
            BlocProvider.of<ProductBloc>(context)
                .add(SearchProductsEvent(query: value));
          } else {
            BlocProvider.of<ProductBloc>(context).add(GetProductsEvent());
          }
        },
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search product ',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.50,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        ),
        onSubmitted: (String value) {},
      ),
    );
  }
}
