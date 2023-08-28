import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class PokemonRoutesProtocol {
  void getPokemons({Success? success, Failure? failure});
}

class PokemonRoutes extends PokemonRoutesProtocol {
  final apiProvider = ApiProvider();

  @override
  void getPokemons({Success? success, Failure? failure}) {
    final endpoint = Endpoint(
      path: '/pokedex.json',
      method: 'GET',
    );

    apiProvider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
