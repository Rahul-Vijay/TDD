import 'package:capp/core/error/failures.dart';
import 'package:capp/core/usecases/usecase.dart';
import 'package:capp/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:capp/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomNumberTrivia extends UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
