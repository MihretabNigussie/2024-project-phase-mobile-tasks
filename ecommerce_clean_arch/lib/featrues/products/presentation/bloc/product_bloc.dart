import 'package:ecommerce_clean_arch/featrues/products/domain/entities/product_entity.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/usecases/search_product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';
part 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({
    required SearchProductUsecase searchProductsUseCase,
  })  : _searchProductsUseCase = searchProductsUseCase,
        super(ProductInitialState()) {
    on<SearchProductsEvent>(_searchHandler);
  }

  final SearchProductUsecase _searchProductsUseCase;

  // Future<void> _filterHandler(
  //   FilterDoctorsEvent event,
  //   Emitter<DoctorState> emit,
  // ) async {
  //   emit(FilterDoctorsLoading());
  //   final result = await _filterDoctorsUseCase.call(
  //     FilterDoctorsParams(
  //       speciality: event.speciality,
  //       gender: event.gender,
  //       rating: event.rating,
  //       hospitalId: event.hospitalID,
  //       experience: event.experience,
  //     ),
  //   );
  //   result.fold(
  //     (error) => emit(
  //       const DoctorFailureState(error: 'unable to get doctors'),
  //     ),
  //     (doctors) => emit(
  //       FilterDoctorsLoaded(doctors),
  //     ),
  //   );
  // }

  Future<void> _searchHandler(
    SearchProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(SearchProductsLoading());
    final result = await _searchProductsUseCase.call(event.query);
    result.fold(
      (error) => emit(
        SearchProductError(message: 'unable to get products'),
      ),
      (doctors) {
        if (doctors.isEmpty) {
          emit(const NoSearchProductFound('No products found!'));
        } else {
          emit(SearchProductsSuccess(doctors));
        }
      },
    );
  }
}
