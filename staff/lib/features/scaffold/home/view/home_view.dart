import 'package:flutter/material.dart';
import 'package:package_core/package_core.dart';

import '../../../../app/app_constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(title: Text("Trang Huy Logistics")),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingContent),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 10),

              SizedBox(height: kBottomNavigationBarHeight * (Globals.isIos ? 2.3 : 1.5)),
            ]),
          ),
        ),
      ],
    );
  }
}
