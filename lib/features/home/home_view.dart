import 'package:flutter/material.dart';

import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/localize.dart';
import 'components/pokemon_item/pokemon_item_view.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  bool get isLoading;
  List<PokemonItemViewModelProtocol> get pokemonsViewModels;
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AnimatedBuilder(
            animation: viewModel,
            builder: (_, __) {
              return _bodyWidget(l10n);
            },
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget(l10n) {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            l10n.appTitle,
            style: AppFonts.robotoBold(32, AppColors.black),
          ),
          centerTitle: false,
          backgroundColor: AppColors.lightBlue,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: viewModel.pokemonsViewModels.length,
              (_, index) {
                final pokemonItemViewModel = viewModel.pokemonsViewModels[index];

                return PokemonItemView(
                  viewModel: pokemonItemViewModel,
                  pokemonId: index + 1,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
