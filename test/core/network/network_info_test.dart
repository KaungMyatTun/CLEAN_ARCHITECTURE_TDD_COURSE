import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/core/network/network_info.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfoImpl;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('is Connected', () {
    test('should forward to the call data connection checker.has connection',
        () async {
      // arrange
      final tHasConnectionFuture = Future.value(true);
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);
      // act
      final result = await networkInfoImpl.isConnected;
      // assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, true);
    });
  });
}
