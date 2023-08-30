import '../models/pokemon_type.dart';
import 'pokemon_type_item.dart';

class PokemonTypeItemViewModel extends PokemonTypeItemViewModelProtocol {
  final PokemonType type;

  PokemonTypeItemViewModel({required this.type});

  @override
  String get typeName => type.name;
}
