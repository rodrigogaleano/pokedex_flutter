import 'package:flutter/material.dart';

import '../../support/components/cached_image.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/localize.dart';
import 'components/pokemon_info_item/pokemon_info_item_view.dart';
import 'components/pokemon_stat_item/pokemon_stat_item_view.dart';
import 'components/pokemon_type_item/pokemon_type_item.dart';

abstract class PokemonDetailsViewModelProtocol extends ChangeNotifier {
  String get name;
  String get number;
  bool get isLoading;
  String get imagePath;
  String get height;
  String get weight;
  List<PokemonTypeItemViewModelProtocol> get pokemonTypeList;
  List<PokemonStatItemViewModelProtocol> get pokemonStatList;

  void didTapBack();
}

class PokemonDetailsView extends StatelessWidget {
  final PokemonDetailsViewModelProtocol viewModel;

  const PokemonDetailsView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return _bodyWidget(l10n);
        },
      ),
    );
  }

  Widget _bodyWidget(l10n) {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // TODO: Implementar placeholder de erro

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            onPressed: viewModel.didTapBack,
            icon: const Icon(Icons.arrow_back_ios),
            color: AppColors.black,
          ),
          title: Column(
            children: [
              Text(
                viewModel.name,
                style: AppFonts.robotoBold(24, AppColors.black),
              ),
              Text(
                viewModel.number,
                style: AppFonts.robotoNormal(16, AppColors.black),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.lightBlue02,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CachedImage(url: viewModel.imagePath),
          ),
        ),
        SliverFillRemaining(
          child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  tabs: [
                    Text(
                      l10n.pokemonDetailsTabAboutLabel,
                      style: AppFonts.robotoSemiBold(22, AppColors.black),
                    ),
                    Text(
                      l10n.pokemonDetailsTabStatsLabel,
                      style: AppFonts.robotoSemiBold(22, AppColors.black),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _aboutTabBarView(l10n),
                      _statTabBarView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _aboutTabBarView(l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Wrap(
            children: viewModel.pokemonTypeList.map((viewModel) {
              return PokemonTypeItem(viewModel: viewModel);
            }).toList(),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PokemonInfoItem(
                icon: Icons.balance,
                label: l10n.pokemonDetailsWeightLabel,
                value: viewModel.weight,
              ),
              PokemonInfoItem(
                icon: Icons.height,
                label: l10n.pokemonDetailsHeightLabel,
                value: viewModel.height,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statTabBarView() {
    return ListView.builder(
      itemCount: viewModel.pokemonStatList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        final pokemonStatViewModel = viewModel.pokemonStatList[index];

        return PokemonStatItemView(viewModel: pokemonStatViewModel);
      },
    );
  }
}
