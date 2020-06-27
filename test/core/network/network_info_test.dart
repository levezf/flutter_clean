import 'package:flutter_clean/core/network/network_info.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker{}

void main(){

  NetworkInfoImpl networkInfo;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp((){
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker); 
  });

  group('isConnected', (){
    test('consegue chamar DataConnectionChecker.hasConnection', 
    ()async{

      final tHasConnectionFuture = Future.value(true); 

      when(mockDataConnectionChecker.hasConnection).thenAnswer((_) => tHasConnectionFuture);
      
      final result = networkInfo.isConnected;

      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });

}