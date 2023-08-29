import 'package:flutter/material.dart';

import '../../support/style/app_assets.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/localize.dart';
import 'components/home_loading_placeholder.dart';
import 'components/pokemon_item/pokemon_item_view.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  bool get isLoading;
  bool get isLoadingMore;
  String get errorMessage;
  ScrollController get scrollController;
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
              return CustomScrollView(
                controller: viewModel.scrollController,
                slivers: [
                  SliverAppBar(
                    title: Text(
                      l10n.appTitle,
                      style: AppFonts.robotoBold(32, AppColors.black),
                    ),
                    centerTitle: false,
                    backgroundColor: AppColors.lightBlue,
                  ),
                  _bodyWidget(l10n),
                  SliverToBoxAdapter(child: _loadingMoreWidget),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget(l10n) {
    if (viewModel.isLoading) {
      return const HomeLoadingPlaceholder();
    }

    if (viewModel.errorMessage.isNotEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            const Spacer(),
            Text(
              viewModel.errorMessage,
              style: AppFonts.robotoSemiBold(16, AppColors.black),
            ),
            const Spacer(),
          ],
        ),
      );
    }

    if (viewModel.pokemonsViewModels.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              AppAssets.icPlaceholder,
              width: 96,
              height: 96,
            ),
            Text(
              l10n.pokemonsEmptyLabel,
              style: AppFonts.robotoSemiBold(16, AppColors.black),
            ),
            const Spacer(),
          ],
        ),
      );
    }

    return SliverPadding(
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
    );
  }

  Widget get _loadingMoreWidget {
    if (viewModel.isLoadingMore) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
