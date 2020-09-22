import 'package:capp/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  InputConverter inputConverter;

  setUp((){
    inputConverter = InputConverter();
  });

  group("stringToUnsignedInt", (){
    test("should return an integer when the string represents an unsigned integer", () async {
      // arrange
      final str = '123';
      // act
      final result = inputConverter.stringToUnsignedInteger(str);
      // assert
      expect(result, Right(123));
    });
  });
}