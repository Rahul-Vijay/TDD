import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:capp/core/util/input_converter.dart';
import 'package:capp/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:capp/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:capp/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

const String SERVER_FAILURE_MESSAGE = "Server Failure";
const String CACHE_FAILURE_MESSAGE = "Cache Failure";
const String INVALID_INPUT_FAILURE = "Invalid Input - The number must be a positive integer or 0";

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc(
      {@required GetConcreteNumberTrivia concrete,
      @required GetRandomNumberTrivia random,
      @required this.inputConverter})
      : assert(concrete != null),
        assert(random != null),
        getConcreteNumberTrivia = concrete,
        getRandomNumberTrivia = random,
        super(null);

  NumberTriviaState get initialState => Empty();

  @override
  Stream<NumberTriviaState> mapEventToState(
    NumberTriviaEvent event,
  ) async* {
    if (event is GetTriviaForConcreteNumber) {
      inputConverter.stringToUnsignedInteger(event.numberString);
    }
  }
}
