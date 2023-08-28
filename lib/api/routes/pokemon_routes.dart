import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class PokemonRoutesProtocol {
  void getAllPokemons({
    required int offset,
    required int limit,
    Success? success,
    Failure? failure,
  });
}

class PokemonRoutes extends PokemonRoutesProtocol {
  final apiProvider = ApiProvider();

  @override
  void getAllPokemons({
    required int offset,
    required int limit,
    Success? success,
    Failure? failure,
  }) {
    final endpoint = Endpoint(
      path: '/pokemon',
      method: 'GET',
      queryParameters: {
        'offset': offset.toString(),
        'limit': limit.toString(),
      },
    );

    apiProvider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
