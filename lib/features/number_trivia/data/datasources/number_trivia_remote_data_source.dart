import 'dart:convert';

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
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    final jsonString = await client.get('http://numbersapi.com/$number',
        headers: {'Content-type': 'application/json'});
    return NumberTriviaModel.fromJson(json.decode(jsonString.body));
  }

  @override
  Future<NumberTrivia> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }
}
