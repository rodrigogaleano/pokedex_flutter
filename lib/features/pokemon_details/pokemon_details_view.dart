import 'package:flutter/material.dart';

import '../../support/style/app_assets.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import 'components/pokemon_type_item.dart';

abstract class PokemonDetailsViewModelProtocol extends ChangeNotifier {
  String get name;
  String get number;
  bool get isLoading;
  List<PokemonTypeItemViewModelProtocol> get pokemonTypeList;

  void didTapBack();
}

class PokemonDetailsView extends StatelessWidget {
  final PokemonDetailsViewModelProtocol viewModel;

  const PokemonDetailsView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: viewModel,
          builder: (_, __) {
            return _bodyWidget;
          }),
    );
  }

  Widget get _bodyWidget {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            onPressed: () => viewModel.didTapBack(),
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
            child: Image.asset(AppAssets.icPlaceholder),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sobre',
                  style: AppFonts.robotoSemiBold(20, AppColors.black),
                ),
                Wrap(
                  children: viewModel.pokemonTypeList.map((viewModel) {
                    return PokemonTypeItem(viewModel: viewModel);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
