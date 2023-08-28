import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class PokemonRoutesProtocol {
  void getAllPokemons({Success? success, Failure? failure});
}

class PokemonRoutes extends PokemonRoutesProtocol {
  final apiProvider = ApiProvider();

  @override
  void getAllPokemons({Success? success, Failure? failure}) {
    final endpoint = Endpoint(
      path: '/pokemon',
      method: 'GET',
    );

    apiProvider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
