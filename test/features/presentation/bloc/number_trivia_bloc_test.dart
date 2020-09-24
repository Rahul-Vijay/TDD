import 'package:capp/core/util/input_converter.dart';
import 'package:capp/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:capp/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:capp/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetConcreteNumberTrivia extends Mock
    implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  NumberTriviaBloc bloc;
  MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
        random: mockGetRandomNumberTrivia,
        concrete: mockGetConcreteNumberTrivia,
        inputConverter: mockInputConverter);
  });
}