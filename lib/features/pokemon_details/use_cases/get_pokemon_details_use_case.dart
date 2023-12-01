import '../../../api/routes/pokemon_routes.dart';
import '../../../models/server_error.dart';
import '../models/pokemon_details.dart';

typedef Success = void Function(PokemonDetails pokemonDetails);
typedef Failure = void Function(ServerError error);

abstract class GetPokemonDetailsUseCaseProtocol {
  void execute({required int pokemonId, Success? success, Failure? failure});
}

class GetPokemonDetailsUseCase extends GetPokemonDetailsUseCaseProtocol {
  final PokemonRoutesProtocol routes;

  GetPokemonDetailsUseCase({required this.routes});

  @override
  void execute({required int pokemonId, Success? success, Failure? failure}) {
    routes.getPokemonDetails(
      pokemonId: pokemonId,
      success: (response) {
        try {
          final pokemonDetails = PokemonDetails.fromMap(response);
          success?.call(pokemonDetails);
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
