import 'package:capp/core/util/input_converter.dart';
import 'package:capp/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:capp/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:capp/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:capp/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:dartz/dartz.dart';
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

  test("intiaState should be Empty", () {
    // assert
    expect(bloc.initialState, equals(Empty()));
  });

  group("GetTriviaForConcreteNumber", (){
    final tNumberString='1';
    final tNumberParsed = int.parse(tNumberString);
    final tNumberTrivia = NumberTrivia(number:1, text:'test trivia');

    test("should call the InputConverter to validate & convert the string to an unsigned int", () async{
      // arrange
      when(mockInputConverter.stringToUnsignedInteger(any)).thenReturn(Right(tNumberParsed));
      // act
      bloc.add(GetTriviaForConcreteNumber(tNumberString));
      await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
      // assert
      verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
    });

    test("should emit [ERROR] when the input is invalid", () async {
      // arrange
      when(mockInputConverter.stringToUnsignedInteger(any)).thenReturn(Left(InvalidInputFailure()));
      // assert later
      final expected = [
        Empty(),
        Error(message: INVALID_INPUT_FAILURE)
      ];
      expectLater(bloc.state, emitsInOrder(expected));
      // act
      bloc.add(GetTriviaForConcreteNumber(tNumberString));
    });
  });
}
