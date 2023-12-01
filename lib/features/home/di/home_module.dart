import '../../../api/routes/pokemon_routes.dart';
import '../../../support/utils/service_locator/app_module.dart';
import '../../../support/utils/service_locator/service_locator.dart';
import '../home_view_controller.dart';
import '../home_view_model.dart';
import '../use_cases/get_pokemons_use_case.dart';

class HomeModule extends AppModule {
  static const String homeRoute = '/home';

  @override
  void registerDependencies() {
    // Routes
    ServiceLocator.registerFactory<PokemonRoutesProtocol>(() => PokemonRoutes());

    // Use Cases
    ServiceLocator.registerFactory<GetPokemonsUseCaseProtocol>(() {
      return GetPokemonsUseCase(route: ServiceLocator.get<PokemonRoutesProtocol>());
    });

    ServiceLocator.registerFactory<HomeProtocol>(() {
      return HomeViewModel(getPokemonsUseCase: ServiceLocator.get<GetPokemonsUseCaseProtocol>());
    });
  }
}
