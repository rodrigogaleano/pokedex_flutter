import '../../../api/routes/pokemon_routes.dart';
import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../pokemon_details_view_controller.dart';
import '../pokemon_details_view_model.dart';
import '../use_cases/get_pokemon_details_use_case.dart';

class PokemonDetailsModule extends AppModule {
  static const String pokemonDetailsRoute = '/pokemonDetailsRoute';

  @override
  void registerDependencies() {
    // Use Cases
    ServiceLocator.registerFactory<GetPokemonDetailsUseCaseProtocol>(() {
      return GetPokemonDetailsUseCase(routes: ServiceLocator.get<PokemonRoutesProtocol>());
    });

    ServiceLocator.registerFactoryParam<PokemonDetailsProtocol, int>((arguments) {
      return PokemonDetailsViewModel(
        pokemonId: arguments,
        getPokemonDetailsUseCase: ServiceLocator.get<GetPokemonDetailsUseCaseProtocol>(),
      );
    });
  }
}
