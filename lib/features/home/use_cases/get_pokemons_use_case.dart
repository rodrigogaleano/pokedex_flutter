import 'dart:convert';

import '../../../api/routes/pokemon_routes.dart';
import '../../../models/pokemon.dart';
import '../../../models/server_error.dart';

typedef Success = void Function(List<Pokemon> pokemons);
typedef Failure = void Function(ServerError error);

abstract class GetPokemonsUseCaseProtocol {
  void execute({Success? success, Failure? failure});
}

class GetPokemonsUseCase extends GetPokemonsUseCaseProtocol {
  final PokemonRoutes route;

  GetPokemonsUseCase({required this.route});

  @override
  void execute({Success? success, Failure? failure}) {
    route.getPokemons(
      success: (response) {
        try {
          final pokemons = Pokemon.fromMaps(jsonDecode(response)['pokemon']);
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
