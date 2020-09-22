import 'package:capp/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRemoteDataSource{
  Future<NumberTrivia> getConcreteNumberTrivia(int number);
  Future<NumberTrivia> getRandomNumberTrivia();
}