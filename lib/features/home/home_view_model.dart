import 'package:flutter/material.dart';

import 'components/pokemon_item/pokemon_item_view.dart';
import 'components/pokemon_item/pokemon_item_view_model.dart';
import 'home_view_controller.dart';
import 'models/pokemon.dart';
import 'use_cases/get_pokemons_use_case.dart';

class HomeViewModel extends HomeViewProtocol implements PokemonItemDelegate {
  int _currentPage = 0;
  bool _isLoading = false;
  String _errorMessage = '';
  bool _isLoadingMore = false;
  bool _isFloatingButtonVisible = false;

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
  String get errorMessage => _errorMessage;

  @override
  bool get isFloatingButtonVisible => _isFloatingButtonVisible;

  @override
  ScrollController get scrollController => _scrollController;

  @override
  List<PokemonItemViewModelProtocol> get pokemonsViewModels {
    return _pokemons.map((pokemon) {
      return PokemonItemViewModel(pokemon: pokemon, delegate: this);
    }).toList();
  }

  @override
  void getPokemons() {
    if (_currentPage == 0) _setLoading(true);
    getPokemonsUseCase.execute(
      offset: _currentPage * _pokemonsPerPage,
      limit: _pokemonsPerPage,
      success: (pokemons) => _handleGetPokemonsSuccess(pokemons),
      failure: (error) => _handleGetPokemonsFailure(error.description),
    );
  }

  @override
  void didTapPokemon(int pokemonId) {
    onTapPokemon?.call(pokemonId);
  }

  @override
  void didTapBackToTop() {
    _scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void _handleGetPokemonsSuccess(pokemons) {
    _pokemons.addAll(pokemons);
    _currentPage++;
    _setLoading(false);
    _setLoadingMore(false);
  }

  void _handleGetPokemonsFailure(error) {
    _setLoading(false);
    _errorMessage = error;
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

    if (_scrollController.offset >= 200 && !_isFloatingButtonVisible) {
      _isFloatingButtonVisible = true;
      notifyListeners();
    }

    if (_scrollController.offset < 200 && _isFloatingButtonVisible) {
      _isFloatingButtonVisible = false;
      notifyListeners();
    }
  }
}
