import 'dart:convert';

import 'package:capp/core/error/exception.dart';
import 'package:capp/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:capp/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTrivia> getConcreteNumberTrivia(int number);
  Future<NumberTrivia> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({@required this.client});
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _getTriviaFromURL('http://numbersapi.com/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() =>
      _getTriviaFromURL('http://numbersapi.com/random');

  Future<NumberTriviaModel> _getTriviaFromURL(String url) async {
    final response =
        await client.get(url, headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200)
      return NumberTriviaModel.fromJson(json.decode(response.body));
    else
      throw ServerException();
  }
}
