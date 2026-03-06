import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/modules/explore/explore_view.dart';
import 'package:movies_app/modules/home/home_view.dart';

import '../../models/layout_data.dart';
import '../profile/profile_view.dart';
import '../search/search_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeView(),
    SearchView(),
    ExploreView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: LayoutData.items
              .map(
                (item) => BottomNavigationBarItem(
                  icon: SvgPicture.asset(item.icon),
                  activeIcon: SvgPicture.asset(item.activeIcon),
                  label: item.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
