import 'dart:convert';

import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'test text');

  test('Should be a subclass of number trivia entity', () async {
    // arrage

    // act

    // assert
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('Should return a valid model if the JSON number is integer', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      // act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // assert
      expect(result, tNumberTriviaModel);
    });

    test('Should return a valid model if the JSON number is double', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));
      // act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // assert
      expect(result, tNumberTriviaModel);
    });
  });

  group('toJson', () {
    test('Should return json map contianing a proper data', () async {
      // arrange
      // act
      final result = tNumberTriviaModel.toJson();
      // assert
      final expectedMap = {"text": "test text", "number": 1};
      expect(result, expectedMap);
    });
  });
}
