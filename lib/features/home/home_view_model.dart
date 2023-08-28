import 'package:flutter/src/widgets/scroll_controller.dart';

import '../../models/pokemon.dart';
import 'components/pokemon_item/pokemon_item_view.dart';
import 'components/pokemon_item/pokemon_item_view_model.dart';
import 'home_view_controller.dart';
import 'use_cases/get_pokemons_use_case.dart';

class HomeViewModel extends HomeViewProtocol {
  bool _isLoading = false;
  bool _isLoadingMore = false;
  int _currentPage = 0;

  final int _pokemonsPerPage = 20;
  final List<Pokemon> _pokemons = [];
  final _scrollController = ScrollController();
  final GetPokemonsUseCaseProtocol getPokemonsUseCase;

  HomeViewModel({required this.getPokemonsUseCase}) {
    _scrollController.addListener(_scrollListener);
  }

  @override
  bool get isLoading => _isLoading;

  @override
  bool get isLoadingMore => _isLoadingMore;

  @override
  ScrollController get scrollController => _scrollController;

  @override
  List<PokemonItemViewModelProtocol> get pokemonsViewModels {
    return _pokemons.map((pokemon) {
      return PokemonItemViewModel(pokemon: pokemon);
    }).toList();
  }

  @override
  void getPokemons() {
    if (_currentPage == 0) _setLoading(true);
    getPokemonsUseCase.execute(
      offset: _currentPage * _pokemonsPerPage,
      limit: _pokemonsPerPage,
      success: (pokemons) => _handleGetPokemonsSuccess(pokemons),
      failure: (error) => _handleGetPokemonsFailure(error),
    );
  }

  void _handleGetPokemonsSuccess(pokemons) {
    _pokemons.addAll(pokemons);
    _currentPage++;
    _setLoading(false);
    _setLoadingMore(false);
  }

  void _handleGetPokemonsFailure(error) {
    _setLoading(false);
    _setLoadingMore(false);
  }

  void _setLoading(bool loadingStatus) {
    _isLoading = loadingStatus;
    notifyListeners();
  }

  void _setLoadingMore(bool loadingStatus) {
    _isLoadingMore = loadingStatus;
    notifyListeners();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent * 0.90 &&
        !_isLoading &&
        !_isLoadingMore) {
      _setLoadingMore(true);
      getPokemons();
    }
  }
}