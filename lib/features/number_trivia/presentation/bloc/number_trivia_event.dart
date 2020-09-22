part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent();
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent{
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString);
  @override
  List<Object> get props => [numberString];
}

class GetTriviaForRandomNumber extends NumberTriviaEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}