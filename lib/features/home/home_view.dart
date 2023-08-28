import 'package:flutter/material.dart';

import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/localize.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  l10n.appTitle,
                  style: AppFonts.robotoBold(32, AppColors.black),
                ),
                floating: true,
                centerTitle: false,
                backgroundColor: AppColors.lightBlue,
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    return Container(
                      alignment: Alignment.center,
                      color: AppColors.black,
                      height: 80,
                    );
                  },
                  childCount: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
