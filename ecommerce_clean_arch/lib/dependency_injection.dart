import 'package:ecommerce_clean_arch/featrues/products/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:ecommerce_clean_arch/featrues/products/data/data_source/remote_data_source/remote_data_source_impl.dart';
import 'package:ecommerce_clean_arch/featrues/products/data/repositories/product_repositiry_impl.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/repositories/product_repository.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/usecases/search_product_usecase.dart';
import 'package:ecommerce_clean_arch/featrues/products/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(
    () => ProductBloc(searchProductsUseCase: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => SearchProductUsecase(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSoruceImpl(
      client: sl(),
    ),
  );

  //! External
  sl.registerLazySingleton(() => http.Client());
}
