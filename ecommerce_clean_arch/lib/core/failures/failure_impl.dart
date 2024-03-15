import 'package:ecommerce_clean_arch/core/failures/failures.dart';

class ServerFailure extends Failure {
  final String message;
  const ServerFailure({required this.message});
  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
