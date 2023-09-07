import '../../support/extensions/string.dart';
import 'components/pokemon_stat_item/pokemon_stat_item_view.dart';
import 'components/pokemon_stat_item/pokemon_stat_item_view_model.dart';
import 'components/pokemon_type_item/pokemon_type_item.dart';
import 'components/pokemon_type_item/pokemon_type_item_view_model.dart';
import 'models/pokemon_details.dart';
import 'pokemon_details_view_controller.dart';
import 'use_cases/get_pokemon_details_use_case.dart';

class PokemonDetailsViewModel extends PokemonDetailsProtocol {
  bool _isLoading = false;
  String _errorMessage = '';
  PokemonDetails? _pokemonDetails;

  final int pokemonId;
  final GetPokemonDetailsUseCaseProtocol getPokemonDetailsUseCase;

  PokemonDetailsViewModel({
    required this.pokemonId,
    required this.getPokemonDetailsUseCase,
  });

  @override
  bool get isLoading => _isLoading;

  @override
  String get errorMessage => _errorMessage;

  @override
  String get name => _pokemonDetails?.name.formattedName() ?? '';

  @override
  String get number => _pokemonDetails?.id.toString().padLeft(3, '0') ?? '';

  @override
  String get imagePath => '${_pokemonDetails?.imagePath}$pokemonId.gif' ?? '';

  @override
  String get height => _pokemonDetails?.convertedHeigh ?? '';

  @override
  String get weight => _pokemonDetails?.convertedWeight ?? '';

  @override
  List<PokemonTypeItemViewModelProtocol> get pokemonTypeList {
    return _pokemonDetails?.types?.map((type) {
          return PokemonTypeItemViewModel(type: type);
        }).toList() ??
        [];
  }

  @override
  List<PokemonStatItemViewModelProtocol> get pokemonStatList {
    return _pokemonDetails?.stats.map((stat) {
          return PokemonStatItemViewModel(pokemonStat: stat);
        }).toList() ??
        [];
  }

  @override
  void getPokemonDetails() {
    _setLoading(true);
    getPokemonDetailsUseCase.execute(
      pokemonId: pokemonId,
      success: (pokemonDetails) {
        _pokemonDetails = pokemonDetails;
        _setLoading(false);
      },
      failure: (error) {
        _errorMessage = error.description;
        _setLoading(false);
      },
    );
  }

  @override
  void didTapBack() {
    onTapBack?.call();
  }

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    notifyListeners();
  }
}
