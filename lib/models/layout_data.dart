import '../core/gen/assets.gen.dart';

class LayoutItem {
  final String label;
  final String icon;
  final String activeIcon;
  final String route;

  const LayoutItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
  });
}

class LayoutData {
  static List<LayoutItem> items = [
    LayoutItem(
      label: 'Home',
      icon: Assets.icons.home.path,
      activeIcon: Assets.icons.homeActive.path,
      route: '/home',
    ),
    LayoutItem(
      label: 'Search',
      icon: Assets.icons.search.path,
      activeIcon: Assets.icons.searchActive.path,
      route: '/search',
    ),
    LayoutItem(
      label: 'Explore',
      icon: Assets.icons.explore.path,
      activeIcon: Assets.icons.exploreActive.path,
      route: '/explore',
    ),
    LayoutItem(
      label: 'Profile',
      icon: Assets.icons.profile.path,
      activeIcon: Assets.icons.profile.path,
      route: '/profile',
    ),
  ];
}
