import 'package:marvel_app/app/modules/home/repositories/home_repository_interface.dart';
import 'package:marvel_app/app/shared/models/api_response.dart';
import 'package:mockito/mockito.dart';

class HomeRepositoryMock extends Mock implements IHomeRepository {

  @override
  Future<ApiResponse> getCharactersList() {
    return null;
  }
}