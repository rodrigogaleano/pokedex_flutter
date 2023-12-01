import '../../../api/routes/pokemon_routes.dart';
import '../../../models/server_error.dart';
import '../models/pokemon.dart';

typedef Success = void Function(List<Pokemon> pokemons);
typedef Failure = void Function(ServerError error);

abstract class GetPokemonsUseCaseProtocol {
  void execute({
    required int offset,
    required int limit,
    Success? success,
    Failure? failure,
  });
}

class GetPokemonsUseCase extends GetPokemonsUseCaseProtocol {
  final PokemonRoutesProtocol route;

  GetPokemonsUseCase({required this.route});

  @override
  void execute({
    required int offset,
    required int limit,
    Success? success,
    Failure? failure,
  }) {
    route.getAllPokemons(
      offset: offset,
      limit: limit,
      success: (response) {
        try {
          final pokemons = Pokemon.fromMaps(response['results']);
          success?.call(pokemons);
        } on Error catch (error) {
          failure?.call(error.internalError());
        }
      },
      failure: (error) {
        failure?.call(error.asServerError());
      },
    );
  }
}
