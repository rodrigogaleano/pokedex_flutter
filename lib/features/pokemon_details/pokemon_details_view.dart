import 'package:flutter/material.dart';

import '../../support/components/cached_image.dart';
import '../../support/components/screen_placeholder.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/localize.dart';
import 'components/pokemon_info_item/pokemon_info_item_view.dart';
import 'components/pokemon_stat_item/pokemon_stat_item_view.dart';
import 'components/pokemon_type_item/pokemon_type_item.dart';

abstract class PokemonDetailsViewModelProtocol extends ChangeNotifier {
  String get name;
  String get number;
  String get height;
  String get weight;
  bool get isLoading;
  String get imagePath;
  String get errorMessage;

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

    if (viewModel.errorMessage.isNotEmpty) {
      return ScreenPlaceholder(label: viewModel.errorMessage);
    }

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: AppColors.darkBlue,
          leading: IconButton(
            onPressed: viewModel.didTapBack,
            icon: const Icon(Icons.arrow_back_ios),
            color: AppColors.white,
          ),
          title: Column(
            children: [
              Text(
                viewModel.name,
                style: AppFonts.robotoBold(24, AppColors.white),
              ),
              Text(
                viewModel.number,
                style: AppFonts.robotoNormal(16, AppColors.white),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(20),
            color: AppColors.darkBlue,
            child: CachedImage(
              url: viewModel.imagePath,
              height: 128,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SliverFillRemaining(
          child: DefaultTabController(
            length: 2,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    labelColor: AppColors.black,
                    indicatorColor: Colors.transparent,
                    labelStyle: AppFonts.robotoSemiBold(20),
                    unselectedLabelStyle: AppFonts.robotoNormal(20),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    tabs: [
                      Text(
                        l10n.pokemonDetailsTabAboutLabel,
                      ),
                      Text(
                        l10n.pokemonDetailsTabStatsLabel,
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
