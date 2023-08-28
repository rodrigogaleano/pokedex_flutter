import '../../models/pokemon.dart';
import 'components/pokemon_item/pokemon_item_view.dart';
import 'components/pokemon_item/pokemon_item_view_model.dart';
import 'home_view_controller.dart';
import 'use_cases/get_pokemons_use_case.dart';

class HomeViewModel extends HomeViewProtocol {
  bool _isLoading = false;
  List<Pokemon> _pokemons = [];

  final GetPokemonsUseCaseProtocol getPokemonsUseCase;

  HomeViewModel({required this.getPokemonsUseCase});

  @override
  bool get isLoading => _isLoading;

  @override
  List<PokemonItemViewModelProtocol> get pokemonsViewModels {
    return _pokemons.map((pokemon) {
      return PokemonItemViewModel(pokemon: pokemon);
    }).toList();
  }

  @override
  void getPokemons() {
    _setLoading(true);
    getPokemonsUseCase.execute(
      success: (pokemons) {
        _pokemons = pokemons;
        _setLoading(false);
      },
      failure: (error) {
        print(error.description);
        _setLoading(false);
      },
    );
  }

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    print('Loading: $_isLoading');
    notifyListeners();
  }
}
