import 'package:injectable/injectable.dart';
import '../../../../core/network/api_client.dart';
import '../models/character_model.dart';

abstract class IApiRemoteDataSource {
  Future<List<CharacterModel>> getCharacters();
  Future<List<CharacterModel>> searchCharacters(String query);
}

@Injectable(as: IApiRemoteDataSource)
class ApiRemoteDataSource implements IApiRemoteDataSource {
  final ApiClient _apiClient;

  ApiRemoteDataSource(this._apiClient);

  @override
  Future<List<CharacterModel>> getCharacters() async {
    final response = await _apiClient.client.get('/character');
    final results = response.data['results'] as List;
    return results
        .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<CharacterModel>> searchCharacters(String query) async {
    final response = await _apiClient.client.get(
      '/character',
      queryParameters: {'name': query},
    );
    final results = response.data['results'] as List;
    return results
        .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
