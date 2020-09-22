import 'dart:convert';

import 'package:capp/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:capp/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

/// Mocking the http client package

class MockHttpClient extends Mock implements http.Client {}

void main() {
  NumberTriviaRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });

  group("getConcreteNumberTrivia", () {
    final tNumber = 1;

    test("should perform a GET request on a URL with number being the endpoint",
        () {
      // arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
      // act
      dataSource.getConcreteNumberTrivia(tNumber);
      // assert
      verify(mockHttpClient.get(
        'http://numbersapi.com/$tNumber',
        headers: {'Content-type': 'application/json'},
      ));
    });

    final tNumberTriviaModel = NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));

    test("should return a NumberTrivia Object on 200(success)",
        () async {
      // arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
      // act
      final result = await dataSource.getConcreteNumberTrivia(tNumber);
      // assert
      expect(result, equals(tNumberTriviaModel));
    });
  });
}
