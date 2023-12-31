import 'package:flutter/material.dart';

import '../../support/components/cached_image.dart';
import '../../support/components/screen_placeholder.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/localize.dart';
import 'components/pokemon_details_loading_placeholder.dart';
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
      body: SafeArea(
        child: AnimatedBuilder(
          animation: viewModel,
          builder: (_, __) {
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
                ..._bodyWidget(l10n),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _bodyWidget(l10n) {
    if (viewModel.isLoading) {
      return [const PokemonDetailsLoadingPlaceholder()];
    }

    if (viewModel.errorMessage.isNotEmpty) {
      return [ScreenPlaceholder(label: viewModel.errorMessage)];
    }

    return [
      SliverToBoxAdapter(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: CachedImage(
              url: viewModel.imagePath,
              fit: BoxFit.none,
            ),
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
                      _statTabBarView,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }

  Widget _aboutTabBarView(l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: Wrap(
              children: viewModel.pokemonTypeList.map((viewModel) {
                return PokemonTypeItem(viewModel: viewModel);
              }).toList(),
            ),
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

  Widget get _statTabBarView {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        itemCount: viewModel.pokemonStatList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          final pokemonStatViewModel = viewModel.pokemonStatList[index];

          return PokemonStatItemView(viewModel: pokemonStatViewModel);
        },
      ),
    );
  }
}
